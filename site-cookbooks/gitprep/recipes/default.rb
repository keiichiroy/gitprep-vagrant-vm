packages = ["git", "perl-CPAN"]
packages.each do |pkg|
  yum_package "#{pkg}" do
    action :install
  end
end

include_recipe "gitprep::gitprep"