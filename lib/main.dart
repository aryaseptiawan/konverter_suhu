import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
 runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
         body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Masukkan Suhu Dalam Celcius',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(5, 30, 5, 30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Suhu dalam Kelvin"),
                            Padding(padding: EdgeInsets.only(bottom: 20)),
                            Text(
                              "150",
                              style: TextStyle(fontSize: 36),
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
                          children: const [
                            Text("Suhu dalam Reamor"),
                            Padding(padding: EdgeInsets.only(bottom: 20)),
                            Text(
                              "200",
                              style: TextStyle(fontSize: 36),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Suhu dalam Reamor"),
                            Padding(padding: EdgeInsets.only(bottom: 20)),
                            Text(
                              "400",
                              style: TextStyle(fontSize: 36),
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
                onPressed: () {},
                child: const Text('Konversi Suhu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}