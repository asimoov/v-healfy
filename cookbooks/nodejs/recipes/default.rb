node.default['npm']['packages'] = ['grunt-cli', 'pg', 'sequelize']
node.default['nodejs']['project'] = "/home/vagrant/healfy"

apt_package 'nodejs' do
  action :install
end

node.default['npm']['packages'].each do |p|
  execute "npm install #{p}" do
    command "npm install -g #{p}"
  end
end

execute "npm install healfy" do
  command "cd #{node.default['nodejs']['project']} && npm install --no-bin-links && sequelize -m"
end

