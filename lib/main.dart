import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/listViewExample.dart';
import 'package:flutter_app/view/toast.dart';

void main() {
  //主函数
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buildings = [
      Building(
          BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
      Building(BuildingType.theater, 'The Castro Theater', '429 Castro St'),
      Building(
          BuildingType.theater, 'Alamo Drafthouse Cinema', '2550 Mission St'),
      Building(BuildingType.theater, 'Roxie Theater', '3117 16th St'),
      Building(BuildingType.theater, 'United Artists Stonestown Twin',
          '501 Buckingham Way'),
      Building(BuildingType.theater, 'AMC Metreon 16', '135 4th St #3000'),
      Building(BuildingType.restaurant, 'K\'s Kitchen', '1923 Ocean Ave'),
      Building(BuildingType.restaurant, 'Chaiya Thai Restaurant',
          '72 Claremont Blvd'),
      Building(BuildingType.restaurant, 'La Ciccia', '291 30th St')
    ];
    return MaterialApp(
      title: "wuchao's first flutter app",
      home: Scaffold(
        appBar: AppBar(
          title: Text("demo"),
        ),
        body: Builder(
          builder: (context) =>BuildingListView(buildings,(index)=>showToast(context,buildings[index].name)),
        ),
      ),
    );
  }
}

class RollingButton extends StatefulWidget {
  @override
  State createState() {
    return _RollingState();
  }
}

class _RollingState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('click!'),
      onPressed: _onPressed,
    );
  }

  void _onPressed() {
    final result = _roll();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(content: WordsRandomWidget());
        });
  }

  List<int> _roll() {
    final roll1 = Random().nextInt(100);
    final roll2 = Random().nextInt(100);
    return [roll1, roll2];
  }
}

class WordsRandomWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new WordsRandomState();
}

class WordsRandomState extends State<WordsRandomWidget> {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }
}

class MyImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButtonColumn("CALL", Icons.call, context),
        _buildButtonColumn("ROUTE", Icons.near_me, context),
        _buildButtonColumn("SHARE", Icons.share, context)
      ],
    );
    return MaterialApp(
      title: "imageTest",
      home: Scaffold(
          appBar: AppBar(
            title: Text("imageTest"),
          ),
          body: Column(
            children: <Widget>[
              Image.asset(
                'images/street.JPG',
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              TitleSection(),
              buttonSection
            ],
          )),
    );
  }
}

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "不知道的城市",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Text("立交桥俯拍")
              ],
            ),
          ),
          Icon(Icons.stars, color: Colors.red[500]),
          Text('111')
        ],
      ),
    );
  }
}

Widget _buildButtonColumn(String label, IconData icon, BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon),
      Container(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Theme.of(context).primaryColor),
          ))
    ],
  );
}
