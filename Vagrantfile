Vagrant.configure(2) do |config|
  config.vm.box = "https://cloud-images.ubuntu.com/vagrant/wily/current/wily-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network "forwarded_port", guest: 19132, host: 19132
 
config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get --assume-yes install clang libicu-dev
    curl -O https://swift.org/builds/swift-3.0-preview-2/ubuntu1510/swift-3.0-PREVIEW-2/swift-3.0-PREVIEW-2-ubuntu15.10.tar.gz
    tar zxvf swift-3.0-PREVIEW-2-ubuntu15.10.tar.gz
    mv swift-3.0-PREVIEW-2-ubuntu15.10 swift
    rm swift-3.0-PREVIEW-2-ubuntu15.10.tar.gz
    sudo chown -R vagrant:vagrant swift
    echo "export PATH=/home/vagrant/swift/usr/bin:\"${PATH}\"" >> .profile
    echo "Swift has successfully installed on Linux"
  SHELL
end