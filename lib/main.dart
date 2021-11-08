import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CGPA Predictor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'CG Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double maxcg = 0;
  double cgnearneg = 0;
  double cgnear = 0;
  double cg = 0;
  double creditstill = 0;
  double creditsinthis = 0;
  String sfornearneg = "0";
  String maxs = "0";
  String sfornear = "0";
  String exps = "0";
  static final cgcontroller = TextEditingController();
  static final creditstillnow = TextEditingController();
  static final creditthissem = TextEditingController();
  static final cgexp = TextEditingController();

  void _incrementCounter() {
    setState(() {
      cg = double.parse(cgcontroller.text);
      cgnear = (((((cg + 0.25) * 2)).round()) / 2);
      if (cgnear == 10.0) cgnear = 9.5;
      cgnearneg = cgnear - 0.5;
      creditsinthis = double.parse(creditthissem.text);
      creditstill = double.parse(creditstillnow.text);
      maxs = (((cg * creditstill) + (10.0 * creditsinthis)) /
              (creditsinthis + creditstill))
          .toStringAsFixed(2);
      sfornear =
          (((cgnear * (creditsinthis + creditstill)) - (cg * creditstill)) /
                  creditsinthis)
              .toStringAsFixed(2);
      sfornearneg =
          (((cgnearneg * (creditsinthis + creditstill)) - (cg * creditstill)) /
                  creditsinthis)
              .toStringAsFixed(2);
      exps =
          (((cg * creditstill) + (double.parse(cgexp.text) * creditsinthis)) /
                  (creditsinthis + creditstill))
              .toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Center(
            heightFactor: 1.3,
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 50.0),
                    child: Column(
                      children: <Widget>[
                        RichText(
                          text: const TextSpan(
                            text:
                                'Fill all the fields and Press the calculate button',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            text: 'Enter your Credits till now\n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'Credits Till Now',
                            focusColor: Colors.black,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          controller: creditstillnow,
                        ),
                        RichText(
                          text: const TextSpan(
                            text: '\nEnter your CGPA Till now\n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'CGPA Till Now',
                            focusColor: Colors.black,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          controller: cgcontroller,
                        ),
                        RichText(
                          text: const TextSpan(
                            text: '\nEnter the credits of this semester\n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'Credit in This Semester',
                            focusColor: Colors.black,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          controller: creditthissem,
                        ),
                        RichText(
                          text: const TextSpan(
                            text: '\nEnter your Expected CGPA this Semester\n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'Expected CGPA',
                            focusColor: Colors.black,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          controller: cgexp,
                        ),
                        ElevatedButton(
                          onPressed: _incrementCounter,
                          child: const Text('Submit'),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 50.0),
                    child: Column(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: 'The Maximum CGPA you can reach is: ' + maxs,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'The CGPA required to reach ' +
                                (cgnearneg).toString() +
                                ' CGPA is :' +
                                sfornearneg,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'The CGPA required to reach ' +
                                cgnear.toString() +
                                ' CGPA is :' +
                                sfornear,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text:
                                'Your Expected CGPA after this sem will be : ' +
                                    exps,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
