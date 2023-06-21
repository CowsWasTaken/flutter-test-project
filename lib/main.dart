import 'package:flutter/material.dart';

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

  var itemList = List.of({"1", "2", "3"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cooler Name"),
        ),
        body: createList());
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  createList() {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        final item = itemList[index];
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10),
            child: const Icon(Icons.delete),
          ),
          secondaryBackground: Container(
            color: Colors.green,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 10),
            child: const Icon(Icons.add),
          ),
          child: ListTile(
            title: Text("Eintrag $item"),
          ),
          onDismissed: (direction) {
            setState(() {
              itemList.removeAt(index);
            });
            String msg = "";
            if (direction == DismissDirection.endToStart) {
              msg = "Created";
            } else if (direction == DismissDirection.startToEnd) {
              msg = "Deleted";
            }
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("$msg Eintrag $item")));
          },
        );
      },
    );
  }
}

class MyExampleSnackbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyExampleSnackbarState();
}
