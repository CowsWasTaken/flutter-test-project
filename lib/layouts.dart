import 'package:flutter/material.dart';

Widget mainWidget() {
  // return Row(
  //   children: [
  //     container(),
  //     container()
  //   ],
  // );
  return gridView();
}

Widget gridView() {
  return GridView.extent(
    maxCrossAxisExtent: 150,
    children: containerList(25),
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    padding: const EdgeInsets.all(5),
  );
}

containerList(int i) {
  return List.generate(i, (index) => Container(
    decoration: BoxDecoration(
      color: const Color(0x85A02525),
      border: Border.all(
          color: Colors.amber,
          width: 5
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Image.network("https://picsum.photos/100"),
  ));
}

Widget container() {
  return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0x85A02525),
          border: Border.all(
            color: Colors.amber,
            width: 5
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(5),
        child: Image.network("https://picsum.photos/150"),
      )
  );

}