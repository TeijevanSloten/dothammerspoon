--
-- Use ping to check internet
--

hs.hotkey.bind(cah, "p", function() 
	hs.network.ping.ping("8.8.8.8", 2, 1, 2, "any", function(_, message) 
		hs.alert.show(message)
	end)
end)