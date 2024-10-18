import 'package:flutter/material.dart';

class ReporteDiarioPersonal extends StatelessWidget {
  const ReporteDiarioPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reporte diario del personal'),
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
            Container(
              // color: Colors.blue,
              // width: 500,
              // height: 300,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Form(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 20,
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
                      hintText: 'Jornada',
                      labelText: 'Jornada Mañana',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextInputForm(
                      hintText: 'Jornada',
                      labelText: 'Jornada Tarde',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )),
              ),
            ),
            const Divider(),
            Container(
                child: Center(
                    child: Column(children: [
              Text("Tabla de Colaboradores"),
              SizedBox(
                height: 10,
              ),
              Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FixedColumnWidth(
                      100), // Ancho fijo para la primera columna
                  1: FixedColumnWidth(100),
                  2: FixedColumnWidth(100),
                  3: FixedColumnWidth(100),
                },
                children: [
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
              SizedBox(
                height: 20,
              ),
              TextInputForm(
                hintText: 'Observaciones',
                labelText: 'Observaciones',
              ),
            ]))),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple, // Color de fondo
                      onPrimary: Colors.white, // Color del texto
                      padding: EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15), // Espaciado interno
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Bordes redondeados
                      ),
                      elevation: 5, // Sombra
                    ),
                    child: const Text(
                      "Enviar",
                      style: TextStyle(fontSize: 25),
                    ),
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
  });

  final String labelText, hintText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, escriba lo nuevamente';
        }
        return null;
      },
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
