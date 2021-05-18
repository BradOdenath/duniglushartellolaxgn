file_structure = {
    bash_cat_file  = {
        type = 'bash',
        name = 'cat',
        text = {
            parameters = {
                start = [[
                touch "${1,,}_reference.type";
                cat > ${1,,}_reference.type <<EOF
            ]],
                finish = [[
                EOF]]
            }
        }
    },
    dart_enum_extension_file = {
        type = 'dart',
        name = 'dart_object_file',
        text = {
            enumerations = {
                format =[[name,]],
                start = [[
                enum ${1^} {
            ]],
                finish = [[
                }
            ]],
            },
            enumeration_extension_statics: {
                format = [[
                static final type name = value;
            ]],
                start = [[
                extension MeasurementExtension on Measurement {
            ]],
                finish = [[]]
            },
            enumeration_extension_functions = {
                format = [[]],
                start = [[]],
                finish = [[
                }
            ]]
            }
        }
    },
    dart_object_file = {
        type = 'dart',
        name = 'dart_object_file',
        text = {
            parameters = {
                format = 'type name;',
                start = [[
                /// TODO: Modify AutoGenerated ${1,,}_reference.dart Code
                
                class ${1^}Reference {
                    String id;
                    String title;
            ]],
                finish = [[]]
            },
            constructor = {
                format = 'this.name,',
                start = [[

                ${1^}Reference({
                    this.id,
                    this.title,
            ]],
                finish = [[
                });
            ]]        
            },
            accessors = {
                format = [[
                type get getNAME => this.name;]],
                start = [[
                String get getID => this.id;
                String get getTitle => this.title;
                ]],
                finish = [[// This shit still isn't abstract enough]]
            },
            mutators = {
                format = [[set setNAME(type name) => this.name = name;]],
                start = [[
                set setID(String id) => this.id = id;
                set setTitle(String title) => this.title = title;
            ]],
                finish = [[]]
            },
            firestore = {
                format = [[,
                this.name = firestore['name']
            ]],
                start = [[
                ${1^}Reference.fromFirestore(Map<String,dynamic> firestore)
                    :	this.id = firestore['id'],
                        this.title = firestore['title']
            ]],
                finish = [[
            ;
            ]]
            },
            map = {
                format = [[
                'name':     name,
            ]],
                start = [[
                Map<String, dynamic> toMap() {
                    return {
                        'id':		id,
                        'title': 	title,
            ]],
                finish = [[
                        };
                    }
                }
            ]]
            }
        }
    },
    dart_object_file_provider = { 
        type = 'dart',
        name = 'dart_object_file_provider',
        text = {
            parameters = {
                format = [[Type _name;]],
                start = [[
                /// TODO: Modify AutoGenerated ${1,,}_reference_provider.dart Code

                import 'package:flutter/material.dart';
                import 'package:uuid/uuid.dart';

                import '${1,,}_reference.dart';
                import '${1,,}_reference_firestore_service.dart';

                class ${1^}ReferenceProvider with ChangeNotifier {
                final firestoreService = ${1^}ReferenceFirestoreService();

                String _id;
                String _title;
            ]],
                finish = [[
                var uuid = Uuid();
            ]]},
                accessors = {
                    format = [[
                Type get name => _name;]],
                    start = [[
                // Accessors
                String get title => _title;
            ]],
                    finish = [[]]
                },
                mutators = {
                    format = [[
                changeName(Type name) {
                    _name = name;
                    notifyListeners();
                },
            ]],
                    start = [[
                // Mutators
                changeTitle(String title) {
                    _title = title;
                    notifyListeners();
                }
            ]],
                    finish = [[]]
                },
                load_values = {
                    format = [[
                    _name = ${1,,}Reference.name;
            ]],
                    start = [[

                loadValues(${1^}Reference ${1,,}Reference) {
                    _title = ${1,,}Reference.title;
                    _id = ${1,,}Reference.id;
                
            ]],
                    finish = [[
                }
            ]]
                },
                save_new = {
                    format = [[,
                name: name 
            ]],
                    start = [[
                save${1^}Reference() {
                    print(_id);
                    if (_id == null) {
                    var new${1^}Reference = ${1^}Reference(
                        id: uuid.v4(),
                        title: title
            ]],
                    finish = [[
                    );
                    firestoreService.save${1^}Reference(new${1^}Reference);
                    } 
            ]]
                },
                save_updated = {
                    format = [[,
                name: _name
            ]],
                    start = [[else {
                var updated${1^}Reference = ${1^}Reference(
                    id: _id,
                    title: _title
            ]],
                    finish = [[
                );
                firestoreService.save${1^}Reference(updated${1^}Reference);
                }
            }

            remove${1^}Reference(String id) {
                firestoreService.remove${1^}Reference(id);
            }

            }

        ]],
                }

            },
        },
        dart_object_file_firestore_service = {
            type = 'dart',
            name = 'dart_object_file_firestore_service',
            text = [[
            /// TODO: Modify AutoGenerated ${1,,}_reference_firestore_service.dart Code
            import 'package:cloud_firestore/cloud_firestore.dart';

            import '${1,,}_reference.dart';

            class ${1^}ReferenceFirestoreService {
                Firestore _db = Firestore.instance;

                Future<void> save${1^}Reference(${1^}Reference ${1,,}Reference) {
                    return _db.collection('${1,,}References')
                        .document(${1,,}Reference.id)
                        .setData(${1,,}Reference.toMap());
                }

                Stream<List<${1^}Reference>> get get${1^}References {
                    return _db.collection('${1,,}References')
                        .snapshots().map((snapshot) =>
                        snapshot.documents.map((document) =>
                        ${1^}Reference.fromFirestore(document.data)).toList());
                }

                Future<void> remove${1^}Reference(String id) {
                    return _db.collection('${1,,}References')
                        .document(id)
                        .delete();
                }

            }
    ]],
        },
        go_object_file = {
            type = 'go',
            name = 'go_object_file',
            text = {
                struct = {
                    format = [[
                    name  type
            ]],
                    start = [[
                /// TODO: Modify AutoGenerated ${1,,}_reference.go Code

                type ${1^}Reference struct {
                    id    string  'json:id'
                    title string  'json:title'
            ]],
                    finish = [[
                        }
                    ]],
                }
            },
        },
        lua_object_file = {
            json_reader = {
                format = [[
            print(data.name)]],
                start = [[
            --- TODO: Modify AutoGenerated ${1}_reference.lua Code 

            local HttpService = game:GetService("HttpService")

            local URL_${1^^}REFERENCE = "https://databaseurl.com/data.json"

            local response = HttpService:GetAsync(URL_${1^^}REFERENCE}

            local data = HttpService:JSONDecode(response)

            print(data.id)
            print(data.title)
        ]],
                finish = [[
            print(tostring(data))
        ]],
            }
        },
        dart_object_file_ui_modify = {
            controllers = {
                format = [[
                final nameController = TextEditingController();
        ]],
                start = [[
            /// TODO: Modify AutoGenerated ${1,,}_reference_ui_edit_page.dart Code

            import 'package:flutter/material.dart';
            import 'package:provider/provider.dart';

            import '../${1,,}_reference_provider.dart;
            import '../${1,,}_reference.dart';

            class Edit${1^}ReferenceUIPage extends StatefulWidget {

                final ${1^}Reference ${1,,}Reference;

                Edit${1^}ReferenceUIPage([this.${1,,}Reference]);

                @override
                _Edit${1^}ReferenceUIPageState createState() => _Edit${1^}ReferenceUIPageState();

            }

            class _Edit${1^}ReferenceUIPageState extends State<Edit${1^}ReferenceUIPage> {
                final titleController = TextEditingController();
        ]],
                finish = [[]],
            },
            dispose_controllers = {
                format = [[
                    nameController.dispose();    
        ]],
                start = [[
                @override
                void dispose() {
                    titleController.dispose();
        ]],
                finish = [[
                    super.dispose();
                }
        ]]
            },
            init_state_null = {
                format = [[
                    nameController.text = "";
        ]],
                start = [[
                @override
                void initState() {
                    if (widget.${1,,}Reference == null) {
                    titleController.text = "";
        ]],
                finish = [[
                    new Future.delayed(Duration.zero, () {
                        final ${1,,}ReferenceProvider = Provider.of<${1^}ReferenceProvider>(context, listen: false);
                        ${1,,}ReferenceProvider.loadValues(${1^}Reference());
                    });
                }
        ]],
            },
            init_state = {
                format = [[
                    nameController.text=widget.${1,,}Reference.name;
        ]],
                start = [[ else {
                    titleController.text=widget.${1,,}Reference.title;
        ]],
                finish = [[
                    new Future.delayed(Duration.zero, () {
                        final ${1,,}ReferenceProvider = Provider.of<${1^}ReferenceProvider>(context, listen: false);
                        ${1,,}ReferenceProvider.loadValues(widget.${1,,}Reference);
                    });
                    }
                    super.initState();
                }
        ]]
            },
            build = {
                format = [[
                            TextField(
                                controller: nameController,
                                decoration: InputDecoration(hintText: '${1^}Reference Name'),
                                onChanged: (value) {
                                    ${1,,}ReferenceProvider.changeName(value);
                                },
                            ),
        ]],
                start = [[
                @override
                Widget build(BuildContext context) {
                    final ${1,,}ReferenceProvider = Provider.of<${1^}ReferenceProvider>(context);

                    return Scaffold(
                    appBar: AppBar(title: Text('Edit ${1^}Reference')),
                    body: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                        children: <Widget>[
                            TextField(
                                controller: titleController,
                                decoration: InputDecoration(hintText: '${1^}Reference Title'),
                                onChanged: (value) {
                                    ${1,,}ReferenceProvider.changeTitle(value);
                                },
                            ),
        ]],
                finish = [[
                            SizedBox(
                                height: 20.0,
                            ),
                            RaisedButton(
                                child: Text('Save'),
                                onPressed: () {
                                    ${1,,}ReferenceProvider.save${1^}Reference();
                                    Navigator.of(context).pop();
                                },
                            ),
                            (widget.${1,,}Reference != null) ? RaisedButton(
                                color: Colors.red,
                                textColor: Colors.white,
                                child: Text('Delete'),
                                onPressed: () {
                                    ${1,,}ReferenceProvider.remove${1^}Reference(widget.${1,,}Reference.id);
                                    Navigator.of(context).pop();
                                },
                            ) : Container(),
                        ],
                        ),
                    ),
                    );
                }

            }
        ]],
        }
    }
}

function file_structures()
    return file_structures
end