import 'package:flutter/material.dart';
import 'package:taekwondopensum/pages/IngameWidget.dart';

class Kup2Belt extends StatelessWidget {
  final words;
  Kup2Belt({this.words});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title:
              Text('Der kommer ${words.keys.toList().length} spørgsmål'),
              content: Text('Tryk "OK" for at komme igang'),
              actions: <Widget>[
                FlatButton(
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
              color: Colors.red,
              border: Border.all(
                  color: Colors.red[900],
                  width: 2
              )
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '2.Kup',
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 10,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 10,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10,),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}

class Belt extends StatelessWidget {
  final words;
  final String text;
  final color;
  final Color snipColor;
  final int snip;
  Belt({this.words, this.color, this.snipColor, this.snip, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title:
              Text('Der kommer ${words.keys.toList().length} spørgsmål'),
              content: Text('Tryk "OK" for at komme igang'),
              actions: <Widget>[
                FlatButton(
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
                  color: color[900],
                  width: 2
              )
          ),
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
                        Container(
                          width: 10,
                          color: snipColor,
                        ),
                        SizedBox(width: 10,),
                      ],
                    ),
                  ],
                ),
            ),
        ),
      );}
}

