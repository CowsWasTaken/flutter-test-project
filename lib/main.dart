import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Superhero App", home: DrawerExample());
    // MyExampleSnackbar());
  }


}

class DrawerExample extends StatefulWidget {
  const DrawerExample({super.key});

  @override
  State<StatefulWidget> createState() => _DrawerExampleState();

}

class _DrawerExampleState extends State<DrawerExample> with RestorationMixin{

  final RestorableInt _currentIndex = RestorableInt(0);

  @override
  Widget build(BuildContext context) {
    return createDrawerExample();
  }

  createDrawerExample() {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Drawer"),
        ),
        body: const Center(
          child: Text("Draw me baby !!!"),
        ),
        drawer: Drawer(
          child: buildDrawerElements(),
        ),
      bottomNavigationBar:
      BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Account"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: "Account"
          ),
        ],
        currentIndex: _currentIndex.value,
        onTap: (index) {
          setState(() {
            _currentIndex.value = index;
            print(_currentIndex.value);
          });
        },
      ),
    );
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  buildDrawerElements() {
    return ListView(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text("Cows Are Beautiful"),
          accountEmail: Text("cows@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.brown,
            child: Text("CAB"),
          ),
        ),
        ListTile(
          title: const Text("Dashboard"),
          onTap: () => launchUrl('https://flutter.dev'),
        ),
        const ListTile(
          title: Text("Impressum"),
        ),
        const ListTile(
          title: Text("Settings"),
        ),
      ],
    );
  }

  @override
  String? get restorationId => 'drawerexamplestate';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
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
