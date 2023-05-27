import 'package:flutter/material.dart';

Widget mainWidget() {
  return Row(
    children: [
      container(),
      container()
    ],
  );
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
        child: Image.network("https://picsum.photos/100"),
      )
  );

}