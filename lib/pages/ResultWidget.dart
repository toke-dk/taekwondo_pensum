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
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => {
            Navigator.popUntil(context, (route) => route.isFirst)
          },
        ),
      ),
      body: ListView.builder(itemBuilder: _itemBuilder, itemCount: widget.remainWords.keys.length,),
    );
  }
  Widget _itemBuilder(BuildContext context, int index) {
    return Container(
      child: Text('${index + 1}: ${widget.remainWords.keys.toList()[index]}'),
      );
  }
}

