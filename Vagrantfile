Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty64'

  # Install docker
  config.vm.provision :docker

  # Install docker-compose
  config.vm.provision :shell, inline: <<-EOC
    test -e /usr/local/bin/docker-compose || \\
    curl -L https://github.com/docker/compose/releases/download/1.5.1/docker-compose-`uname -s`-`uname -m` \\
      | sudo tee /usr/local/bin/docker-compose > /dev/null
    sudo chmod +x /usr/local/bin/docker-compose
    test -e /etc/bash_completion.d/docker-compose || \\
    curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose --version \\
      | awk 'NR==1{print $NF}')/contrib/completion/bash/docker-compose \\
      | sudo tee /etc/bash_completion.d/docker-compose > /dev/null
  EOC

  config.vm.network 'public_network'
  config.vm.network 'forwarded_port', guest: 80, host: 80

  config.vm.provision :shell, inline: <<-EOC
    ./mkdirs.sh
    docker-compose pull
    docker-compose build
    docker-compose stop
    docker-compose rm -f
    docker-compose up -d
  EOC

  config.vm.provider 'virtualbox' do |vb|
    vb.cpus = 1
    vb.memory = 256
  end
end
