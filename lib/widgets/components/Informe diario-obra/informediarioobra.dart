import 'package:flutter/material.dart';

class InformeDiarioObra extends StatefulWidget {
  const InformeDiarioObra({super.key});

  @override
  State<InformeDiarioObra> createState() => _InformeDiarioObraState();
}

class _InformeDiarioObraState extends State<InformeDiarioObra> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fechadiarioController = TextEditingController();

  // Controladores para los campos de cada tabla
  final TextEditingController _campo1Tabla1Controller = TextEditingController();
  final TextEditingController _campo2Tabla1Controller = TextEditingController();
  final TextEditingController _campo3Tabla1Controller = TextEditingController();
  final TextEditingController _campo4Tabla1Controller = TextEditingController();
  final TextEditingController _campo5Tabla1Controller = TextEditingController();
  final TextEditingController _campo6Tabla1Controller = TextEditingController();
  final TextEditingController _campo7Tabla1Controller = TextEditingController();
  final TextEditingController _campo8Tabla1Controller = TextEditingController();
  final TextEditingController _campo9Tabla1Controller = TextEditingController();

  // Repite esto para la Tabla 2
  final TextEditingController _campo1Tabla2Controller = TextEditingController();
  final TextEditingController _campo2Tabla2Controller = TextEditingController();
  final TextEditingController _campo3Tabla2Controller = TextEditingController();
  final TextEditingController _campo4Tabla2Controller = TextEditingController();
  final TextEditingController _campo5Tabla2Controller = TextEditingController();
  final TextEditingController _campo6Tabla2Controller = TextEditingController();

  // Listas para guardar los datos
  final List<Map<String, String>> _datosTabla1 = [];
  final List<Map<String, String>> _datosTabla2 = [];

  void _guardarDatos(int tablaIndex) {
    if (_formKey.currentState!.validate()) {
      Map<String, String> datosGuardados = {};

      if (tablaIndex == 1) {
        datosGuardados = {
          'Campo 1': _campo1Tabla1Controller.text,
          'Campo 2': _campo2Tabla1Controller.text,
          'Campo 3': _campo3Tabla1Controller.text,
          'Campo 4': _campo4Tabla1Controller.text,
          'Campo 5': _campo5Tabla1Controller.text,
          'Campo 6': _campo6Tabla1Controller.text,
          'Campo 7': _campo7Tabla1Controller.text,
          'Campo 8': _campo8Tabla1Controller.text,
          'Campo 9': _campo9Tabla1Controller.text,
        };
        _datosTabla1.add(datosGuardados);
        // Limpiar los campos de Tabla 1
        _campo1Tabla1Controller.clear();
        _campo2Tabla1Controller.clear();
        _campo3Tabla1Controller.clear();
        _campo4Tabla1Controller.clear();
        _campo5Tabla1Controller.clear();
        _campo6Tabla1Controller.clear();
        _campo7Tabla1Controller.clear();
        _campo8Tabla1Controller.clear();
        _campo9Tabla1Controller.clear();
      } else if (tablaIndex == 2) {
        datosGuardados = {
          'Campo 1': _campo1Tabla2Controller.text,
          'Campo 2': _campo2Tabla2Controller.text,
          'Campo 3': _campo3Tabla2Controller.text,
          'Campo 4': _campo4Tabla2Controller.text,
          'Campo 5': _campo5Tabla2Controller.text,
          'Campo 6': _campo6Tabla2Controller.text,
        };
        _datosTabla2.add(datosGuardados);
        // Limpiar los campos de Tabla 2
        _campo1Tabla2Controller.clear();
        _campo2Tabla2Controller.clear();
        _campo3Tabla2Controller.clear();
        _campo4Tabla2Controller.clear();
        _campo5Tabla2Controller.clear();
        _campo6Tabla2Controller.clear();
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registro guardado')));

      // Actualizar el estado para mostrar las tablas
      setState(() {});
    }
  }

  void _mostrarDatos() {
    // Imprimir todos los datos de todas las tablas
    print('Datos de Tabla 1: $_datosTabla1');
    print('Datos de Tabla 2: $_datosTabla2');

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Datos impresos en consola')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          title: const Text(
            'Sistema de gestión integrado',
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
                        TextInputForm(
                          hintText: 'Escriba una vereda',
                          labelText: 'Vereda',
                          // onSaved: (value) {
                          //   _proyecto = value;
                          // },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextInputForm(
                          hintText: 'Escriba el ingenierio residente',
                          labelText: 'Ingenierio',
                          // onSaved: (value) {
                          //   _proyecto = value;
                          // },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextInputForm(
                          hintText: 'Escriba la estacion',
                          labelText: 'Estacion Almacenamiento',
                          // onSaved: (value) {
                          //   _proyecto = value;
                          // },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextInputForm(
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
                        // Campos de la Tabla 1
                        Text('Tendido TUberia De Polietileno (ml)',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _campo1Tabla1Controller,
                          hintText: 'Escriba el tramo',
                          labelText: 'Tramo',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _campo1Tabla2Controller,
                          hintText: 'Escriba la acometidas',
                          labelText: 'Acometidas',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _campo3Tabla1Controller,
                          hintText: 'Tipo A ó Tipo RD',
                          labelText: '1/2"',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _campo4Tabla1Controller,
                          hintText: 'Tipo RD',
                          labelText: '3/4"',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _campo5Tabla1Controller,
                          hintText: 'Tipo RD',
                          labelText: '1"',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _campo6Tabla1Controller,
                          hintText: 'Tipo RD',
                          labelText: '2"',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _campo7Tabla1Controller,
                          hintText: 'Tipo RD',
                          labelText: '1"',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _campo8Tabla1Controller,
                          hintText: 'Total Dia',
                          labelText: 'Dia en Total',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _campo9Tabla1Controller,
                          hintText: 'Acumulado',
                          labelText: 'Acumulado',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () => _guardarDatos(1),
                          child: Text('Guardar Tabla 1'),
                        ),
                        SizedBox(height: 32),

                        // Tabla para mostrar los datos guardados
                        DataTable(
                          columns: const [
                            DataColumn(label: Text('1')),
                            DataColumn(label: Text('2')),
                            DataColumn(label: Text('3')),
                            DataColumn(label: Text('4')),
                            DataColumn(label: Text('5')),
                            DataColumn(label: Text('6')),
                            DataColumn(label: Text('7')),
                            DataColumn(label: Text('8')),
                            DataColumn(label: Text('9')),
                          ],
                          rows: _datosTabla1.map((datos) {
                            return DataRow(cells: [
                              DataCell(Text(datos['1'] ?? '')),
                              DataCell(Text(datos['2'] ?? '')),
                              DataCell(Text(datos['3'] ?? '')),
                              DataCell(Text(datos['4'] ?? '')),
                              DataCell(Text(datos['5'] ?? '')),
                              DataCell(Text(datos['6'] ?? '')),
                              DataCell(Text(datos['7'] ?? '')),
                              DataCell(Text(datos['8'] ?? '')),
                              DataCell(Text(datos['9'] ?? '')),
                            ]);
                          }).toList(),
                        ),
                        SizedBox(height: 32),

                        // Campos de la Tabla 2
                        Text('Tabla 2', style: TextStyle(fontSize: 20)),
                        TextFormField(
                          controller: _campo1Tabla2Controller,
                          decoration: InputDecoration(labelText: 'Campo 1'),
                          validator: (value) => value!.isEmpty
                              ? 'Por favor, ingrese un dato'
                              : null,
                        ),
                        TextFormField(
                          controller: _campo2Tabla2Controller,
                          decoration: InputDecoration(labelText: 'Campo 2'),
                          validator: (value) => value!.isEmpty
                              ? 'Por favor, ingrese un dato'
                              : null,
                        ),
                        TextFormField(
                          controller: _campo3Tabla2Controller,
                          decoration: InputDecoration(labelText: 'Campo 3'),
                          validator: (value) => value!.isEmpty
                              ? 'Por favor, ingrese un dato'
                              : null,
                        ),
                        TextFormField(
                          controller: _campo4Tabla2Controller,
                          decoration: InputDecoration(labelText: 'Campo 4'),
                          validator: (value) => value!.isEmpty
                              ? 'Por favor, ingrese un dato'
                              : null,
                        ),
                        TextFormField(
                          controller: _campo5Tabla2Controller,
                          decoration: InputDecoration(labelText: 'Campo 5'),
                          validator: (value) => value!.isEmpty
                              ? 'Por favor, ingrese un dato'
                              : null,
                        ),
                        TextFormField(
                          controller: _campo6Tabla2Controller,
                          decoration: InputDecoration(labelText: 'Campo 6'),
                          validator: (value) => value!.isEmpty
                              ? 'Por favor, ingrese un dato'
                              : null,
                        ),
                        ElevatedButton(
                          onPressed: () => _guardarDatos(2),
                          child: Text('Guardar Tabla 2'),
                        ),
                        SizedBox(height: 32),

                        ElevatedButton(
                          onPressed: _mostrarDatos,
                          child: Text('Mostrar Todos los Datos'),
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
