dimensions_reference = {
    name = 'dimensions_reference',
    enumerations = {
        -- Leave blank if none
    },
    static = {
        constants = {},
        finals = {
        },
        attributes = {
            ['measurement'] = 'MeasurementReference',
            ['length'] = 'double',
            ['width'] = 'double',
            ['height'] = 'double',
        },
        functions = {
            dart = {
                ['CM_TO_INCHES'] = [[
                static double CM_TO_INCHES(double cm) =>
                        cm == null ? 0 : cm/INCH_TO_CM;
                ]],
                ['INCHES_TO_CM'] = [[
                static double INCHES_TO_CM(double inch) =>
                        inch == null ? 0 : inch*INCH_TO_CM;
                ]],
                ['CONVERT'] = [[
                static DimensionsReference CONVERT(DimensionsReference dimensionsReference) {
                    DimensionsReference outputDimensionReference;
                    if (dimensionsReference != null) {
                        Measurement tempMeasurement = dimensionsReference.getMeasurement;
                        if (tempMeasurement == Measurement.standard) {
                            outputDimensionReference = DimensionsReference(
                                id: dimensionsReference.id,
                                measurement: tempMeasurement.freakyFriday(),
                                length: CM_TO_INCHES(dimensionsReference.length),
                                width: CM_TO_INCHES(dimensionsReference.width),
                                height: CM_TO_INCHES(dimensionsReference.height),
                            );
                        } else if (tempMeasurement == Measurement.metric) {
                            outputDimensionReference = DimensionsReference(
                                id: dimensionsReference.id,
                                measurement: tempMeasurement.freakyFriday(),
                                length: INCHES_TO_CM(dimensionsReference.length),
                                width: INCHES_TO_CM(dimensionsReference.width),
                                height: INCHES_TO_CM(dimensionsReference.height),
                            );
                        } else {
                            print(MeasurementExtension
                                    .stringValues[dimensionsReference.measurement]);
                            outputDimensionReference = dimensionsReference;
                        }
                    }
                    return outputDimensionReference;
                }
                ]]
            },
            go = {

            },
            lua = {

            }
        }
    },
    attributes = {
        -- format:  ['name'] = type
    },
    functions = {
        dart = {
            ['getCubicArea'] = [[
            double get getCubicArea => this.length * this.width * this.height;
        ]],
            ['getFloorArea'] = [[
            double get getFloorArea => this.length * this.width;
        ]],
            ['x'] = [[
            double get x => this.length;
        ]],
            ['y'] = [[
            double get y => this.height;
        ]],
            ['z'] = [[
            double get z => this.width;
        ]],
            ['getVector3String'] = [[
            String get getVector3String => 'Vector3.new($x,$y,$z)';
        ]],
            ['set_x'] = [[
            set x(double x) => this.length;
        ]],
            ['set_y'] = [[
            set y(double y) => this.height;
        ]],
            ['set_z'] = [[
            set z(double z) => this.width;
        ]],
            ['toString'] = [[
            @override
            String toString() => '$DimensionsReference { $id: '
                '$measurement($length, $width, $height) }';
        ]],
            ['toMeasurementMap'] = [[
            Map<String, dynamic> toMeasurementMap(Measurement measurement) {
                if (measurement == this.measurement) {
                return toMap();
                } else {
                return CONVERT(this).toMap();
                }
            }
        ]],
        },
        go = {
            [[]]
        },
        lua = {
            [[]]
        }
    },
},