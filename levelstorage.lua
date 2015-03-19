local json = require("json")
 
 
function loadLevels()
		local base = system.pathForFile( "levels.json", system.DocumentsDirectory)
	 	local jsoncontents = ""
	 	local levelsArray = {}
	 	local file = io.open( base, "r" )
	 		if file then
	 			local jsoncontents = file:read( "*a" )
	 			levelsArray = json.decode(jsoncontents);
	 			io.close( file )
	 	        return levelsArray	
     		end
    		
     		return levels
	 end
 
function saveLevels()
	    local base = system.pathForFile( "levels.json", system.DocumentsDirectory)
	    local file = io.open(base, "w")
	    local jsoncontents = json.encode(levels)
	    file:write( jsoncontents )
		io.close( file )
	end

