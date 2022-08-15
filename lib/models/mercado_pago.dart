import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mercado_pago/pages/home_page.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:printing/printing.dart';

class MercadoPago extends StatelessWidget {
  final String monto;
  final String para;
  final String banco;
  final String cbu;
  final path;
  const MercadoPago(this.monto, this.para, this.banco, this.cbu,this.path);

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
                          pw.Text("\$ $monto",
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
                                      pw.Text("Lucas Alejandro Garcia",
                                          style: pw.TextStyle(
                                              fontSize: 25.0, font: font)),
                                      pw.Row(children: [
                                        pw.Text("CVU : ",
                                            style: pw.TextStyle(
                                                fontSize: 18.0, font: font2)),
                                        pw.Text("4537000900016266837890",
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
                                      pw.Text(para,
                                          style: pw.TextStyle(
                                              fontSize: 25.0, font: font)),
                                      pw.Row(children: [
                                        pw.Text("CBU / CVU : ",
                                            style: pw.TextStyle(
                                                fontSize: 18.0, font: font2)),
                                        pw.Text(cbu,
                                            style: pw.TextStyle(
                                                fontSize: 18.0, font: font)),
                                      ]),
                                      pw.Text(banco,
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
                                  pw.Text("1LREYREUHBUEDGUYGDU6654YHIU76RD",
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
                                  pw.Text("24352653625365",
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
        leading: Icon(Icons.close_sharp),
        backgroundColor: Color(0xff00A650),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //ETAPA N°1
          Transferencia(),
          //CARGA DE DATOS
          Expanded(
            child: Container(
              child: Column(
                children: [
                  //DATO N° 1
                  Date(
                    FechaActual,
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
                  ),
                  Divider(),
                  //DATO N° 2
                  Container(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$ $monto",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Date(
                  //   monto,
                  //   TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0),
                  // ),
                  Divider(),
                  //DATO N° 3
                  Container(
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Para",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xff8B8B8B)),
                          ),
                          Divider(
                            color: Colors.transparent,
                          ),
                          Text(
                            para,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0),
                          ),
                          Divider(
                            color: Colors.transparent,
                          ),
                          Text(
                            banco,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xff8B8B8B)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //BOTONES EN PANTALLAS
          Container(
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //BOTON N°15
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                    ),
                    onPressed: () async {
                      var path = await generatePdf();
                      Share.shareFiles([path]);
                     
                    },
                    child: Container(
                      height: 45,
                      width: 340.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(image: AssetImage("assets/share.png")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Compartir comprobante"),
                          ),
                        ],
                      ),
                    )),
                //BOTON N° 2
                Botones(
                    Color(
                      0xffE3F0F8,
                    ),
                    () {},
                    "Hacer otra trasferencia"),
                //BOTON N° 3
                Botones(
                    Color(
                      0xffFFFFFF,
                    ), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }, "Ir al inicio")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//ETAPA N° 1
Transferencia() {
  return Stack(
    children: [
      Container(
        height: 80.0,
        color: Color(0xff00A650),
      ),
      Positioned(
        bottom: 0.5,
        left: 20.0,
        child: Row(
          children: [
            Text("Ya enviamos tu transferencia",
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
            Container(
              width: 30.0,
            ),
            SizedBox(
                width: 100.0,
                height: 100.0,
                child: Image(image: AssetImage("assets/banck.png")))
          ],
        ),
      ),
    ],
  );
}

//DATOS
Date(Datos, Letra) {
  return Container(
    child: ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Datos, style: Letra),
        ],
      ),
    ),
  );
}

//BOTONES

Botones(colores, pagina, texxto) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(elevation: 0, primary: colores),
      onPressed: pagina,
      child: Container(
        height: 45,
        width: 340.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                texxto,
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ));
}
