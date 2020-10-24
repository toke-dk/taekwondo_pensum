import 'package:flutter/material.dart';
import 'package:taekwondopensum/ResultButtonWidget.dart';
import 'package:taekwondopensum/pages/IngameWidget.dart';

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
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(child: ListView.builder(itemBuilder: _itemBuilder, itemCount: widget.remainWords.keys.length, shrinkWrap: true,)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ResultButtonWidget(
                      color: Colors.red,
                      text: 'Færdig',
                      icon: Icons.done_all,
                      myOnTap: () => {
                        Navigator.popUntil(context, (route) => route.isFirst)
                      },
                    ),
                    ResultButtonWidget(
                      color: Colors.green,
                      text: 'Videre',
                      icon: Icons.arrow_forward,
                      myOnTap: () => {Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) =>
                            IngameWidget(words: widget.remainWords, round: 1,)
                      ))},
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
  Widget _itemBuilder(BuildContext context, int index) {
    return Container(
      child: Text('${index + 1}: ${widget.remainWords.keys.toList()[index]}'),
      );
  }
}
