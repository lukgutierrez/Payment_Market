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
      body: ListView(
        children: [
          SizedBox(
              width: 200.0,
              height: 200.0,
              child: Image(image: AssetImage("assets/merca.png"))),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _monto,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "Monto:",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black)),
                ),
                Divider(
                  height: 50,
                  color: Colors.transparent,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  controller: _para,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "Para:",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black)),
                ),
                Divider(
                  height: 50,
                  color: Colors.transparent,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _cbu,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "CBU / CVU:",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black)),
                ),
                Divider(
                  height: 50,
                  color: Colors.transparent,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  controller: _banco,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "Banco:",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black)),
                ),
                Divider(
                  height: 80,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              height: 50.0,
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
                        builder: (context) => MercadoPago(_monto.text,
                            _para.text, _banco.text, _cbu.text, Path)),
                  );
                },
                child: Text("TRANSFERIR"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
