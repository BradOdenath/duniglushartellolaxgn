-- Declare requirements
require('phylson.languages.essentialz.essentialz')
require('phylson.languages.dart')

references_framework = function()

	-- Declare prs and initialize the value to "ayo"
	local prs = "*** loading references_framework.lua ***"

	-- Print prs tostring
	print(tostring(prs))

	-- Declare nil_file_count and initialize the value to 0
	local nil_file_count = 0

	-- Declare file_count and initialize the value to 0
	local file_count = 0

	-- Declare file_count and initialize the value to 0
	local folder_count = 0

	-- Declare reference_path and initialize the value to the directory path for references
	local references_path = 'references'

	local reference_table_count = 0

	-- Declare reference_table as a function()
	reference_table = function(path)
		-- Declare references as a local variable and initialize the value to a null set
		local references = {}
		
		local reference_folders = {}
		
		local references_requires = {}

		-- Declare handles as a local variable and initialize the value to an open directory stream
		local handle = assert(io.popen(("find '%s' -maxdepth 1 -print0"):format(path), 'r'))
		
		-- Declare file_names as a local variable and initialize the value to read all the file names
		local file_names = handle:read('*a')

		-- Declare all_file_names as a local var and initialize the value to an iterable string
		local all_file_names = string.gmatch( file_names, '[^%z]+')
		
		-- Close the file streamer
		handle:close()
		
		-- Increment reference table count
		reference_table_count = reference_table_count + 1

		-- Iterate through all_file_names with the value file_name
		for file_name in all_file_names do
			
			-- Condition: file_name must be present
			if (file_name ~= nil) then

				-- Declare file as a local variable and initialize an open io file stream for file_name
				local file = io.open(file_name, 'rb') --REDBEAAAARRDDDDDD

				-- Declare file_content as a local variable and initialize the value to all the contents file
				file_content = file:read('*all')

				-- Close the file_co
				--file_content:close()
				-- ... *
				-- Close the file *
				file:close()

				-- Conditional: file_contents must be PREsent
				if file_content ~= nil then
			
					--[[ NOTE: Moved file_count to file_content for folder count seperation ]]
					-- Increment file_count by 1 
					
					table.insert(references, file_name)
					
					file_count = file_count + 1
					--print('file_count: '..tostring(file_count), file_name)

					--[[
					
					-- Initialize the value of _loadstring to the loadstring of the file_content
					local _loadstring = loadstring(file_content)

					-- Condition: to() much exist
					if _loadstring then


						-- Declare _to as a local variable and initialize the value to 'to()' in _loadstring
						local _to = _loadstring
						
						-- Insert the _to variable function into the table
						table.insert(references,_to)
					end
					
					]]

					-- Print success :D
					--[[print('file_count: '
						..tostring(file_count), 'success '
						..tostring(file_name), file_content)]]
					
					local req_file_path = string.sub(file_name,1,#file_name-4)
					
					print('require '..stringify(req_file_path))
					
					local file_executables = require tostring(req_file_path)
					
					print(dart_class(file_executables.phyl_data()))
					
					pcall(function()
						
						print('file_executables: '..tostring(file_executables))
						print('\texecutable_content: '..tostring(file_executables.to()))
					
					end)
					
					
				else
				
					if (file_name ~= path) then
				
				
						--Prevent duplicates 
						
						-- Increment folder count
						folder_count = folder_count + 1
						table.insert(reference_folders, file_name)
						
						-- Print failure :o
						--print('folder_count: '..tostring(folder_count), 'failure '..tostring(file_name))
						
						local _rt = reference_table(file_name)
						if (_rt) then
							--print('_rt: '..tostring(_rt))
							if (#_rt.r > 0) then
								for i,v in pairs(_rt.r) do
									--print(tostring(i),tostring(v))
									if (v) then
										table.insert(references, v)
										--print('adding '..tostring(v))
									else
										print('nil_value: refereces_framework/reference_table/var/_rt'
											..code_components.left_bracket
											..tostring(i)
											..code_components.right_bracket
											..'/v')
									end
								end
							--else
								--table.insert(references, _rt.r)
								--print('adding '..tostring(_rt.r))
							end

							if (#_rt.rf > 0) then
								for i,v in pairs(_rt.rf) do
									--print(tostring(i),tostring(v))
									if (v) then
										table.insert(reference_folders, v)
										--print('adding '..tostring(v))
									else
										print('nil_value: refereces_framework/reference_table/var/_rt'
											..code_components.left_bracket
											..tostring(i)
											..code_components.right_bracket
											..'/v')
									end
								end
							--else
								--table.insert(reference_folders, _rt.rf)
								--print('adding '..tostring(_rt.rf))
							end
						end
						--print('shoestring')
						--print_table(references)
						--print_table(reference_folders)
					end
				end
			else
				-- Increment nil_file_count 
				nil_file_count = nil_file_count + 1
			end
		end
		-- Print the file count and any nil files
		
		if (reference_table_count <= 1) then
			if (nil_file_count > 0) then

				-- Print 'nil_file_count /out-of/ file_count' 
				--print('total_nil_file_count: '..tostring(nil_file_count)..'/'..tostring(file_count))
			else

				-- Print 'file_count'
				--print('total_file_count: '
				--	..tostring(file_count)
				--	..[[/]]
				--	..tostring(#references))
				--print('total_folder_count: '
				--	..tostring(folder_count)
				--	..[[/]]
				--	..tostring(#reference_folders))
			end
		end
		
		--Decrement Reference Table Count
		reference_table_count = reference_table_count - 1
		

		-- Return the references
		
		--print('references: '..tostring(references))
		--print('reference_folders: '..tostring(reference_folders))
		--print('reference_table_count: '..tostring(reference_table_count))
		
		return {r = references, rf = reference_folders}
	end

	local official_reference_table = function()
		return reference_table(references_path)
	end
	
	return official_reference_table()
end

main = function()
	local _rf = references_framework()
	print_table(_rf)
end

main()