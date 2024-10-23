import 'package:flutter/material.dart';

class ReporteDiarioPersonal extends StatefulWidget {
  const ReporteDiarioPersonal({super.key});

  @override
  State<ReporteDiarioPersonal> createState() => _ReporteDiarioPersonalState();
}

class _ReporteDiarioPersonalState extends State<ReporteDiarioPersonal> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _proyectoController = TextEditingController();
  final TextEditingController _cargoController = TextEditingController();
  final TextEditingController _nombreApellidoController =
      TextEditingController();
  final TextEditingController _fechaDiarioController = TextEditingController();
  final TextEditingController _veredaController = TextEditingController();
  final TextEditingController _ingenieroResidenteController =
      TextEditingController();
  final TextEditingController _estacionAlmaController = TextEditingController();
  final TextEditingController _jornadaController = TextEditingController();
  final TextEditingController _colaboradorController = TextEditingController();
  final TextEditingController _actividadRealController =
      TextEditingController();
  final TextEditingController _rendimientoController = TextEditingController();
  final TextEditingController _observacionController = TextEditingController();

  List<Map<String, String>> registroPersonal = [];
  int contador = 0;

  void addedRegistro() {
    setState(() {
      if (_colaboradorController.text.isNotEmpty &&
          _actividadRealController.text.isNotEmpty &&
          _rendimientoController.text.isNotEmpty) {
        contador++;
        registroPersonal.add({
          'numero': contador.toString(),
          'colaborador': _colaboradorController.text,
          'actividad': _actividadRealController.text,
          'rendimiento': _rendimientoController.text,
        });
        _colaboradorController.clear();
        _actividadRealController.clear();
        _rendimientoController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          title: const Text('Reporte diario del personal'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.zero,
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
                        Text("DS-P-F-011"),
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
                        Text("21-05-2024"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Padding(
<<<<<<< HEAD
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple, // Color de fondo
                      foregroundColor: Colors.white, // Color del texto
                      padding: EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15), // Espaciado interno
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Bordes redondeados
=======
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
>>>>>>> 751c5c71edb03ac6923ef2d488f406b612d29ccf
                      ),
                      TextInputForm(
                        hintText: 'Nombre del proyecto',
                        labelText: 'Proyecto',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextInputForm(
                        hintText: 'Nombre del cargo',
                        labelText: 'Cargo',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextInputForm(
                        hintText: 'Ej: Yusun Florez',
                        labelText: 'Nombres Y Apellidos',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextInputForm(
                        hintText: 'Escriba una fecha',
                        labelText: 'Fecha',
                        suffixIcon: Icon(Icons.date_range_outlined),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextInputForm(
                        hintText: 'Escriba una vereda',
                        labelText: 'Vereda',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextInputForm(
                        hintText: 'Ej: Yusun Florez',
                        labelText: 'Ingeniero Residente',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextInputForm(
                        hintText: 'Almacenamiento',
                        labelText: 'Estación de Almacenamiento',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextInputForm(
                        controller: _jornadaController,
                        hintText: 'Digitar Jornada',
                        labelText: 'Jornada',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Agregar colaboradores",
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextInputForm(
                        controller: _colaboradorController,
                        hintText: 'Escribir un colaborador',
                        labelText: 'Colaborador',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextInputForm(
                        controller: _actividadRealController,
                        hintText: 'Escribir una actividad realizada',
                        labelText: 'Actividad',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextInputForm(
                        controller: _rendimientoController,
                        hintText: 'Escribir un rendimiento',
                        labelText: 'Rendimiento',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: addedRegistro,
                        child: const Text("Agregar"),
                      ),
                      const SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('N°')),
                            DataColumn(label: Text('Colaborador')),
                            DataColumn(label: Text('Actividad')),
                            DataColumn(label: Text('Rendimiento')),
                          ],
                          rows: registroPersonal.map((data) {
                            return DataRow(cells: [
                              DataCell(Text(data['numero']!)),
                              DataCell(Text(data['colaborador']!)),
                              DataCell(Text(data['actividad']!)),
                              DataCell(Text(data['rendimiento']!)),
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
                              "Observaciones acerca del reporte diario del personal",
                          labelText: "Observacion"),
                      const SizedBox(
                        height: 20,
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
          ]),
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

class TableFillContain extends StatelessWidget {
  const TableFillContain({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(1),
        child: Center(
            child: Column(children: [
          const Text("Tabla de Colaboradores"),
          const SizedBox(
            height: 10,
          ),
          Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FixedColumnWidth(100), // Ancho fijo para la primera columna
              1: FixedColumnWidth(100),
              2: FixedColumnWidth(100),
              3: FixedColumnWidth(100),
            },
            children: const [
              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Categoría',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Columna 1',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Columna 2',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Columna 3',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              // Fila 1
              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Fila 1'), // Primera columna independiente
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Dato 1.1'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Dato 1.2'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Dato 1.2'),
                  ),
                ],
              ),
              // Fila 2
              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Fila 2'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Dato 2.1'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Dato 2.2'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Dato 2.2'),
                  ),
                ],
              ),
              // Fila 3
              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Fila 3'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Dato 3.1'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Dato 3.2'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Dato 3.2'),
                  ),
                ],
              ),
              // Fila 4
              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Fila 4'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Dato 4.1'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Dato 4.2'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Dato 4.2'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const TextInputForm(
            hintText: 'Observaciones',
            labelText: 'Observaciones',
          ),
        ])));
  }
}
