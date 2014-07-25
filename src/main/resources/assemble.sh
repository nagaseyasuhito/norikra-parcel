#!/bin/sh

pushd .
cd ${project.build.directory}

jruby-${jruby.version}/bin/jruby -S gem install --install-dir jruby-${jruby.version}/lib/ruby/gems/shared norikra -v ${norikra.version}
mkdir ${project.build.finalName}
cp -a jruby-${jruby.version}/* classes/meta ${project.build.finalName}
tar zcf ${project.build.finalName}.tar.gz ${project.build.finalName}

mkdir repository
for i in el5 el6 sles11 lucid precise squeeze wheezy; do
	cp ${project.build.finalName}.tar.gz repository/${project.build.finalName}-$i.parcel
done

cd repository
curl https://raw.githubusercontent.com/cloudera/cm_ext/master/make_manifest/make_manifest.py | python

popd
