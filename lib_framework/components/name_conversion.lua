function toCamelBackNotation(str)
	local outStr = [[]]
	local blah = false
	for i,v in pairs(str) do
		if v == '_' then
			blah = true
		else if blah == true then
				outStr = outStr + string.upper(v)
				blah = false
			else
				outStr = outStr + v
			end
			return outStr
		end
	end
end

function toSnakeBackNotation(str)
    local outStr = [[]]
    local blah = false
    for i,v in pairs(str) do
        if string.upper(v) == v then
            outStr = outStr + '_'
            outStr = outStr + string.lower(v)
        else
            outStr = outStr + v
        end
    end
    return outStr
end

function toCamelBackNameNotation(str)
    local outStr = toCamelBackNotation(str)
    outStr = string.sub(string.upper(outStr), 1, 2) + string.sub(outStr, 2)
    return outStr
end

