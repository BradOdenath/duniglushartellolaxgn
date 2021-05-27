
--[[ ************* MEASUREMENT *********** ]]
measurement = {
    data = {},
    name = 'measurement',
    enumerations = {
        values = {
            'Standard',
            'Metric',
            'Extraneous'
        },
        extension = {
            constants = {
                ['balanceValues'] = [[
                {
                    Measurement.metric: Measurement.standard,
                    Measurement.standard: Measurement.metric,
                    Measurement.extraneous: Measurement.extraneous, // U W0T M8
                };
            ]],  
                ['stringValues'] = [[
                {    
                    Measurement.metric: 'metric',
                    Measurement.standard: 'standard',
                    Measurement.extraneous: 'extraneous',
                };
            ]],
            },
            finals = {},
            attributes = {},
            functions = {
                dart = {
                    ['STRING_TO_MEASUREMENT'] = [[
                    static Measurement STRING_TO_MEASUREMENT(String stringMeasurement) {
                        Measurement outputMeasurement;
                        if (stringMeasurement.toLowerCase().startsWith(MeasurementExtension
                                .stringValues[Measurement.metric]
                                .substring(0, 1) // 'm'
                            )) {
                            outputMeasurement = Measurement.metric;
                        } else if (stringMeasurement.toLowerCase().startsWith(MeasurementExtension
                                .stringValues[Measurement.standard]
                                .substring(0, 1) // 's'
                            )) {
                            outputMeasurement = Measurement.standard;
                        } else {
                            outputMeasurement = Measurement.extraneous;
                        }
                        return outputMeasurement;
                    }
                ]],
                    ['freakyFriday'] = [[
                    Measurement freakyFriday() {
                        return balanceValues[this];
                    }
                ]]
                },
            }
        },
    },
    static = {
        constants = {},
        finals = {
            ['INCH_TO_CM'] = {
                ['type'] = 'double',
                ['value'] = '2.54'
            }
        },
        attributes = {},
        functions = {
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
        ]]}
    },
    constants = {},
    finals = {},
    attributes = {
        ['measurement'] = 'double',
    },
    accessors = {},
    mutators = {},
    functions = {}
},

function to()
    return measurement
end