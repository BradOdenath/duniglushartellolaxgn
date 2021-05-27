-- Declare prs and initialize the value to "ayo"
prs = "*** loading references_framework.lua ***"

-- Print prs tostring
print(tostring(prs))

-- Declare nil_file_count and initialize the value to 0
nil_file_count = 0

-- Declare file_count and initialize the value to 0
file_count = 0

-- Declare file_count and initialize the value to 0
folder_count = 0

-- Declare reference_path and initialize the value to the directory path for references
references_path = 'references'

reference_table_count = 0

-- Declare reference_table as a function()
function reference_table(path)
    -- Declare references as a local variable and initialize the value to a null set
    local references = {}

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
				file_count = file_count + 1
				print('file_count: '..tostring(file_count), file_name)

                -- Initialize the value of _loadstring to the loadstring of the file_content
                local _loadstring = loadstring(file_content)

                -- Condition: to() much exist
                if _loadstring then

                    -- Declare _to as a local variable and initialize the value to 'to()' in _loadstring
                    local _to = _loadstring
                    
                    -- Insert the _to variable function into the table
                    table.insert(references,_to)

                    -- Print success :D
                    print('file_count: '..tostring(file_count), 'success '..tostring(file_name), file_content)
                end
            else
			
                if (file_name ~= path) then
			
			
					--Prevent duplicates 
					
					-- Increment folder count
					folder_count = folder_count + 1
					
					-- Print failure :o
					print('folder_count'..tostring(folder_count 'failure '..tostring(file_name)))
					
					local _rt = reference_table(file_name)
					if (_rt) then
						--print('_rt: '..tostring(_rt))
						if (#_rt > 0) then
							for i,v in pairs(_rt) do
								table.insert(references, v)
								print('adding '..tostring(v))
							end
						else
							table.insert(references, _rt[1])
							print('adding '..tostring(_rt[1]))
						end
					end
					--print('shoestring')
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
			print('nil_file_count: '..tostring(nil_file_count)..'/'..tostring(file_count))
		else

			-- Print 'file_count'
			print('file_count: '..tostring(file_count))
			print('folder_count: '..tostring(folder_count))
		end
	end
	
	--Decrement Reference Table Count
	reference_table_count = reference_table_count - 1
	

    -- Return the references
    return references
end

function rt()
	return reference_table(references_path)
end

function main()
	local ref_tab = rt()
	--[[for i,v in pairs(ref_tab) do
		print('i: '..tostring(i)..' | v: '..tostring(loadstring(v)))
	end]]
end
main()

--[[    TEMPLATE

reference = {
    data = {}
    name = 'reference',
    enumerations = {
        values = {},
        extension = {
            constants = {},
            finals = {},
            attributes = {},
            functions = {}
        },
    },
    static = {
        constants = {},
        finals = {},
        attributes = {},
        functions = {}
    }
    constants = {},
    finals = {},
    attributes = {

    },
    accessors = {},
    mutators = {},
    functions = {}
},

]]
