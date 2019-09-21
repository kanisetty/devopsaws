# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

# For more information, see the documentation: https://docs.chef.io/essentials_cookbook_recipes.html

powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-Server).Installed"
end
 
powershell_script 'Install IIS Management Console' do
  code 'Add-WindowsFeature Web-Mgmt-Console'
  guard_interpreter :powershell_script
  not_if "$MgmtConsoleState = (Get-WindowsFeature Web-Mgmt-Console).InstallState 
		 If ($MgmtConsoleState -eq 'Available')
		 {
		  	 echo $false
		 }
		 Elseif ($MgmtConsoleState -eq 'Installed')
		 {
			 echo $true
		 }"
end
 
service 'w3svc' do
  action [:start, :enable]
end
 
template 'c:\inetpub\wwwroot\Default.htm' do
  source 'index.html.erb'
end
