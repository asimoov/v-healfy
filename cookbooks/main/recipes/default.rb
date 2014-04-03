node.default['system']['packages'] = ['build-essential', 'curl', 'git', 'vim']

execute "apt-get update" do
  command "apt-get update"
end

apt_package "python-software-properties" do
  action :install
end

execute "add-apt-repository" do
  command "add-apt-repository ppa:chris-lea/node.js"
end

execute "apt-get update" do
  command "apt-get update"
end

node['system']['packages'].each do |p|
  apt_package p do
    action :install
  end
end

include_recipe 'postgresql'
include_recipe 'nodejs'
