import 'package:flutter/material.dart';

class CrazyTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tabs = <String>["Alle", "Familie", "Arbeit", "Freunde", "Amigos", "Banditos"];
    var randomList = List<String>.generate(1234, (index) => index.toString());
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Ultimate Messenger App"),
            bottom: TabBar(
              isScrollable: true,
              tabs: [for (final t in tabs) Tab(text: t,)],
            ),
          ),
          body: TabBarView(
            children: [
              for (final t in tabs)
                ListView.builder(itemBuilder: (context, i) {
                  return ListTile(
                    title: Text("$t - ${randomList[i]}"),
                  );
                })
            ],
          ),
        ));
  }
}
