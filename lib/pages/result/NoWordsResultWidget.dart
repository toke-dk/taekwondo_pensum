import 'package:flutter/material.dart';

class NoWordsResultWidget extends StatefulWidget {
  @override
  _NoWordsResultWidgetState createState() => _NoWordsResultWidgetState();
}

class _NoWordsResultWidgetState extends State<NoWordsResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultat'),
        leading: IconButton(
          icon: Icon(Icons.done_outline),
          onPressed: () => {
            Navigator.popUntil(context, (route) => route.isFirst)
          }
        ),
      ),
      body: Container(
        child: Text('Du blev færdig'),
      ),
    );
  }
}
