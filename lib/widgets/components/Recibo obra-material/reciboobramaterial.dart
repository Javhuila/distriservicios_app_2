import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:distriservicios_app_2/service/model/internas.dart';
import 'package:distriservicios_app_2/service/model/mediciones.dart';
import 'package:flutter/material.dart';
import 'package:distriservicios_app_2/service/model/materiales.dart';
import 'package:image_picker/image_picker.dart';

import '../../../service/google/google_drive_service.dart';

class ReciboObraMaterial extends StatefulWidget {
  const ReciboObraMaterial({super.key});

  @override
  State<ReciboObraMaterial> createState() => _ReciboObraMaterialState();
}

class _ReciboObraMaterialState extends State<ReciboObraMaterial> {
  final _formKey = GlobalKey<FormState>();

  // Items para agregar materiales de la tabla "redes"
  List<Materiales> materialesss = [];
  Materiales? seleccionarMaterial;
  int cantidad = 1;
  List<Map<String, dynamic>> addedMaterials = [];

  // Items para agregar materiales de la tabla "centro de mediciones"
  List<Mediciones> medicionesss = [];
  Mediciones? seleccionarMediciones;
  int cantidadMediciones = 1;
  List<Map<String, dynamic>> addedMediciones = [];

  // Items para agregar materiales de la tabla "internas"
  List<Internas> internasss = [];
  Internas? seleccionarInternas;
  int cantidadInternas = 1;
  List<Map<String, dynamic>> addedInternas = [];

  String? _nombreTecnico;
  String? _nombreUsuario;
  String? _codigoUsuario;
  String? _cedula;
  String? _fechaConstruccion;
  String? _fechaServicio;
  final TextEditingController _fechaConstruccionController =
      TextEditingController();
  final TextEditingController _fechaServicioController =
      TextEditingController();
  String? _textFirmaUsuario;
  String? _textFirmaInstalador;
  String? _textFirmaSuperior;
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        // print('Imagen seleccionada: ${_image!.path}');
      });
    } else {
      // print('No se seleccionó ninguna imagen');
    }
  }

  @override
  void initState() {
    axiosMaterials().then((value) {
      setState(() {
        materialesss = value;
      });
    });

    axiosMediciones().then((value) {
      setState(() {
        medicionesss = value;
      });
    });

    axiosInternas().then((value) {
      setState(() {
        internasss = value;
      });
    });
    super.initState();
  }

  void agregarMateriales() {
    if (seleccionarMaterial != null) {
      bool exists = addedMaterials
          .any((material) => material['codigo'] == seleccionarMaterial!.codigo);

      if (!exists) {
        setState(() {
          addedMaterials.add({
            'codigo': seleccionarMaterial!.codigo,
            'nombre': seleccionarMaterial!.nombre,
            'cantidad': cantidad,
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Este material ya ha sido agregado.')),
        );
      }
    }
  }

  void eliminarMateriales(int index) {
    setState(() {
      addedMaterials.removeAt(index);
    });
  }

  void agregarMediciones() {
    if (seleccionarMediciones != null) {
      bool exists = addedMediciones.any(
          (medicion) => medicion['codigo'] == seleccionarMediciones!.codigo);

      if (!exists) {
        setState(() {
          addedMediciones.add({
            'codigo': seleccionarMediciones!.codigo,
            'nombre': seleccionarMediciones!.nombre,
            'cantidad': cantidadMediciones,
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Este material ya ha sido agregado.')),
        );
      }
    }
  }

  void eliminarMediciones(int index) {
    setState(() {
      addedMediciones.removeAt(index);
    });
  }

  void agregarInternas() {
    if (seleccionarInternas != null) {
      bool exists = addedInternas
          .any((internas) => internas['codigo'] == seleccionarInternas!.codigo);

      if (!exists) {
        setState(() {
          addedInternas.add({
            'codigo': seleccionarInternas!.codigo,
            'nombre': seleccionarInternas!.nombre,
            'cantidad': cantidadInternas,
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Este material ya ha sido agregado.')),
        );
      }
    }
  }

  void eliminarInternas(int index) {
    setState(() {
      addedInternas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          title: const Text(
            'Recibo de Obra N° 6981',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: 500,
                height: 100,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("Codigo:"),
                          Text("COD-REG-008"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Version:",
                            textAlign: TextAlign.left,
                          ),
                          Text("001", textAlign: TextAlign.right),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("Fecha"),
                          Text("07-10-2022"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              SizedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          TextInputForm(
                            hintText: 'Escriba el nombre del Tecnico',
                            labelText: 'Nombre Tecnico',
                            onSaved: (value) {
                              _nombreTecnico = value;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextInputForm(
                            hintText: 'Escriba tu Usuario',
                            labelText: 'Nombre Usuario',
                            onSaved: (value) {
                              _nombreUsuario = value;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextInputForm(
                            hintText: 'Escriba tu codigo',
                            labelText: 'Codigo Usuario',
                            onSaved: (value) {
                              _codigoUsuario = value;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextInputForm(
                            hintText: 'Escriba tu cedula',
                            labelText: 'Cedula',
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              _cedula = value;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextInputForm(
                            controller: _fechaConstruccionController,
                            hintText: 'Selecciona la fecha de Construccion',
                            labelText: 'Fecha Construccion',
                            keyboardType: TextInputType.none,
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );

                              if (pickedDate != null) {
                                String formattedDate =
                                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                _fechaConstruccionController.text =
                                    formattedDate;
                              }
                            },
                            onSaved: (value) {
                              _fechaConstruccion = value;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextInputForm(
                            controller: _fechaServicioController,
                            hintText: 'Selecciona la fecha del Servicio',
                            labelText: 'Fecha Servicio',
                            keyboardType: TextInputType.none,
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );

                              if (pickedDate != null) {
                                String formattedDate =
                                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                _fechaServicioController.text = formattedDate;
                              }
                            },
                            onSaved: (value) {
                              _fechaServicio = value;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          const Center(
                            child: Text(
                              "Agregar materiales de Redes",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownButton<Materiales>(
                            hint: const Text("Seleccione un material"),
                            value: seleccionarMaterial,
                            onChanged: (Materiales? newMaterial) {
                              setState(() {
                                seleccionarMaterial = newMaterial;
                              });
                            },
                            items: materialesss
                                .map<DropdownMenuItem<Materiales>>(
                                    (Materiales materiales) {
                              return DropdownMenuItem<Materiales>(
                                value: materiales,
                                child: Text(materiales.nombre),
                              );
                            }).toList(),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              cantidad = int.tryParse(value) ?? 1;
                            },
                            decoration:
                                const InputDecoration(labelText: 'Cantidad'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: agregarMateriales,
                              child: const Text("Agregar")),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 30, 20, 20),
                              child: DataTable(
                                columnSpacing: 20,
                                dataRowMinHeight: 50,
                                dataRowMaxHeight: 110,
                                border: TableBorder.all(),
                                columns: const [
                                  DataColumn(
                                    label: SizedBox(
                                        width: 50, child: Text('Codigo')),
                                  ),
                                  DataColumn(label: Text('Nombre')),
                                  DataColumn(label: Text('Cantidad')),
                                  DataColumn(label: Text('Eliminar')),
                                ],
                                rows: addedMaterials.map((materialess) {
                                  int index =
                                      addedMaterials.indexOf(materialess);
                                  return DataRow(cells: [
                                    DataCell(Text(materialess['codigo'])),
                                    DataCell(Text(
                                      materialess['nombre'],
                                    )),
                                    DataCell(Center(
                                      child: Text(
                                        materialess['cantidad'].toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                    )),
                                    DataCell(
                                      SizedBox(
                                        width: 50,
                                        child: IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () =>
                                              eliminarMateriales(index),
                                        ),
                                      ),
                                    ),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          const Center(
                            child: Text(
                              "Agregar materiales de centro de mediciones",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownButton<Mediciones>(
                            hint: const Text("Seleccione un material"),
                            value: seleccionarMediciones,
                            onChanged: (Mediciones? newMedicion) {
                              setState(() {
                                seleccionarMediciones = newMedicion;
                              });
                            },
                            items: medicionesss
                                .map<DropdownMenuItem<Mediciones>>(
                                    (Mediciones mediciones) {
                              return DropdownMenuItem<Mediciones>(
                                value: mediciones,
                                child: Text(mediciones.nombre),
                              );
                            }).toList(),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              cantidadMediciones = int.tryParse(value) ?? 1;
                            },
                            decoration:
                                const InputDecoration(labelText: 'Cantidad'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: agregarMediciones,
                              child: const Text("Agregar")),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 30, 20, 20),
                              child: DataTable(
                                columnSpacing: 20,
                                dataRowMinHeight: 50,
                                dataRowMaxHeight: 110,
                                border: TableBorder.all(),
                                columns: const [
                                  DataColumn(
                                    label: SizedBox(
                                        width: 50, child: Text('Codigo')),
                                  ),
                                  DataColumn(label: Text('Nombre')),
                                  DataColumn(label: Text('Cantidad')),
                                  DataColumn(label: Text('Eliminar')),
                                ],
                                rows: addedMediciones.map((medicioness) {
                                  int index =
                                      addedMediciones.indexOf(medicioness);
                                  return DataRow(cells: [
                                    DataCell(Text(medicioness['codigo'])),
                                    DataCell(Text(
                                      medicioness['nombre'],
                                    )),
                                    DataCell(Center(
                                      child: Text(
                                        medicioness['cantidad'].toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                    )),
                                    DataCell(
                                      SizedBox(
                                        width: 50,
                                        child: IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () =>
                                              eliminarMediciones(index),
                                        ),
                                      ),
                                    ),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          const Center(
                            child: Text(
                              "Agregar materiales de Internas",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownButton<Internas>(
                            itemHeight: 80,
                            hint: const Text("Seleccione un material"),
                            value: seleccionarInternas,
                            onChanged: (Internas? newInterna) {
                              setState(() {
                                seleccionarInternas = newInterna;
                              });
                            },
                            items: internasss.map<DropdownMenuItem<Internas>>(
                                (Internas internas) {
                              return DropdownMenuItem<Internas>(
                                value: internas,
                                child: Container(
                                  width: 350,
                                  child: Text(
                                    internas.nombre,
                                    maxLines: 3,
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              cantidadInternas = int.tryParse(value) ?? 1;
                            },
                            decoration:
                                const InputDecoration(labelText: 'Cantidad'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: agregarInternas,
                              child: const Text("Agregar")),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 30, 20, 20),
                              child: DataTable(
                                columnSpacing: 20,
                                dataRowMinHeight: 50,
                                dataRowMaxHeight: 110,
                                border: TableBorder.all(),
                                columns: const [
                                  DataColumn(
                                    label: SizedBox(
                                        width: 50, child: Text('Codigo')),
                                  ),
                                  DataColumn(label: Text('Nombre')),
                                  DataColumn(label: Text('Cantidad')),
                                  DataColumn(label: Text('Eliminar')),
                                ],
                                rows: addedInternas.map((internass) {
                                  int index = addedInternas.indexOf(internass);
                                  return DataRow(cells: [
                                    DataCell(Text(internass['codigo'])),
                                    DataCell(Text(
                                      internass['nombre'],
                                      overflow: TextOverflow.fade,
                                    )),
                                    DataCell(Center(
                                      child: Text(
                                        internass['cantidad'].toString(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                    )),
                                    DataCell(
                                      SizedBox(
                                        width: 50,
                                        child: IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () =>
                                              eliminarInternas(index),
                                        ),
                                      ),
                                    ),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Observaciones",
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const TextInputForm(
                              maxLines: null,
                              hintText:
                                  "Observaciones acerca del recibo de obra",
                              labelText: "Observacion"),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Firmas Digitales",
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextInputForm(
                            hintText: 'Firma del Usuario',
                            labelText: 'Usuario',
                            prefixIcon: const Icon(
                                Icons.drive_file_rename_outline_outlined),
                            onSaved: (value) {
                              _textFirmaUsuario = value;
                              // _image = null;
                            },
                            isImageSelected: _image != null,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _pickImage,
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Cargar Imagen'),
                                      Icon(Icons.image_search_rounded)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              if (_image != null)
                                Image.file(
                                  _image!,
                                  width: 100,
                                  height: 100,
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextInputForm(
                            hintText: 'Firma del Instalador',
                            labelText: 'Instalador',
                            prefixIcon: const Icon(
                                Icons.drive_file_rename_outline_outlined),
                            onSaved: (value) {
                              _textFirmaInstalador = value;
                              // _image = null;
                            },
                            isImageSelected: _image != null,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _pickImage,
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Cargar Imagen'),
                                      Icon(Icons.image_search_rounded)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              if (_image != null)
                                Image.file(
                                  _image!,
                                  width: 100,
                                  height: 100,
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextInputForm(
                            hintText: 'Firma del Superior',
                            labelText: 'Superior',
                            prefixIcon: const Icon(
                                Icons.drive_file_rename_outline_outlined),
                            onSaved: (value) {
                              _textFirmaSuperior = value;
                              // _image = null;
                            },
                            isImageSelected: _image != null,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _pickImage,
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Cargar Imagen'),
                                      Icon(Icons.image_search_rounded)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              if (_image != null)
                                Image.file(
                                  _image!,
                                  width: 100,
                                  height: 100,
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();

                                      await uploadFileToDrive(
                                          'form_data.pdf',
                                          {
                                            'nombreTecnico': _nombreTecnico,
                                            'nombreUsuario': _nombreUsuario,
                                            'codigoUsuario': _codigoUsuario,
                                            'cedula': _cedula,
                                            'fechaConstruccion':
                                                _fechaConstruccion,
                                            'fechaServicio': _fechaServicio,
                                            'materiales': addedMaterials,
                                            'firmaUsuario':
                                                _textFirmaUsuario ?? '',
                                            'firmaInstalador':
                                                _textFirmaInstalador ?? '',
                                            'firmaSuperior':
                                                _textFirmaSuperior ?? '',
                                          },
                                          _image);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(19),
                                    ),
                                    elevation: 5,
                                  ),
                                  child: const Text(
                                    "Enviar",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                )),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}

class TextInputForm extends StatelessWidget {
  const TextInputForm({
    super.key,
    required this.hintText,
    required this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.onPressed,
    this.onSaved,
    this.controller,
    this.isImageSelected = false,
    this.keyboardType,
    this.maxLines,
  });

  final String labelText, hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onPressed;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool isImageSelected;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (!isImageSelected && (value == null || value.isEmpty)) {
          return 'Por favor, escriba lo nuevamente';
        }
        return null;
      },
      onTap: onPressed,
      onSaved: onSaved,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
          // suffixIcon: Icon(Icons.image_search),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Colors.grey),
              gapPadding: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Colors.grey),
              gapPadding: 10),
          hintText: hintText,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
          hintStyle: const TextStyle(color: Color(0xFFb2b7bf), fontSize: 18.0)),
    );
  }
}

Future<List<Materiales>> axiosMaterials() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('Materiales').get();
  return snapshot.docs.map((doc) {
    return Materiales(
      id: doc.id,
      codigo: doc['codigo'],
      nombre: doc['nombre'],
    );
  }).toList();
}

Future<List<Mediciones>> axiosMediciones() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('Mediciones').get();
  return snapshot.docs.map((doc) {
    return Mediciones(
      id: doc.id,
      codigo: doc['codigo'],
      nombre: doc['nombre'],
    );
  }).toList();
}

Future<List<Internas>> axiosInternas() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('Internas').get();
  return snapshot.docs.map((doc) {
    return Internas(
      id: doc.id,
      codigo: doc['codigo'],
      nombre: doc['nombre'],
    );
  }).toList();
}
