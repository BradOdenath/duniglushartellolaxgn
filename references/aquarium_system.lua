aquarium_system = {
	class_name = 'AquariumSystem';
	class_extends = {};
	class_implements = {};
	class_data = {
		str = {
			data_type = 'String';
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
		fuhnktchyon = {
			data_type = 'var';
			data_parameters = {'derpaderp, adf'};
			data_value = [[
				if (adf != null) {
					derpaderp += adf;
				} 
				
				return (derpaderp);
			]];
		};
	};
}

phyl_data = function()
	return aquarium_system
end