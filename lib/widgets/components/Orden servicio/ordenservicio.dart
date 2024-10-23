import 'package:flutter/material.dart';

class OrdenServicio extends StatefulWidget {
  const OrdenServicio({super.key});

  @override
  State<OrdenServicio> createState() => _OrdenServicioState();
}

class _OrdenServicioState extends State<OrdenServicio> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fechaGeneralController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _fristApellidoController =
      TextEditingController();
  final TextEditingController _secondApellidoController =
      TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _departamentoController = TextEditingController();
  final TextEditingController _ciudadController = TextEditingController();
  final TextEditingController _identificacionController =
      TextEditingController();
  final TextEditingController _nIdentificacionController =
      TextEditingController();
  final TextEditingController _fechaExpedicionController =
      TextEditingController();
  final TextEditingController _tipoViviendaController = TextEditingController();
  final TextEditingController _barrioVeredaController = TextEditingController();
  final TextEditingController _estratoController = TextEditingController();
  final TextEditingController _actuaCalidadController = TextEditingController();
  final TextEditingController _instalacionController = TextEditingController();
  final TextEditingController _matriculaInmobiliariaController =
      TextEditingController();
  final TextEditingController _codigoCastralController =
      TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _movilController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _conceptoController = TextEditingController();
  final TextEditingController _cantidadController = TextEditingController();
  final TextEditingController _valorUnitarioController =
      TextEditingController();
  final TextEditingController _totalController = TextEditingController();
  final TextEditingController _formaPagoController = TextEditingController();
  final TextEditingController _itemsFormaPagoController =
      TextEditingController();
  final TextEditingController _subsidioController = TextEditingController();
  final TextEditingController _otrosFormaPagoController =
      TextEditingController();

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
                          controller: _fechaGeneralController,
                          hintText: 'Escriba una fecha',
                          labelText: 'Fecha',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _nombreController,
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
                          controller: _fristApellidoController,
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
                          controller: _secondApellidoController,
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
                          controller: _direccionController,
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
                          controller: _departamentoController,
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
                          controller: _ciudadController,
                          hintText: 'Escriba la ciudad',
                          labelText: 'Ciudad',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _identificacionController,
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
                          controller: _nIdentificacionController,
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
                          controller: _fechaExpedicionController,
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
                          controller: _tipoViviendaController,
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
                          controller: _barrioVeredaController,
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
                          controller: _estratoController,
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
                          controller: _actuaCalidadController,
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
                          controller: _instalacionController,
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
                          controller: _matriculaInmobiliariaController,
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
                          controller: _codigoCastralController,
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
                          controller: _telefonoController,
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
                          controller: _movilController,
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
                          controller: _emailController,
                          hintText: 'Escriba el email',
                          labelText: 'Email',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
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
                          controller: _conceptoController,
                          hintText: 'Escriba un concepto',
                          labelText: 'Concepto',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _cantidadController,
                          hintText: 'Escriba una cantidad',
                          labelText: 'Cantidad',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _valorUnitarioController,
                          hintText: 'Escriba un valor unitario',
                          labelText: 'Valor unitario',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _totalController,
                          hintText: 'Escriba el Total',
                          labelText: 'Total',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "3. Forma de Pago",
                          style: TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _formaPagoController,
                          hintText: 'Escriba forma de pago',
                          labelText: 'Forma Pago',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _itemsFormaPagoController,
                          hintText: 'Escriba la financiacion',
                          labelText: 'Financiacion',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _subsidioController,
                          hintText: 'Escriba el subsidio',
                          labelText: 'Subsidio',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextInputForm(
                          controller: _otrosFormaPagoController,
                          hintText: 'Otros',
                          labelText: 'Otros',
                          // onSaved: (value) {
                          //   _nombreTecnico = value;
                          // },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("texto acerca del contrato..."),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("24. Yo..."),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("25. NOTIFICACION ELECTRONICA, "),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("En consecuencia, de..."),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("El suscriptor/propietario y/o usuario"),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "Firma del usuario",
                            labelText: "Usuario/Propietario"),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "Nombre del usuario",
                            labelText: "Nombre"),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "Numero de identificacion",
                            labelText: "C.C/Nit"),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text("Referencia Familiar"),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "Nombre del familiar",
                            labelText: "Nombre"),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "Telefono del familiar",
                            labelText: "Telefono"),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "Parentesco del usuario",
                            labelText: "Parentesco"),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Referencia Personal"),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "Nombre del usuario",
                            labelText: "Nombre"),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "Telefono del usuario",
                            labelText: "Telefono"),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "Parentesco del usuario",
                            labelText: "Parentesco"),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Para uso exclusivo de DISTRISERVICIOS S.A.S ESP",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                size: 50,
                              ),
                              Expanded(
                                child: Text(
                                  "Ningun funcionario esta autorizado para recibir dinero en efectivo",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "Nombre del asesor",
                            labelText: "Nombre Asesor"),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "Vivienda", labelText: "Coordenada"),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "coordenadas...",
                            labelText: "Centro Medicion"),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "Escriba las observaciones",
                            labelText: "Observaciones"),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextInputForm(
                            hintText: "Firma del asesor...",
                            labelText: "Firma"),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                            "Se hace entrega del contrato en condiciones uniformes"),
                        const Text("Si"),
                        const Text("No"),
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
