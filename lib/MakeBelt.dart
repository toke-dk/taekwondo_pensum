import 'package:flutter/material.dart';
import 'package:taekwondopensum/pages/IngameWidget.dart';

class Belt extends StatelessWidget {
  final words;
  final String text;
  final color;
  final Color? snipColor;
  final int? snip;
  Belt(
      {required this.words,
      required this.color,
      this.snipColor,
      this.snip,
      required this.text});

  @override
  Widget build(BuildContext context) {
    Widget snipWidget = Row(
      children: [
        Container(
          width: 10,
          color: snipColor,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );

    return InkWell(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Der kommer ${words.keys.toList().length} spørgsmål'),
            content: Text('Tryk "OK" for at komme igang'),
            actions: <Widget>[
              FilledButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IngameWidget(
                                      words: words,
                                      round: 0,
                                    )))
                      },
                  child: Text('OK')),
            ],
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: 50,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(
                color: color == Colors.black ? color : color[900], width: 2)),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
              Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Builder(builder: (context) {
                        if (snip == 1) {
                          return snipWidget;
                        } else if (snip == 2) {
                          return Row(
                            children: [
                              snipWidget,
                              snipWidget,
                            ],
                          );
                        } else if (snip == 3) {
                          return Row(
                            children: [snipWidget, snipWidget, snipWidget],
                          );
                        }
                        return Container();
                      }),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
