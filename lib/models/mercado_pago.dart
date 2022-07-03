import 'package:flutter/material.dart';

class MercadoPago extends StatelessWidget {
  const MercadoPago({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.close_sharp),
        backgroundColor: Color(0xff00A650),
        elevation: 0,
      ),
      body: Column(
        children: [
          Stack(
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text("03 julio 2022 a 16:46 hs"),
                ),
                Divider(),
                ListTile(
                  title: Text("5000"),
                ),
                Divider(),
                ListTile(
                  subtitle: Text("Ramos Luciano Alvaro"),
                  title: Text("Para"),
                ),
                Row(
                  children: [
                    Positioned(
                        left: 10,
                        right: 20,
                        child: Container(child: Text("Banco Macro"))),
                  ],
                )
              ],
            ),
          ),
          Divider(),
          //BOTONES EN PANTALLAS
          Column(
            children: [
              ElevatedButton(
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(
                    0xffE3F0F8,
                  )),
                  onPressed: () {},
                  child: Container(
                    height: 45,
                    width: 300.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Hacer otra transferencia",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(
                    0xffFFFFFF,
                  )),
                  onPressed: () {},
                  child: Container(
                    height: 45,
                    width: 300.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Ir al inicio",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
