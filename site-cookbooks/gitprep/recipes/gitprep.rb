# create group
group "gitprep" do
  action :create
end

# create user
user "gitprep" do
  gid "gitprep"
  password "$1$PX82HctQ$QlTEVFWH0fJkieBRv8oNF0" # gitprep
end

# download archive
git node["gitprep"]["home"] do
  repository "https://github.com/yuki-kimoto/gitprep"
  revision "master"
end

# template gitprep.conf
template "/var/lib/gitprep/gitprep.conf" do
  source "gitprep.conf.erb"
end

# execute install script
execute "chown gitprep:gitprep -R ." do
  cwd node["gitprep"]["home"]
  not_if { ::File.exists?("/var/lib/gitprep/extlib/lib/perl5/Module/CoreList.pm")}
end

# execute install script
execute "./setup.sh" do
  cwd node["gitprep"]["home"]
  not_if { ::File.exists?("/var/lib/gitprep/extlib/lib/perl5/Module/CoreList.pm")}
  user "gitprep"
  group "gitprep"
end

# execute gitprep
execute "./gitprep" do
  cwd node["gitprep"]["home"]
  only_if { ::File.exists?("/var/lib/gitprep/gitprep")}
end

