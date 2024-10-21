import 'package:flutter/material.dart';

class OrdenServicio extends StatefulWidget {
  const OrdenServicio({super.key});

  @override
  State<OrdenServicio> createState() => _OrdenServicioState();
}

class _OrdenServicioState extends State<OrdenServicio> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          title: const Text(
            'Orden de Servicio',
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
                      Text("DS-P-F-005"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Fecha"),
                      Text("20-05-2024"),
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
                      child: Column(children: [
                        const Text(
                          "1. Suscriptor",
                          style: TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Escriba el nombre',
                          labelText: 'Nombre',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Escriba el primer apellido',
                          labelText: 'Primer Apellido',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Escriba el segundo apellido',
                          labelText: 'Segundo Apellido',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Escriba la direccion',
                          labelText: 'Direccion',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Escriba el departamento',
                          labelText: 'Departamento',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Tipo de identificación',
                          labelText: 'Identificacion',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Escriba el n° identificacion',
                          labelText: 'N° identificacion',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Lugar de Expedicion',
                          labelText: 'Expedicion',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Tipo de vivienda',
                          labelText: 'Vivienda',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Escriba el barrio/vereda',
                          labelText: 'Barrio/Vereda',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Escriba el n° estrato',
                          labelText: 'Estrato',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Tipo de calidad',
                          labelText: 'Actua en calidad de',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Tipo de instalación',
                          labelText: 'Instalacion',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Inmobiliaria y/o escritura',
                          labelText: 'Matricula Inmobiliaria',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Escribe el codigo catastral',
                          labelText: 'Codigo Catastral',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Escriba el telefono',
                          labelText: 'Telefono',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Escriba el movil',
                          labelText: 'Movil',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Escriba el email',
                          labelText: 'Email',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                            "El suscriptor o usuario que la certificacion previa a la puesta del servicio, sea realizada por DISTRISERVICIOES S.A.S ESP a traves de un organismo de certificacion o inspeccion acreditado."),
                        const SizedBox(
                          height: 20,
                        ),
                        Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "2. Descripcion del servicio y precio",
                          style: TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          hintText: 'Escriba el email',
                          labelText: 'Email',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                      ]))))
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
