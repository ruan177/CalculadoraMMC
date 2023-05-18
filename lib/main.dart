import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp>{
  int number1 = 0;
  int number2 = 0;

  void setNumber1(String number){
    setState((){
      number1 = int.parse(number);
    });
  }

  void setNumber2(String number){
    setState((){
      number2 = int.parse(number);
    });
  }

  int calculaMMC(int num1, int num2){
    int numeroMaior = (num1 > num2) ? num1 : num2;
    while (true) {
      if (numeroMaior % num1 == 0 && numeroMaior % num2 == 0) {
        return numeroMaior;
      }
      numeroMaior++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Exercise",
        home: Scaffold(
        body:
        Center(
        child: SizedBox(
          width: 600,
          height:600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Calculadora "
                    "MMC",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 50,
                )
              ),
              Gap(20),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (e) => setNumber1(e),
                decoration: InputDecoration(
                    hintText: 'Enter your number here',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (e) => setNumber2(e),
                decoration: InputDecoration(
                  hintText: 'Enter your second number here',
                ),
              ),
            Gap(20),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('O mmc de ${ number1} e ${ number2} '),
                content: Text('E: ${calculaMMC(number1, number2)}'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
            child: const Text('Calcular'),
          ),
        ])
      ))));



  }
}


