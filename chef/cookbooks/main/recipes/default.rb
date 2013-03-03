package "git"
package "zsh"

include_recipe "imagemagick"
include_recipe "imagemagick::devel"
include_recipe "nginx::source"
include_recipe "postgresql::client"

user node[:user][:name] do
  password node[:user][:password]
  gid "users"
  home "/home/#{node[:user][:name]}"
  supports :manage_home => true
  shell "/bin/zsh"
end

template "/home/#{node[:user][:name]}/.zshrc" do
  source "zshrc.erb"
  owner node[:user][:name]
end

directory "/home/#{node[:user][:name]}/apps" do
  owner node[:user][:name]
end
