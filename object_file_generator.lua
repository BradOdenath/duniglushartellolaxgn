-- Hail To The Mink Dynasty
print('object_file_generator')


require "lib_framework.components.file_structure"
require "lib_framework.components.name_conversion"

require "lib_framework.references_framework"

file_content = reference_table()

function generate_file_data(file_content, file_structure)
    local out_file_data = [[]]

    --If enumerations create extension file else class file

    if (table.length(file_content.enumerations) <= 0) then
        
    else

    end

    for i,v in pairs(file_structure.text) do
        out_file_data = out_file_data + v.start
        for j,w in pairs(file_content.attributes) do
            local data_line = v.format
            data_line = string.gsub(data_line,'type',w)
            data_line = string.gsub(data_line,'name',j)
            data_line = string.gsub(data_line,'NAME',string.upper(j))
            out_file_data = out_file_data + data_line
        end
        out_file_data = out_file_data + v.finish
    end

    return out_file_data
end

function generate_cat_file_data(file_data)
    local cat_file_data = [[]]
    cat_file_data = cat_file_data + files_table.file_structure.bash_cat_file.parameters.start
    cat_file_data = cat_file_data + file_data
    cat_file_data = cat_file_data + files_table.file_structure.bash_cat_file.parameters.finish
    return cat_file_data
end

function generate_file(file_name, file_data)
    local file = io.open(file_name, 'w')
    io.write(file_data)
    io.close()
end

function generate_cffs_file()

    local cffs_file = io.open('cffs.bash', 'w')
    local cffs_file_data = [[
        sudo cffs.bash
        mkdir "${1,,}_reference";
        cd "${1,,}_reference";
    ]]

    for i,v in pairs(file_content) do
        --Placeholder for keeping track of generated file data
        local file_data

        --Generate dart_object_file
        file_data = generate_file_data(v, files_table.file_structure.dart_object_file)
        file_data = cat_file_data(file_data)
        cffs_file_data = cffs_file_data + file_data        

        --Generate dart_object_file_provider
        file_data = generate_file_data(v, files_table.file_structure.dart_object_file_provider)
        file_data = cat_file_data(file_data)
        cffs_file_data = cffs_file_data + file_data

        --Generate dart_object_firestore_service
        file_data = files_table.file_structure.dart_object_file_firestore_service.text
        file_data = cat_file_data(file_data)
        cffs_file_data = cffs_file_data + file_data

        --Generate dart
    end

    cffs_file_data = cffs_file_data + [[

    ]]

    io.output(cffs_file)
    io.write(cffs_file_data)
    io.close(cffs_file)

    os.execute("sudo cffs.bash "..toCamelBackNotation(file_content.name))
end

