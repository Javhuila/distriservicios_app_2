import 'dart:io';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart';
import 'package:pdf/widgets.dart' as pw;

const _scopes = [drive.DriveApi.driveFileScope];

Future<void> uploadFileToDrive(
    String fileName, Map<String, dynamic> data, File? image) async {
  final clientId = ClientId(
      '92755572585-a8peimkapaeo7vatu86k499deh9g8l8s.apps.googleusercontent.com',
      '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');
  final client = await clientViaUserConsent(clientId, _scopes, (url) {
    print('Por favor, ve a la siguiente URL: $url');
  });

  var driveApi = drive.DriveApi(client);
  var driveFile = drive.File()
    ..name = fileName
    ..mimeType = 'application/pdf';

  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Text('Nombre Técnico: ${data['nombreTecnico'] ?? ''}'),
            pw.Text('Usuario: ${data['nombreUsuario'] ?? ''}'),
            pw.Text('Código Usuario: ${data['codigoUsuario'] ?? ''}'),
            pw.Text('Cédula: ${data['cedula'] ?? ''}'),
            pw.Text('Fecha Construcción: ${data['fechaConstruccion'] ?? ''}'),
            pw.Text('Fecha Servicio: ${data['fechaServicio'] ?? ''}'),
            pw.SizedBox(height: 20),
            pw.Text('Materiales:',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(children: [
                  pw.Text('Código'),
                  pw.Text('Nombre'),
                  pw.Text('Cantidad'),
                ]),
                // Aquí asumes que tienes una lista de materiales
                ...data['materiales'].map<pw.TableRow>((material) {
                  return pw.TableRow(children: [
                    pw.Text(material['codigo']),
                    pw.Text(material['nombre']),
                    pw.Text(material['cantidad'].toString()),
                  ]);
                }).toList(),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Text('Firma del Usuario: ${data['firma'] ?? ''}'),
          ],
        );
      },
    ),
  );

  final output = await File('temp.pdf').create();
  await output.writeAsBytes(await pdf.save());

  var media = drive.Media(output.openRead(), output.lengthSync());

  var result = await driveApi.files.create(driveFile, uploadMedia: media);
  print('Archivo subido: ${result.id}');
  client.close();
}
