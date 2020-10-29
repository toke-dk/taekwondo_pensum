import 'package:flutter/material.dart';

import '../../ResultButtonWidget.dart';
import '../IngameWidget.dart';

class WordsResultWidget extends StatefulWidget {
  final remainWords, totalWords;

  WordsResultWidget({Key key, this.remainWords, this.totalWords}) : super(key: key);

  @override
  _WordsResultWidgetState createState() => _WordsResultWidgetState();
}

class _WordsResultWidgetState extends State<WordsResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Tilykke!', style: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold, fontSize: 25),),
        actions: <Widget>[
          Container(alignment: Alignment.center ,child: Text('${((1.0-widget.remainWords.values.toList().length/widget.totalWords.values.toList().length)*100).roundToDouble()}%', style: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold, fontSize: 18),)),

        ],
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () =>
              {Navigator.popUntil(context, (route) => route.isFirst)},
        ),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              child: ListView.builder(
            itemBuilder: _itemBuilder,
            itemCount: widget.remainWords.keys.length,
            shrinkWrap: true,
          )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ResultButtonWidget(
                  color: Colors.red,
                  text: 'Færdig',
                  icon: Icons.done_all,
                  myOnTap: () =>
                      {Navigator.popUntil(context, (route) => route.isFirst)},
                ),
                ResultButtonWidget(
                  color: Colors.green,
                  text: 'Videre',
                  icon: Icons.arrow_forward,
                  myOnTap: () => {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IngameWidget(
                                  words: widget.remainWords,
                                  round: 0,
                                )))
                  },
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 12),
        child: Text('${index + 1}: ${widget.remainWords.keys.toList()[index]}: ${widget.remainWords.values.toList()[index]}'),
    );
  }
}
