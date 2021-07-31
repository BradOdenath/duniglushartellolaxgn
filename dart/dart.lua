require "essentialz.essentialz"
module('es')

zero = 0

dart_components = {
	comment_statement = 	[[//]];
	file_extension = 		[[.dart]];
	class = 				[[class]];
--	left_bracket = 			[[{]];
--	right_bracket = 		[[}]];
--	left_parenthesis = 		[[(]];
--	right_parenthesis = 	[[)]];
	finish_statement =		[[;]];
}

dart_what_is_a_class = function(class_is_a)
	
end

dart_class_data = function(class_data)
	--local es = require "essentialz/essentialz"
	local outAtr = ''
	local outFnc = ''
	if (class_data) then
		for i,v in pairs(class_data) do
			local isFnc = false
			local strLine = ''
			if (v.data_parameters)  then
				--print_debug(tostring(v.data_value))
				
				strLine = (
					strLine
						..'\n\t'
						..dart_components.comment_statement
						..' Declare function '
						..tostring(i)
						..' and return data type "'
						..v.data_type
						..'".'
						..'\n\t'
						..v.data_type
						..' '
						..tostring(i) 
						..code_components.left_parenthesis
						..commacommacommacommacomma(v.data_parameters)
						..code_components.right_parenthesis
						..' '
						..code_components.left_bracket
						..'\n'
						..format_stanzatement(v.data_value)
						..'\n\t'
						..code_components.right_bracket
				)
				isFnc = true	
			elseif (v.data_type == "table") then
				strLine = (
					strLine
						..'\n\t'
						..dart_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type "'
						..v.data_type
						..'" and initialize the value as "'
						..commacommacommacommacomma(v.data_value)
						..'".'
						..'\n\t'
						..v.data_type 
						..' '
						..tostring(i)
						..' = '
						..stringify(commacommacommacommacomma(v.data_value))
						..dart_components.finish_statement
				)
			elseif (v.data_type == "String") then
				strLine = (
					strLine
						..'\n\t'
						..dart_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type "'
						..v.data_type
						..'" and initialize the value as "'
						..v.data_value
						..'".'
						..'\n\t'
						..v.data_type 
						..' '
						..tostring(i)
						..' = '
						..stringify(v.data_value)
						..dart_components.finish_statement
				)
			else
				strLine = (
					strLine
						..'\n\t'
						..dart_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type "'
						..v.data_type
						..'" and initialize the value as "'
						..v.data_value
						..'".'
						..'\n\t'
						..v.data_type 
						..' '
						..tostring(i)
						..' = '
						..v.data_value
						..dart_components.finish_statement
				)
			end
			if (isFnc == true) then
				outFnc = (outFnc..'\n'..strLine)
				--print_debug(outFnc)
			else
				outAtr = (outAtr..'\n'..strLine)
			end
		end
	else
		es.print_debug('nil_value: dart_file_generator/dart_class_data/arg/class_data')
	end
	return (outAtr..outFnc)
end

dart_class = function(tree_class_data) 
	--local es = require "essentialz/essentialz"
	if (tree_class_data) then
		return (
			dart_components.class
				..' '
				..tree_class_data.class_name
				..' '
				..code_components.left_bracket
				..'\n\t'
				..dart_components.comment_statement
				..' File: '
				..tree_class_data.class_name
				..dart_components.file_extension
				..dart_class_data(tree_class_data.class_data)
				..'\n'
				..code_components.right_bracket
		) 
	else
		print_debug('nil_value: dart_file_generator/dart_class/arg/tree_class_data')
	end
end

main = function()
	dart_demo_class_data = dart_class(
			demo_class
		)

	print(dart_demo_class_data)
	return dart_demo_class_data
end

main()