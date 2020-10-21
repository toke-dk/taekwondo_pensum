import 'package:flutter/material.dart';

class ResultWidget extends StatefulWidget {

  final remainWords;
  ResultWidget ({Key key, this.remainWords}) : super(key:key);

  @override
  _ResultWidgetState createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultat'),
      ),
    );
  }
}
