import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';

import 'package:printing/printing.dart';

class PdfComprobante extends StatefulWidget {
  final String monto;
  final String para;
  final String banco;
  final String cbu;

  const PdfComprobante(this.monto, this.banco, this.para ,this.cbu);
  @override
  State<PdfComprobante> createState() => _PdfComprobanteState();
}

class _PdfComprobanteState extends State<PdfComprobante> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String FechaActual =
        DateFormat("d MMMM yyyy 'a' HH:mm 'hs.'", 'es_ES').format(now);
    generatePdf() async {
      final pdf = pw.Document();
      final image =
          (await rootBundle.load("assets/merca.png")).buffer.asUint8List();
      final image1 =
          (await rootBundle.load("assets/punto.png")).buffer.asUint8List();
      final image2 =
          (await rootBundle.load("assets/codigo.png")).buffer.asUint8List();
      final font = await PdfGoogleFonts.nunitoBold();
      final font2 = await PdfGoogleFonts.nunitoLight();
      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a3,
          build: (pw.Context context) {
            return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  //DATE "1"

                  pw.SizedBox(
                    height: 300.0,
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.SizedBox(
                                  width: 200.0,
                                  height: 200.0,
                                  child: pw.Image(
                                    pw.MemoryImage(image),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 100.0,
                                  height: 100.0,
                                  child: pw.Image(
                                    pw.MemoryImage(image2),
                                  ),
                                ),
                              ]),
                          pw.Expanded(
                            child: pw.Text(
                              "Comprobante de trasferencia",
                              style: pw.TextStyle(fontSize: 35.0, font: font),
                            ),
                          ),
                          pw.Text(
                            FechaActual,
                            style: pw.TextStyle(fontSize: 20.0, font: font2),
                          ),
                        ]),
                  ),
                  pw.Divider(height: 100.0),
                  //DATE "2"
                  pw.SizedBox(
                    width: 200.0,
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Trasferencia",
                              style: pw.TextStyle(fontSize: 20.0, font: font2)),
                          pw.Text(widget.monto,
                              style: pw.TextStyle(fontSize: 40.0, font: font))
                        ]),
                  ),
                  pw.Divider(height: 100.0),

                  //DATE "3"

                  pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        //IMAGEN PUNTOS
                        pw.SizedBox(
                          height: 200.0,
                          child: pw.Image(
                            pw.MemoryImage(image1),
                          ),
                        ),
                        //DUEÑO DE LA CUENTA DE MERCADO PAGO
                        pw.SizedBox(
                          height: 250.0,
                          child: pw.Column(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                //CUENTA MERCADOPAGO
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("De",
                                          style: pw.TextStyle(
                                              fontSize: 18.0, font: font2)),
                                      pw.Text("Juan Perez Almeida",
                                          style: pw.TextStyle(
                                              fontSize: 25.0, font: font)),
                                      pw.Row(children: [
                                        pw.Text("CVU : ",
                                            style: pw.TextStyle(
                                                fontSize: 18.0, font: font2)),
                                        pw.Text("000048302493249384",
                                            style: pw.TextStyle(
                                                fontSize: 18.0, font: font)),
                                      ]),
                                      pw.Text("Cuenta de Mercado Pago",
                                          style: pw.TextStyle(
                                              fontSize: 18.0, font: font)),
                                    ]),

                                //PAGO A LA OTRA CUENTA
                                pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("Para",
                                          style: pw.TextStyle(
                                              fontSize: 18.0, font: font2)),
                                      pw.Text(widget.banco,
                                          style: pw.TextStyle(
                                              fontSize: 25.0, font: font)),
                                      pw.Row(children: [
                                        pw.Text("CBU : ",
                                            style: pw.TextStyle(
                                                fontSize: 18.0, font: font2)),
                                        pw.Text(widget.cbu,
                                            style: pw.TextStyle(
                                                fontSize: 18.0, font: font)),
                                      ]),
                                      pw.Text(widget.para,
                                          style: pw.TextStyle(
                                              fontSize: 20.0, font: font)),
                                    ])
                              ]),
                        ),
                      ]),
                  //PAGO A LA OTRA CUENTA

                  pw.Divider(height: 100.0),
                  //DATE "4"
                  pw.SizedBox(
                    height: 140.0,
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.SizedBox(
                            height: 60.0,
                            child: pw.Column(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text("COELSA ID",
                                      style: pw.TextStyle(
                                          fontSize: 15.0, font: font2)),
                                  pw.Text("1LREYREUHBUEDGUYGDUE742386843286748",
                                      style: pw.TextStyle(
                                          fontSize: 15.0, font: font)),
                                ]),
                          ),
                          pw.SizedBox(
                            height: 60.0,
                            child: pw.Column(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text("Código de transferencia",
                                      style: pw.TextStyle(
                                          fontSize: 15.0, font: font2)),
                                  pw.Text("24352653625365532",
                                      style: pw.TextStyle(
                                          fontSize: 15.0, font: font)),
                                ]),
                          )
                        ]),
                  ),
                ]);
            // Center
          })); // Page
      Directory tempDir = await getApplicationDocumentsDirectory();
      String tempPath = '${tempDir.path}/mercadopago_premium-withdraw-2345.pdf';
      final file = File(tempPath);
      var path = await file.writeAsBytes(await pdf.save());
      return path.path;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("PDF GENERATORE"),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  var path = await generatePdf();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfViewer(
                        path: path,
                      ),
                    ),
                  );
                },
                child: Container(
                  child: Text("Pdf Creator"),
                )),
          ),
        ],
      ),
    );
  }
}

class PdfViewer extends StatelessWidget {
  const PdfViewer({Key? key, this.path}) : super(key: key);
  final path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DANGER FLOW'),
        actions: [
          IconButton(
              onPressed: () {
                Share.shareFiles([path]);
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: Container(
        child: PdfView(path: path),
      ),
    );
  }
}
