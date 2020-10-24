import 'package:flutter/material.dart';
import 'package:taekwondopensum/pages/IngameWidget.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taekwondo'),
      ),
      body: Belt(),
    );
  }
}

class Belt extends StatelessWidget {
  var words = {
    'Bam-jumeok': 'Kastanjenæve',
    'Balnal-deung': 'Inderside af fod',
    'Sonnal-deung': 'Inderside af knivhånd',
    'Teok': 'Hage',
    'Dangyo': 'Trække',
    'Santeul': 'Bjerg',
    'Oe-santeul': 'Halvt bjerg',
    'Pal': '8.',
    'Geodeureo': 'Støtte',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: () async {
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title:
                  Text('Der klommer ${words.keys.toList().length} spørgsmål'),
              content: Text('Vil du starte?'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: Text('Nej')),
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
                    child: Text('Ja')),
              ],
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.all(10),
          height: 40,
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
                  '3.Kup',
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  width: 10,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
