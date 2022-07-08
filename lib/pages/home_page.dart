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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: _monto),
            TextField(
              controller: _para,
            ),
            TextField(
              controller: _banco,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MercadoPago(_monto.text,_para.text,_banco.text)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    child: Text("INGRESAR"),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
