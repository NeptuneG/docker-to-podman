Vagrant.configure('2') do |config|
  config.vm.box = 'fedora/35-cloud-base'

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end
  config.vm.provision :shell, inline: 'cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime'

  config.vm.provision :shell, path: 'setup.sh', args: '3.0.2', privileged: false
  config.vm.provision :shell, path: 'setup_zsh.sh', privileged: false
  config.vm.provision :file, source: '.zshrc', destination: '$HOME/.zshrc'
  config.vm.provision :file, source: '.p10k.zsh', destination: '$HOME/.p10k.zsh'

  # config.vm.provision :shell, path: 'expose_podman.sh'

  config.vm.provision :shell, inline: 'setenforce 0', run: 'always'
  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  config.vm.network 'forwarded_port', guest: 5432, host: 5432
end
