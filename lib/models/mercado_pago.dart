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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Column(
            children: [
              Container(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("28 julio 2022 a 16:15 hs"),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                child: ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\u0024 5.000",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Container(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Para"),
                      Divider(),
                      Text(
                        "Luciano Juan Lopez",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Divider(),
                      Text("Banco Nacion")
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
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
                      elevation: 0,
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
