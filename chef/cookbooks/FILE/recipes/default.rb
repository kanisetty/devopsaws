# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

# For more information, see the documentation: https://docs.chef.io/essentials_cookbook_recipes.html
File ‘ c:\user\Dimple\Desktop\test.txt’ do
 Content ‘This is a test file”
 action :create
end 