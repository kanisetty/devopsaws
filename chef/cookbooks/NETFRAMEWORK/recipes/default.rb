# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

# For more information, see the documentation: https://docs.chef.io/essentials_cookbook_recipes.html
 windows_feature 'NET-Framework' do
  action :install
end