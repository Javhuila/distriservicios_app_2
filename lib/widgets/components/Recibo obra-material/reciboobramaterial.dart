import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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

  List<Materiales> materialesss = [];
  Materiales? seleccionarMaterial;
  int cantidad = 1;
  List<Map<String, dynamic>> addedMaterials = [];

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
  String? _textFirma;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recibo de Obra N° 6981'),
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
                  padding: const EdgeInsets.all(8),
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
                            height: 20,
                          ),
                          TextInputForm(
                            hintText: 'Escriba tu Usuario',
                            labelText: 'Nombre Usuario',
                            onSaved: (value) {
                              _nombreUsuario = value;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextInputForm(
                            hintText: 'Escriba tu codigo',
                            labelText: 'Codigo Usuario',
                            onSaved: (value) {
                              _codigoUsuario = value;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextInputForm(
                            hintText: 'Escriba tu cedula',
                            labelText: 'Cedula',
                            onSaved: (value) {
                              _cedula = value;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextInputForm(
                            controller: _fechaConstruccionController,
                            hintText: 'Selecciona la fecha de Construccion',
                            labelText: 'Fecha',
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
                            height: 20,
                          ),
                          TextInputForm(
                            controller: _fechaServicioController,
                            hintText: 'Selecciona la fecha del Servicio',
                            labelText: 'Fecha',
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
                          const Text("Firmas Digitales"),
                          const SizedBox(
                            height: 20,
                          ),
                          TextInputForm(
                            hintText: 'Firma del Usuario',
                            labelText: 'Usuario',
                            suffixIcon: const Icon(Icons.image_search_outlined),
                            onSaved: (value) {
                              _textFirma = value;
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
                                  child: const Text('Cargar Imagen'),
                                ),
                              ),
                              const SizedBox(width: 16),
                              if (_image != null)
                                Image.file(
                                  _image!,
                                  width: 50,
                                  height: 50,
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
                                            'firma': _textFirma ?? '',
                                          },
                                          _image);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
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
    this.onPressed,
    this.onSaved,
    this.controller,
    this.isImageSelected = false,
  });

  final String labelText, hintText;
  final Widget? suffixIcon;
  final VoidCallback? onPressed;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool isImageSelected;

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
      decoration: InputDecoration(
          // suffixIcon: Icon(Icons.image_search),
          suffixIcon: suffixIcon,
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
