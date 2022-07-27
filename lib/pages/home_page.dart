import 'package:flutter/material.dart';
import 'package:mercado_pago/models/mercado_pago.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _monto = TextEditingController(text: "");
  TextEditingController _para = TextEditingController(text: "");
  TextEditingController _banco = TextEditingController(text: "");
  TextEditingController _cbu = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 150.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF00B1EA),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 150.0,
                  height: 150.0,
                  child: Image(image: AssetImage("assets/market.webp"))),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      controller: _monto,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: "Monto:",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black)),
                    ),
                    TextField(
                      controller: _para,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: "Para:",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black)),
                    ),
                    TextField(
                      controller: _cbu,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: "CBU:",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black)),
                    ),
                    TextField(
                      controller: _banco,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: "Banco:",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
              width: 200.0,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF00B1EA)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MercadoPago(_monto.text, _para.text, _banco.text,_cbu.text)),
                  );
                },
                child: Text("INGRESAR"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
