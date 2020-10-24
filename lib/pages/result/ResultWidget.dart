import 'package:flutter/material.dart';
import 'package:taekwondopensum/ResultButtonWidget.dart';
import 'package:taekwondopensum/pages/IngameWidget.dart';
import 'package:taekwondopensum/pages/result/NoWordsResultWidget.dart';
import 'package:taekwondopensum/pages/result/WordsResultWidget.dart';

class ResultWidget extends StatefulWidget {
  final remainWords;

  ResultWidget({Key key, this.remainWords}) : super(key: key);

  @override
  _ResultWidgetState createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.remainWords);
    return widget.remainWords.length != 0 ? WordsResultWidget(
      remainWords: widget.remainWords,) : NoWordsResultWidget();
  }
}