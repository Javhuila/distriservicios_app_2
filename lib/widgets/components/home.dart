import 'package:distriservicios_app_2/widgets/components/Informe%20diario-obra/informediarioobra.dart';
import 'package:distriservicios_app_2/widgets/components/Orden%20servicio/ordenservicio.dart';
import 'package:distriservicios_app_2/widgets/components/Reporte%20diario-personal/reportediariopersonal.dart';
import 'package:distriservicios_app_2/widgets/components/profile.dart';
import 'package:flutter/material.dart';

import 'Recibo obra-material/reciboobramaterial.dart';
import 'Recibo obra-soldador/reciboobrasoldador.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DistriServicios ESP',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
            icon: const Icon(Icons.person_outline_outlined),
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 50),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ReciboObraMaterial()),
                          );
                        },
                        child: const Text("Recibo de obra y de Material"),
                      )),
                  const SizedBox(height: 50),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ReciboObraSoldador()),
                          );
                        },
                        child:
                            const Text("Recibo de Obra de soldador por Tubos"),
                      )),
                  const SizedBox(height: 50),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const InformeDiarioObra()),
                          );
                        },
                        child: const Text("Informe diario de Obra"),
                      )),
                  const SizedBox(height: 50),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ReporteDiarioPersonal()),
                          );
                        },
                        child: const Text("Reporte diario del Personal"),
                      )),
                  const SizedBox(height: 50),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OrdenServicio()),
                          );
                        },
                        child: const Text("Orden de Servicio"),
                      )),
                ],
              )),
        ),
      ),
    );
  }
}
