['postgresql-9.1', 'libpq-dev', 'postgresql-contrib-9.1'].each do |p|
  apt_package p do
    action :install
  end
end

service "postgresql" do
  action [ :enable, :start ]
end

execute "change postgresql.conf " do
  command 'sed -i "s/#listen_addresses = \'localhost\'/listen_addresses = \'*\'/" /etc/postgresql/9.1/main/postgresql.conf'
end

execute "change postgresql.conf " do
  command 'echo "host    all         all         0.0.0.0/0             md5" >> /etc/postgresql/9.1/main/pg_hba.conf'
end

service "postgresql" do
  action [ :reload ]
end

execute "Criando o usuarios " do
  command 'sudo -u postgres psql postgres -c "CREATE USER healfy WITH PASSWORD \'healfy\';"'
end

execute "Criando o database do Banco " do
  command 'sudo -u postgres psql postgres -c "CREATE DATABASE healfy_development WITH OWNER healfy;"'
end



