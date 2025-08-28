#
# Cookbook:: cr_docker-ce
# Recipe:: default
#
# Copyright:: 2025, Remi BONNET, GPL v3.

if platform_family?('windows')
  # if node['product_type'] == 'Server'
  #   windows_feature 'feature_name' do
  #     action :install
  #   end
  # end

  windows_feature 'WSL' do
    feature_name %w(Microsoft-Windows-Subsystem-Linux VirtualMachinePlatform)
    notifies :request_reboot, 'reboot[WSL-reboot]'
  end

  reboot 'WSL-reboot'

  # batch 'wsl.exe --install --no-distribution' do
  #   architecture :x86_64
  #   code <<-EOH
  #   wsl --set-default-version 2
  #   wsl --install --no-distribution
  #   EOH
  #   not_if 'wsl.exe --status'
  #   ignore_failure true
  # end

  windows_package 'WSL' do
    source "https://github.com/microsoft/WSL/releases/download/2.5.10/wsl.2.5.10.0.x64.msi"
    action :install
    installer_type :msi
  end

  windows_package 'Docker Desktop' do
    action :install
    source 'https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe'
    installer_type :custom
    options 'install --quiet --accept-license'
  end
  
else
  docker_installation_package 'default' do
    action :create
  end
end
