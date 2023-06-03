import 'package:flutter/material.dart';

import 'networking.dart';

Widget mainWidget() {
  // return Row(
  //   children: [
  //     container(),
  //     container()
  //   ],
  // );
  return materialCard();
}

Widget materialCard() {
  return SizedBox(
    height: 300,
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: const Text("This is an epic Title"),
            subtitle: buildBitcoinStatus(),
            leading: const Icon(
                Icons.add_card,
                color: Colors.blue
            ),
          ),
        ],
      ),
    ),
  );
}

Widget gridView() {
  return GridView.extent(
    maxCrossAxisExtent: 150,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    padding: const EdgeInsets.all(5),
    children: containerList(25),
  );
}

List<Widget> containerList(int i) {
  return List.generate(
      i,
      (index) => Stack(
            alignment: const Alignment(0, 0.7),
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage("https://picsum.photos/100"),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.black45,
                ),
                child: const Text("Schön",
                style: TextStyle(
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                )),
              )
            ],
          ));
}

Widget container() {
  return Expanded(
      child: Container(
    decoration: BoxDecoration(
      color: const Color(0x85A02525),
      border: Border.all(color: Colors.amber, width: 5),
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.all(5),
    child: Image.network("https://picsum.photos/150"),
  ));
}
