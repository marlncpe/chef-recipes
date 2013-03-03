require 'multi_json'
Vagrant::Config.run do |config|
	VAGRANT_JSON = MultiJson.load(Pathname(__FILE__).dirname.join('chef', 'node.json').read)

	config.vm.define :centosmin do |centosmin|
		centosmin.vm.box = "centosmin"
		centosmin.vm.network :hostonly, "192.168.100.2"
        centosmin.vm.provision :chef_solo do |chef|
        	chef.cookbooks_path = "chef/cookbooks"
        	chef.json = VAGRANT_JSON
        	VAGRANT_JSON['run_list'].each do |recipe|
              chef.add_recipe recipe 
            end if VAGRANT_JSON['run_list']
        end
	end
end