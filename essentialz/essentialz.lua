--

debugger = true

print_debug = function(statement)
	if (debugger) then
		print(statement)
	end
end

class_types = {
	class	=	'class';
	interface = 'interface';
	abstract = 'abstract';
}

code_components = {
	left_bracket = 			[[{]];
	right_bracket = 		[[}]];
	left_parenthesis = 		[[(]];
	right_parenthesis = 	[[)]];
	finish_statement =		[[;]];
	left_square_bracket =	'[';
	right_square_bracket = 	']';
}

default_class_is_a = class_types.class

demo_class = {
	class_is_a = default_class_is_a;
	class_name = 'Obj';
	class_extends = {};
	class_implements = {};
	class_data = {
		str = {
			data_type = 'string';
			data_value = 'sssttrrrrr';
		}; 
		dubbl = {
			data_type = 'double';
			data_value = 13.37;
		};
		ihnt = {
			data_type = 'int';
			data_value = 5;
		};
		ihntegers = {
			data_type = 'int';
			data_value = {4,5,6};
		};
		fuhnktchyon = {
			data_type = 'var';
			data_parameters = {'derpaderp, adf'};
			data_value = [[
				if (adf) {
					derpaderp += adf;
				} 
				
				return (derpaderp);
			]];
		};
	};
}

what_is_a_class = function(class_is_a) 
	if (class_is_a) then
		for i,v in pairs(class_types) do
			if (v == class_is_a) then
				return class_is_a
			end
		end
		print('dif_value: essentials/what_is_a_class/arg/class_is_a: '..tostring(class_is_a))
	else
		print('nil_value: essentials/what_is_a_class/arg/class_is_a')
	end
	return default_class_is_a
end

print_table = function(table_data)
	if (table_data) then
		if (type(table_data) == 'table') then
			for i,v in pairs(table_data) do
				if (type(i) ~= 'number') then
					print(tostring(i))
				end
				if (v) then
					if (type(v) == 'table') then
						print_table(v)
					else
						print('i: '..tostring(i)..'\t| v:'..tostring(v))
					end
				else
					print('nil_value: essentials/print_table/arg'
						..code_components.left_bracket
						..tostring(i)
						..code_components.right_bracket
						..'/v')
				end
			end
		end
	else
		print('nil_value: essentials/print_table/arg/table_data')
	end
end

-- Put quotes arounds a string value
stringify = function(str)
	if (str) then
		if (type(str) == 'string') then
			return ([["]]..str..[["]])
		else
			print('dif_value: essentials/stringify/arg/str: '..tostring(str))
		end
	else
		print('nil_value: essentials/stringify/arg/str')
	end
	return str
end

-- Turn a table into a list with commas
commacommacommacommacomma = function(data_table)
	local outStr = ''
	if (data_table) then
		for i,v in pairs(data_table) do
			outStr = (outStr..stringify(v))
			if (i < #data_table) then
				outStr = (outStr..', ')
			end
		end
	else
		print('nil_value: essentials/commacommacommacommacomma/arg/data_table')
	end
	return outStr
end

semicolonoscopyz = function(staytmnt)
	if (staytmnt) then
		if (string.find(staytmnt, code_components.finish_statement) == nil) then
			return (staytmnt..code_components.finish_statement)
		end
	else
		print('nil_value: essentials/semicolonoscopyz/arg/staytmnt')
	end
	return staytmnt
end

--[[
split = function(str, splitter)
	local atoms = {}
	--local iterationLocations = string.gmatch(str, splitter)
	
	
	local iterations = string.gmatch(str, '%a+')
	print(iterations)
	return atoms
end
]]
stanzatements = function(stanza, pre_stanza_statements)
	local stanza_statements = {}
	if (pre_stanza_statements) then
		stanza_statements = pre_stanza_statements
	else
		--print('nil_value: essentials/stanzatements/arg/pre_stanza_statements')
	end
	
	if (stanza) then 
		local first = string.sub(stanza, string.find(stanza, '\n'))
		if (first) then
			table.insert(stanza_statements, first)
			print(tostring(first))
			stanzatements(string.sub(stanza, string.len(first)), pre_stanza_statements)
		else
			print('nil_value: essentials/stanzatements/var/first')
		end
	else
		print('nil_value: essentials/stanzatements/arg/stanza') 
	end
	return stanza_statements
end

semicoloniyzanza = function(stanza)
	local stanza_statements = stanzatements(stanza)
	if stanza_statements then
		local out_stanza = ''
		for stanzatement in stanza_statements do
			if (stanzatement) then
				out_stanza = (
					out_stanza
						..semicolonoscopyz(stanzatement)
				)
			else
				print('nil_value: essentials/semicoloniyzanza/var/stanzatement')
			end
			out_stanza = (
				out_stanza
					..'\n'
			)
		end
		return out_stanza
	else
		print('nil_value: essentials/semicoloniyzanza/var/stanza_statements')
		return stanza
	end
	
end

indent_string = function(str)
	if (str) then
		return ('\t'..string.gsub(str, '\n', '\n\t'))
	else
		print('nil_value: essentials/indent_string/arg/str')
	end
end

dindent_string = function(str)
	if (str) then
		return string.gsub(str, '\t\n', '\n')
	else
		print('nil_value: essentials/dindent_string/arg/str')
	end
end

nodent_string = function(str)
	if (str) then
		return string.gsub(str, '\t', '')	
	else
		print('nil_value: essentials/nodent_string/arg/str')
	end
end

tab_newline_count = function(stanza_of_statements, offset)
	local tnc = zero
	
	if (offset) then
		tnc = offset
	else
		print('nil_value: essentials/tab_newline_count/offset')
		--tnc = zero
	end
	
	if (stanza_of_statements) then
		local first
		if pcall(function() 
			first = string.len(string.sub(stanza_of_statements, string.find(stanza_of_statements, '\t\n')))
			--print('first: '..tostring(first))
		end) then
			tnc = tnc + 1
			tab_newline_count(string.sub(stanza_of_statements, first), tnc)
		else
			print('nil_value: essentials/tab_newline_count/first')
		end
	else
		print('nil_value: essentials/tab_newline_count/stanza_of_statements')
	end
	
	return tnc
end

getaboffset = function(stanza_of_statements, offset)
	local taboffset = zero
	
	if (stanza_of_statements) then
		
		if (offset) then
			taboffset = offset
		else
			print('nil_value: essentials/getaboffset/arg/offset')
			--taboffset = zero
		end
		
		local tab_newline_count_a = tab_newline_count(stanza_of_statements)
		
		local stanza_of_statements = dindent_string(stanza_of_statements)

		local tab_newline_count_b = tab_newline_count(stanza_of_statements)
		if (tab_newline_count_a and tab_newline_count_b) then		
			if (tab_newline_count_a <= tab_newline_count_b) then
				return getaboffset(stanza_of_statements, taboffset)
			end
		else
			if (tab_newline_count_a == nil) then
				print('nil_value: essentials/getaboffset/var/tab_newline_count_a')
			end
			if (tab_newline_count_b == nil) then
				print('nil_value: essentials/getaboffset/var/tab_newline_count_b')
			end
		end
	else
		print('nil_value: essentials/getaboffset/arg/stanza_of_statements')
		return zero
	end
	
	return taboffset
end

taboutosometabracknacklets = function(stanza_of_statements)
	if (stanza_of_statements) then
		local tab_offset = getaboffset(stanza_of_statements)
		if (tab_offset > 0) then
			for i = 1, tab_offset do
				stanza_of_statements = dindent_string(stanza_of_statements)
			end
		end
	else
		print('nil_value: essentials/taboutosometabracknacklets/arg/staytmnt')
	end
	return stanza_of_statements
end

format_stanzatement = function(stanza_of_statements)
	stanza_of_statements = taboutosometabracknacklets(stanza_of_statements)
	if (stanza_of_statements) then
		stanza_of_statements = 
			--semicoloniyzanza(
				indent_string(
					indent_string(
						--nodent_string(
							stanza_of_statements
						--)
					)
				)			
			--)
	else
		print('nil_value: essentials/format_stanzatement/arg/stanza_of_statements')
	end
	
	return stanza_of_statements
	
end
