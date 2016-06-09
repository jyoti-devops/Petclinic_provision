#
# Cookbook Name:: chef-jmxtrans
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "wget"
# package "jmxtrans-247.deb"

execute 'jmxtrans download' do
	cwd '/tmp'
  command 'wget http://central.maven.org/maven2/org/jmxtrans/jmxtrans/247/jmxtrans-247.deb'
  end

  execute 'jmxtrans install' do
	cwd '/tmp'
  command 'dpkg -i jmxtrans-247.deb '
  end
 
remote_file '/usr/share/jmxtrans/bin/jmxtrans-all.jar' do
  source 'http://central.maven.org/maven2/org/jmxtrans/jmxtrans/247/jmxtrans-247-all.jar'
  # command " mv jmxtrans-247-all.jar jmxtrans-all.jar"
  action :create
end

template '/usr/share/jmxtrans/bin/sample.json' do
  source 'sample.json.erb'
end

execute 'start jmxtrans' do
	cwd '/usr/share/jmxtrans/bin'
	command "./jmxtrans.sh start sample.json "
end
