import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:test_project/layouts.dart';
import 'package:test_project/randomNameGenerator.dart';

class RandomName extends State<RandomNameGenerator> {
  final _randomNames = <String>[];
  final _hearted = <String>{};

  @override
  Widget build(BuildContext context) {
    final name = randomString(15);
    return Scaffold(
        appBar: AppBar(title: Text("Welcome to my Superhero Picker"),),
        body: _buildBody());
  }

  _buildBody() {
    return ListView.builder(
      padding: EdgeInsets.all(16), itemBuilder: (context, index) {
      if (index.isOdd) {
        return Divider();
      }
      // if(index ~/ 2 >= _randomNames.length) {
      //
      // }

      if (index >= (_randomNames.length * 2)) {
        _randomNames.addAll(createRandomNameList());
      }
      return _buildRow(_randomNames[index ~/ 2]);
    },);
  }

  Widget _buildRow(String randomName) {
    final _markedFav = _hearted.contains(randomName);
    return ListTile(title: Text(randomName),
      trailing: Icon(_markedFav ? Icons.favorite : Icons.favorite_border,
        color: _markedFav ? Colors.red : null,),
      onTap: () {
        setState(() {
          _markedFav ? _hearted.remove(randomName) : _hearted.add(randomName);
        });
      },
      onLongPress: () {
        pushExample(randomName);
      },);
  }

  Iterable<String> createRandomNameList() {
    return [
      randomString(16),
      randomString(16),
      randomString(16),
      randomString(16),
      randomString(16),
      randomString(16),
      randomString(16),
    ];
  }


  void pushExample(String randomName) {
    Navigator
        .of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar (
          title: Text(randomName),
        ),
        body: mainWidget(),
      );
    }));
  }
}
