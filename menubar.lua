require("fileutils")

local menuConfig = 'menuConfig.json'

if file_exists(menuConfig) then

	local menuBar = hs.menubar.new()
	local menuItems = {}

	local menuClick = function(_, selectedMenuItem)
		hs.fnutils.map(menuItems, function(item)
			item.checked = item.title == selectedMenuItem.title
		end)

		menuBar:setTitle(selectedMenuItem.title)
		menuBar:setMenu(menuItems)
		
		execute_command(selectedMenuItem.command)
	end

	menuItems = hs.json.decode(lines_from(menuConfig))
	hs.fnutils.map(menuItems, function(item)
		item.fn = menuClick
	end)

	menuBar:setTitle(menuItems[1].title)
	menuBar:setMenu(menuItems)
end
