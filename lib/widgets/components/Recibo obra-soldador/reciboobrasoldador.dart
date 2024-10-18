import 'package:flutter/material.dart';

class ReciboObraSoldador extends StatelessWidget {
  const ReciboObraSoldador({super.key});

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
          Container(
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Form(
                  child: Column(
                children: [
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
                    hintText: 'Ej: 10762903123',
                    labelText: 'Cedula',
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
                    hintText: 'Escriba el municipio',
                    labelText: 'Municipio',
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
                ],
              )),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Column(
                children: [
                  Text("Firmas Digitales"),
                  SizedBox(
                    height: 20,
                  ),
                  TextInputForm(
                    hintText: 'Firma del soldador de la tuberia termofusión',
                    labelText: 'Soldador',
                    suffixIcon: Icon(Icons.image_search_outlined),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextInputForm(
                    hintText: 'Firma del Supervisor',
                    labelText: 'Supervisor',
                    suffixIcon: Icon(Icons.image_search_outlined),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
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
        ])));
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
