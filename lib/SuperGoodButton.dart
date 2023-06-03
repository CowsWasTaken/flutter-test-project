import 'package:flutter/material.dart';

class SuperGoodButton extends StatelessWidget {
  int counter;

  SuperGoodButton(this.counter, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$counter')));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text('$counter', style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }
}