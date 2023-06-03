import 'package:flutter/material.dart';

import 'SuperGoodButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Superhero App", home: MyExampleSnackbar());
  }
}

class MyButton extends StatelessWidget {
  int counter;

  MyButton(this.counter, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('The counter is $counter')));
      },
    );
  }
}

class MyExampleSnackbarState extends State<MyExampleSnackbar> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cooler Name"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hallo, hier bin ich ein Text",
              style: Theme.of(context).textTheme.headlineSmall),
          SuperGoodButton(counter)
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.plus_one),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }
}

class MyExampleSnackbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyExampleSnackbarState();
}
