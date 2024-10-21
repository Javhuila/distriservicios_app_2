import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:distriservicios_app_2/service/model/tuberias.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../service/google/google_drive_service.dart';

class ReciboObraSoldador extends StatefulWidget {
  const ReciboObraSoldador({super.key});

  @override
  State<ReciboObraSoldador> createState() => _ReciboObraSoldadorState();
}

class _ReciboObraSoldadorState extends State<ReciboObraSoldador> {
  final _formKey = GlobalKey<FormState>();

  // Items para agregar tuberias de la tabla "redes"
  List<Tuberias> tuberiasss = [];
  Tuberias? seleccionarTuberias;
  int cantidadTuberias = 1;
  List<Map<String, dynamic>> addedTuberias = [];

  final TextEditingController _fechaSoldadorTuberiaController =
      TextEditingController();

  String? _textFirmaSoldador;
  String? _textFirmaSupervisor;
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
    axiosTuberias().then((value) {
      setState(() {
        tuberiasss = value;
      });
    });

    super.initState();
  }

  void agregarTuberias() {
    if (seleccionarTuberias != null) {
      bool exists = addedTuberias
          .any((material) => material['codigo'] == seleccionarTuberias!.codigo);

      if (!exists) {
        setState(() {
          addedTuberias.add({
            'codigo': seleccionarTuberias!.codigo,
            'nombre': seleccionarTuberias!.nombre,
            'cantidad': cantidadTuberias,
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Este material ya ha sido agregado.')),
        );
      }
    }
  }

  void eliminarTuberias(int index) {
    setState(() {
      addedTuberias.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recibo de Obra de Soldador'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            // color: Colors.red,
            width: 500,
            height: 100,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Codigo:"),
                      Text("DS-P"),
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
                      Text("06-06-2024"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const TextInputForm(
                        hintText: 'Ej: Yusun Florez',
                        labelText: 'Nombres Y Apellidos',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextInputForm(
                        hintText: 'Ej: 10762903123',
                        labelText: 'Cedula',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextInputForm(
                        controller: _fechaSoldadorTuberiaController,
                        hintText: 'Seleccione una fecha',
                        labelText: 'Fecha',
                        keyboardType: TextInputType.none,
                        suffixIcon: const Icon(Icons.date_range_outlined),
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
                            _fechaSoldadorTuberiaController.text =
                                formattedDate;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextInputForm(
                        hintText: 'Escriba el municipio',
                        labelText: 'Municipio',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextInputForm(
                        hintText: 'Escriba una vereda',
                        labelText: 'Vereda',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const Center(
                        child: Text(
                          "Agregar materiales de tuberias de redes",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButton<Tuberias>(
                        hint: const Text("Seleccione un material"),
                        value: seleccionarTuberias,
                        onChanged: (Tuberias? newTuberias) {
                          setState(() {
                            seleccionarTuberias = newTuberias;
                          });
                        },
                        items: tuberiasss.map<DropdownMenuItem<Tuberias>>(
                            (Tuberias tuberias) {
                          return DropdownMenuItem<Tuberias>(
                            value: tuberias,
                            child: Text(tuberias.nombre),
                          );
                        }).toList(),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          cantidadTuberias = int.tryParse(value) ?? 1;
                        },
                        decoration:
                            const InputDecoration(labelText: 'Cantidad'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: agregarTuberias,
                          child: const Text("Agregar")),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                          child: DataTable(
                            columnSpacing: 20,
                            dataRowMinHeight: 50,
                            dataRowMaxHeight: 110,
                            border: TableBorder.all(),
                            columns: const [
                              DataColumn(
                                label:
                                    SizedBox(width: 50, child: Text('Codigo')),
                              ),
                              DataColumn(label: Text('Nombre')),
                              DataColumn(label: Text('Cantidad')),
                              DataColumn(label: Text('Eliminar')),
                            ],
                            rows: addedTuberias.map((medicioness) {
                              int index = addedTuberias.indexOf(medicioness);
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
                                      onPressed: () => eliminarTuberias(index),
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
                      const Text("Aqui van las coordenadas"),
                      const SizedBox(
                        height: 20,
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
                              "Observaciones acerca del recibo de obra de soldador",
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
                        hintText: 'Firma del Soldador',
                        labelText: 'Soldador',
                        suffixIcon: const Icon(Icons.image_search_outlined),
                        onSaved: (value) {
                          _textFirmaSoldador = value;
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
                              width: 100,
                              height: 100,
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextInputForm(
                        hintText: 'Firma del Supervisor',
                        labelText: 'Supervisor',
                        suffixIcon: const Icon(Icons.image_search_outlined),
                        onSaved: (value) {
                          _textFirmaSupervisor = value;
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

                                  // await uploadFileToDrive(
                                  //     'form_data.pdf',
                                  //     {
                                  //       'nombreTecnico': _nombreTecnico,
                                  //       'nombreUsuario': _nombreUsuario,
                                  //       'codigoUsuario': _codigoUsuario,
                                  //       'cedula': _cedula,
                                  //       'fechaConstruccion':
                                  //           _fechaConstruccion,
                                  //       'fechaServicio': _fechaServicio,
                                  //       'materiales': addedMaterials,
                                  //       'firmaUsuario':
                                  //           _textFirmaUsuario ?? '',
                                  //       'firmaInstalador':
                                  //           _textFirmaInstalador ?? '',
                                  //       'firmaSuperior':
                                  //           _textFirmaSuperior ?? '',
                                  //     },
                                  //     _image);
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
        ])));
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
    this.keyboardType,
    this.maxLines,
  });

  final String labelText, hintText;
  final Widget? suffixIcon;
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

Future<List<Tuberias>> axiosTuberias() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('Tuberias').get();
  return snapshot.docs.map((doc) {
    return Tuberias(
      id: doc.id,
      codigo: doc['codigo'],
      nombre: doc['nombre'],
    );
  }).toList();
}
