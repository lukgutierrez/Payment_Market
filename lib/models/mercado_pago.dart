import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mercado_pago/pages/home_page.dart';

class MercadoPago extends StatelessWidget {
  final String monto;
  final String para;
  final String banco;
  const MercadoPago(this.monto, this.para, this.banco);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String FechaActual =
        DateFormat("d MMMM yyyy 'a' HH:mm 'hs.'", 'es_ES').format(now);
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
          Column(
            children: [
              //DATO N° 1
              Date(FechaActual),
              Divider(
                color: Colors.black,
              ),
              //DATO N° 2
              Date(monto),
              Divider(),
              //DATO N° 3
              Container(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Para"),
                      Divider(),
                      Text(
                        para,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Divider(),
                      Text(banco)
                    ],
                  ),
                ),
              ),
            ],
          ),

          //BOTONES EN PANTALLAS
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //BOTON N°1
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Container(
                    height: 45,
                    width: 300.0,
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
        height: 75.0,
        color: Color(0xff00A650),
      ),
      Positioned(
        bottom: 0.5,
        left: 20.0,
        child: Row(
          children: [
            Text("Ya enviamos tu transferencia",
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
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
Date(Datos) {
  return Container(
    child: ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Datos,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
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
        width: 300.0,
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
