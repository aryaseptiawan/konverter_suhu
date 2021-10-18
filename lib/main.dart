import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // text controller
  TextEditingController etInput = TextEditingController();
  //variabel berubah
  double _inputUser = 0;
  double _kelvin = 0;
  double _fahrenheit = 0;
  double _reamur = 0;
  final _formKey = GlobalKey<FormState>();

  _konversiSuhu() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        _inputUser = double.parse(etInput.text);
        _reamur = 4 / 5 * _inputUser;
        _fahrenheit = 9 / 5 * _inputUser + 32;
        _kelvin = _inputUser + 273;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konverter Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: etInput,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan masukkan suhu dalam celcius';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Masukkan Suhu Dalam Celcius',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.fromLTRB(5, 30, 5, 30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Suhu Kelvin"),
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            Text(
                              _kelvin.toStringAsFixed(2),
                              style: const TextStyle(fontSize: 36),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(5, 30, 5, 30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Suhu Fahrenheit"),
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            Text(
                              _fahrenheit.toStringAsFixed(2),
                              style: const TextStyle(fontSize: 36),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.fromLTRB(5, 30, 5, 30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Suhu Reamur"),
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            Text(
                              _reamur.toStringAsFixed(2),
                              style: const TextStyle(fontSize: 36),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: _konversiSuhu,
                child: const Text('Konversi Suhu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}