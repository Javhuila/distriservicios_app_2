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
        backgroundColor: const Color.fromARGB(255, 71, 39, 176),
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
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 50),
                  CircleAvatar(
                      // width: double.infinity,
                      // height: 70,
                      radius: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ReciboObraMaterial()),
                          );
                        },
                        child: Container(
                          width: 90,
                          height: 150,
                          child: Center(
                            child: const Text(
                              "Recibo de obra y de Material",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                              maxLines: 5,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(height: 50),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54, width: 2.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: double.infinity,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ReciboObraSoldador()),
                          );
                        },
                        child: const Text(
                          "Recibo de Obra de soldador por Tubos",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                  const SizedBox(height: 50),
                  SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const InformeDiarioObra()),
                          );
                        },
                        child: const Text(
                          "Informe diario de Obra",
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                  const SizedBox(height: 50),
                  SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ReporteDiarioPersonal()),
                          );
                        },
                        child: const Text(
                          "Reporte diario del Personal",
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                  const SizedBox(height: 50),
                  SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OrdenServicio()),
                          );
                        },
                        child: const Text(
                          "Orden de Servicio",
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                ],
              )),
        ),
      ),
    );
  }
}
