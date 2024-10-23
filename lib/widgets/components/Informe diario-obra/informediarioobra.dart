import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InformeDiarioObra extends StatefulWidget {
  const InformeDiarioObra({super.key});

  @override
  State<InformeDiarioObra> createState() => _InformeDiarioObraState();
}

class _InformeDiarioObraState extends State<InformeDiarioObra> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fechadiarioController = TextEditingController();
  final TextEditingController _tramoController = TextEditingController();
  final TextEditingController _acometidaController = TextEditingController();
  final TextEditingController _cintaController = TextEditingController();
  final TextEditingController _cantidadTendidoController =
      TextEditingController();
  final TextEditingController _equipoController = TextEditingController();
  final TextEditingController _propietarioController = TextEditingController();
  final TextEditingController _rocaController = TextEditingController();
  final TextEditingController _observacionController = TextEditingController();
  final TextEditingController _tiempoUsoController = TextEditingController();
  final TextEditingController _combustibleController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _cambioAceiteController = TextEditingController();

  String? selectedMedida;
  String? selectedMedidaTwo;
  String? selectedMedidaThree;
  String? selectedMedidaFour;
  String? selectedMedidaOption;
  String? selectedMedidaOptionTwo;
  String? selectedMedidaOptionThree;
  int? cantidadMedida;

  List<String> medidaPulgada = [
    '1/2"',
    '3/4"',
    '1"',
    '2"',
  ];

  List<String> medidaextraPulgada = [
    '1/2"',
    '3/4"',
    '1"',
  ];

  List<String> mediaPulgada = [
    'A',
    'RD',
  ];

  List<String> extrasPulgada = [
    'RD',
  ];

  List<Map<String, String>> addedTendido = [];
  List<Map<String, String>> addedExcavacionManual = [];
  List<Map<String, String>> addedMecanica = [];
  List<Map<String, String>> addedMaquinaria = [];
  List<Map<String, String>> addedHerramienta = [];

  String? _textFirmaUsuario;
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

  void agregarDatos() {
    if (selectedMedida != null &&
        selectedMedidaOption != null &&
        cantidadMedida != null) {
      setState(() {
        addedTendido.add({
          'tramo': _tramoController.text,
          'acometidas': _acometidaController.text,
          'medida': selectedMedida!,
          'tipo': selectedMedidaOption!,
          'cantidad_tendido': cantidadMedida.toString(),
          'cinta': _cintaController.text,
        });
      });
    }
  }

  void agregarDatos1() {
    if (selectedMedidaTwo != null && selectedMedidaOptionTwo != null) {
      setState(() {
        addedExcavacionManual.add({
          'tramo': _tramoController.text,
          'medida': selectedMedidaTwo!,
          'tipo': selectedMedidaOptionTwo!,
        });
      });
    }
  }

  void agregarDatos2() {
    if (selectedMedidaThree != null && selectedMedidaOptionThree != null) {
      setState(() {
        addedMecanica.add({
          'equipo': _equipoController.text,
          'tramo': _tramoController.text,
          'medida': selectedMedidaThree!,
          'tipo': selectedMedidaOptionThree!,
        });
      });
    }
  }

  void agregarDatos3() {
    if (selectedMedidaFour != null) {
      setState(() {
        addedMaquinaria.add({
          'propietario': _propietarioController.text,
          'tramo': _tramoController.text,
          'medida': selectedMedidaFour!,
          'roca': _rocaController.text,
          'observacion': _observacionController.text,
        });
        // _propietarioController.clear();
        // _tramoController.clear();
        // selectedMedidaTwo = null;
        // _rocaController.clear();
        // _observacionController.clear();
      });
    }
  }

  void agregarDatos4() {
    setState(() {
      addedHerramienta.add({
        'equipo': _equipoController.text,
        'tiempo_uso': _tiempoUsoController.text,
        'combustible': _combustibleController.text,
        'estado': _estadoController.text,
        'cambio_aceite': _cambioAceiteController.text,
        'observacion': _observacionController.text,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          title: const Text(
            'Informe Diario de Obra',
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            width: 500,
            height: 150,
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
                      Text("DS-P-F-010"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Fecha:",
                        textAlign: TextAlign.left,
                      ),
                      Text("21/05/2024", textAlign: TextAlign.right),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Version"),
                      Text("001"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Hoja No:"),
                      Text("001"),
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
                        const TextInputForm(
                          hintText: 'Escriba el nombre del proyecto',
                          labelText: 'Proyecto',
                          // onSaved: (value) {
                          //   _proyecto = value;
                          // },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const TextInputForm(
                          hintText: 'Escriba el cargo',
                          labelText: 'Cargo',
                          // onSaved: (value) {
                          //   _proyecto = value;
                          // },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const TextInputForm(
                          hintText: 'Escriba nombre y apellido',
                          labelText: 'Nombres y Apellidos',
                          // onSaved: (value) {
                          //   _proyecto = value;
                          // },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextInputForm(
                          controller: _fechadiarioController,
                          hintText: 'Selecciona una fecha',
                          labelText: 'Fecha',
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
                              _fechadiarioController.text = formattedDate;
                            }
                          },
                          // onSaved: (value) {
                          //   _fechaConstruccion = value;
                          // },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const TextInputForm(
                          hintText: 'Escriba una vereda',
                          labelText: 'Vereda',
                          // onSaved: (value) {
                          //   _proyecto = value;
                          // },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const TextInputForm(
                          hintText: 'Escriba el ingenierio residente',
                          labelText: 'Ingenierio',
                          // onSaved: (value) {
                          //   _proyecto = value;
                          // },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const TextInputForm(
                          hintText: 'Escriba la estacion',
                          labelText: 'Estacion Almacenamiento',
                          // onSaved: (value) {
                          //   _proyecto = value;
                          // },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const TextInputForm(
                          hintText: 'Escriba una jornada',
                          labelText: 'Jornada',
                          // onSaved: (value) {
                          //   _proyecto = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('Tendido Tuberia De Polietileno (ml)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 26)),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _tramoController,
                          hintText: 'Escriba el tramo',
                          labelText: 'Tramo',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _acometidaController,
                          hintText: 'Escriba la acometidas',
                          labelText: 'Acometidas',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            const Text(
                              "Selección de medidas",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                            DropdownButton<String>(
                              hint: const Text("Seleccione una medida"),
                              value: selectedMedida,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedMedida = newValue;
                                  if (newValue != '1/2"') {
                                    selectedMedidaOption = null;
                                  }
                                });
                              },
                              items: medidaPulgada
                                  .map<DropdownMenuItem<String>>(
                                      (String medida) {
                                return DropdownMenuItem<String>(
                                  value: medida,
                                  child: Text(medida),
                                );
                              }).toList(),
                            ),
                            if (selectedMedida == '1/2"')
                              DropdownButton<String>(
                                hint:
                                    const Text("Seleccione una opción de 1/2"),
                                value: selectedMedidaOption,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedMedidaOption = newValue;
                                  });
                                },
                                items: mediaPulgada
                                    .map<DropdownMenuItem<String>>(
                                        (String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                              ),
                            if (selectedMedida != '1/2"')
                              DropdownButton<String>(
                                hint: const Text("Seleccione una opción"),
                                value: selectedMedidaOption,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedMedidaOption = newValue;
                                  });
                                },
                                items: extrasPulgada
                                    .map<DropdownMenuItem<String>>(
                                        (String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                              ),
                            if (selectedMedida != null &&
                                selectedMedidaOption != null)
                              TextInputForm(
                                controller: _cantidadTendidoController,
                                hintText: 'Escriba la cantidad',
                                labelText: 'Cantidad',
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  cantidadMedida = int.tryParse(value!);
                                },
                              ),
                            // TextField(
                            //   controller: ,

                            //   decoration: const InputDecoration(
                            //       labelText: 'Cantidad'),
                            //   onChanged: (value) {
                            //     cantidadMedida =
                            //         int.tryParse(value); // Capturar cantidad
                            //   },
                            // ),
                            const SizedBox(height: 20),
                            TextInputForm(
                              controller: _cintaController,
                              hintText: 'Escriba la cinta',
                              labelText: 'Cinta',
                            ),
                            ElevatedButton(
                              onPressed: agregarDatos,
                              child: const Text("Agregar"),
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: const [
                                  DataColumn(label: Text('Tramo')),
                                  DataColumn(label: Text('Acometidas')),
                                  DataColumn(label: Text('Medida')),
                                  DataColumn(label: Text('Tipo')),
                                  DataColumn(label: Text('Cantidad')),
                                  DataColumn(label: Text('Cinta')),
                                ],
                                rows: addedTendido.map((data) {
                                  return DataRow(cells: [
                                    DataCell(Text(data['tramo']!)),
                                    DataCell(Text(data['acometidas']!)),
                                    DataCell(Text(data['medida']!)),
                                    DataCell(Text(data['tipo']!)),
                                    DataCell(Text(data['cantidad_tendido']!)),
                                    DataCell(Text(data['cinta']!)),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('Excavacion (ml)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 26)),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _tramoController,
                          hintText: 'Escriba el tramo',
                          labelText: 'Tramo',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            const Text(
                              "Selección de medidas",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                            DropdownButton<String>(
                              hint: const Text("Seleccione una medida"),
                              value: selectedMedidaTwo,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedMedidaTwo = newValue;
                                  if (newValue != '1/2"') {
                                    selectedMedidaOptionTwo = null;
                                  }
                                });
                              },
                              items: medidaPulgada
                                  .map<DropdownMenuItem<String>>(
                                      (String medida) {
                                return DropdownMenuItem<String>(
                                  value: medida,
                                  child: Text(medida),
                                );
                              }).toList(),
                            ),
                            if (selectedMedidaTwo == '1/2"')
                              DropdownButton<String>(
                                hint:
                                    const Text("Seleccione una opción de 1/2"),
                                value: selectedMedidaOptionTwo,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedMedidaOptionTwo = newValue;
                                  });
                                },
                                items: mediaPulgada
                                    .map<DropdownMenuItem<String>>(
                                        (String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                              ),
                            if (selectedMedidaTwo != '1/2"')
                              DropdownButton<String>(
                                hint: const Text("Seleccione una opción"),
                                value: selectedMedidaOptionTwo,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedMedidaOptionTwo = newValue;
                                  });
                                },
                                items: extrasPulgada
                                    .map<DropdownMenuItem<String>>(
                                        (String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                              ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: agregarDatos1,
                              child: const Text("Agregar"),
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: const [
                                  DataColumn(label: Text('Tramo')),
                                  DataColumn(label: Text('Medida')),
                                  DataColumn(label: Text('Tipo')),
                                ],
                                rows: addedExcavacionManual.map((data) {
                                  return DataRow(cells: [
                                    DataCell(Text(data['tramo']!)),
                                    DataCell(Text(data['medida']!)),
                                    DataCell(Text(data['tipo']!)),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('Mecanica Taladros (ml)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 26)),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _equipoController,
                          hintText: 'Escriba el equipo',
                          labelText: 'Equipo',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _tramoController,
                          hintText: 'Escriba el tramo',
                          labelText: 'Tramo',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            const Text(
                              "Selección de medidas",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                            DropdownButton<String>(
                              hint: const Text("Seleccione una medida"),
                              value: selectedMedidaThree,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedMedidaThree = newValue;
                                  if (newValue != '1/2"') {
                                    selectedMedidaOptionThree = null;
                                  }
                                });
                              },
                              items: medidaextraPulgada
                                  .map<DropdownMenuItem<String>>(
                                      (String medida) {
                                return DropdownMenuItem<String>(
                                  value: medida,
                                  child: Text(medida),
                                );
                              }).toList(),
                            ),
                            if (selectedMedidaThree == '1/2"')
                              DropdownButton<String>(
                                hint:
                                    const Text("Seleccione una opción de 1/2"),
                                value: selectedMedidaOptionThree,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedMedidaOptionThree = newValue;
                                  });
                                },
                                items: mediaPulgada
                                    .map<DropdownMenuItem<String>>(
                                        (String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                              ),
                            if (selectedMedidaThree != '1/2"')
                              DropdownButton<String>(
                                hint: const Text("Seleccione una opción"),
                                value: selectedMedidaOptionThree,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedMedidaOptionThree = newValue;
                                  });
                                },
                                items: extrasPulgada
                                    .map<DropdownMenuItem<String>>(
                                        (String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                              ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: agregarDatos2,
                              child: const Text("Agregar"),
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: const [
                                  DataColumn(label: Text('Equipo')),
                                  DataColumn(label: Text('Tramo')),
                                  DataColumn(label: Text('Medida')),
                                  DataColumn(label: Text('Tipo')),
                                ],
                                rows: addedMecanica.map((data) {
                                  return DataRow(cells: [
                                    DataCell(Text(data['equipo']!)),
                                    DataCell(Text(data['tramo']!)),
                                    DataCell(Text(data['medida']!)),
                                    DataCell(Text(data['tipo']!)),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('Excavacion con Maquinaria (ml)',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 26)),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _propietarioController,
                          hintText: 'Escriba el propietario',
                          labelText: 'Propietario',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _tramoController,
                          hintText: 'Escriba el tramo',
                          labelText: 'Tramo',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            const Text(
                              "Selección de medidas",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                            DropdownButton<String>(
                              hint: const Text("Seleccione una medida"),
                              value: selectedMedidaFour,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedMedidaFour = newValue;
                                });
                              },
                              items: mediaPulgada.map<DropdownMenuItem<String>>(
                                  (String medida) {
                                return DropdownMenuItem<String>(
                                  value: medida,
                                  child: Text(medida),
                                );
                              }).toList(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextInputForm(
                              controller: _rocaController,
                              hintText: 'Escriba la roca',
                              labelText: 'Roca',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextInputForm(
                              controller: _observacionController,
                              hintText: 'Escriba una observacion',
                              labelText: 'Observaciones',
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: agregarDatos3,
                              child: const Text("Agregar"),
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: const [
                                  DataColumn(label: Text('Propietario')),
                                  DataColumn(label: Text('Tramo')),
                                  DataColumn(label: Text('Medida')),
                                  DataColumn(label: Text('Roca')),
                                  DataColumn(label: Text('Observaciones')),
                                ],
                                rows: addedMaquinaria.map((data) {
                                  return DataRow(cells: [
                                    DataCell(Text(data['propietario']!)),
                                    DataCell(Text(data['tramo']!)),
                                    DataCell(Text(data['medida']!)),
                                    DataCell(Text(data['roca']!)),
                                    DataCell(Text(data['observacion']!)),
                                  ]);
                                }).toList(),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text('Herramientas y Equipos (horas)',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 26)),
                            const SizedBox(
                              height: 20,
                            ),
                            TextInputForm(
                              controller: _equipoController,
                              hintText: 'Escriba la equipo',
                              labelText: 'Equipo',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextInputForm(
                              controller: _tiempoUsoController,
                              hintText: 'Escriba tiempo de uso',
                              labelText: 'Tiempo Uso',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextInputForm(
                              controller: _combustibleController,
                              hintText: 'Escria el combustible',
                              labelText: 'Combustible',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextInputForm(
                              controller: _estadoController,
                              hintText: 'Escriba el estado',
                              labelText: 'Estado',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextInputForm(
                              controller: _cambioAceiteController,
                              hintText: 'Escriba el cambio de aceite',
                              labelText: 'Cambio Aceite',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextInputForm(
                              controller: _observacionController,
                              hintText: 'Escriba una observacion',
                              labelText: 'Observaciones',
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: agregarDatos4,
                              child: const Text("Agregar"),
                            ),
                            const SizedBox(height: 20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columns: const [
                                  DataColumn(label: Text('Equipo')),
                                  DataColumn(label: Text('Tiempo Uso')),
                                  DataColumn(label: Text('Combustible')),
                                  DataColumn(label: Text('Estado')),
                                  DataColumn(label: Text('Cambio Aceite')),
                                  DataColumn(label: Text('Observaciones')),
                                ],
                                rows: addedHerramienta.map((data) {
                                  return DataRow(cells: [
                                    DataCell(Text(data['equipo']!)),
                                    DataCell(Text(data['tiempo_uso']!)),
                                    DataCell(Text(data['combustible']!)),
                                    DataCell(Text(data['estado']!)),
                                    DataCell(Text(data['cambio_aceite']!)),
                                    DataCell(Text(data['observacion']!)),
                                  ]);
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
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
                            hintText: "Observaciones acerca del recibo de obra",
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
                        const Divider(),
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
                    ),
                  )))
        ])));
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
    this.onChanged,
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
  final void Function(String?)? onChanged;
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
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
          // suffixIcon: Icon(Icons.image_search),
          prefixIcon: prefixIcon,
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
