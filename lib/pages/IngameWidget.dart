import 'package:flutter/material.dart';

class IngameWidget extends StatefulWidget {
  int round;
  var words;
  int points;
  IngameWidget({Key key, this.words, this.round, this.points}) : super(key: key);

  @override
  _IngameWidgetState createState() => _IngameWidgetState();
}

class _IngameWidgetState extends State<IngameWidget> {
  var _formkey = GlobalKey<FormState>();
  String guess = '';
  String _correctionText = '';
  @override
  Widget build(BuildContext context) {
    print(widget.words);
    try {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Pensum træner'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                MyPoints(points: widget.points,),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(widget.words.keys.toList()[widget.round],
                    style: TextStyle(fontSize: 25),),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 60, vertical: 100),
                  alignment: Alignment.topCenter,
                  child: TextFormField(
                    onChanged: (value) {
                      guess = value;
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Skriv venligst tekst';
                      }
                      else if (guess != widget.words.values.toList()[widget.round]) {
                        return 'Ikke korrekt';
                      }
                      else {
                        widget.points += 1;
                        return null;
                      }
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2),
                            //borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2),
                            //borderRadius: BorderRadius.circular(12)

                        ),
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: InputBorder.none
                    ),
                    style: TextStyle(fontSize: 15,),
                  ),
                ),
                Text(
                  _correctionText,
                  style: TextStyle(
                    color: Colors.red
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 80),
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text('Næste', style: TextStyle(color: Colors.white),),
                    onPressed: () =>
                    {
                      //if (widget.words.keys.toList().legth())
                      print('${widget.words.keys.toList()[widget.round]} er ${widget.words.values.toList()[widget.round]}'),
                      if (guess!=widget.words.values.toList()[widget.round]) {
                        setState(() => {_correctionText = '"${widget.words.keys.toList()[widget.round]}" er "${widget.words.values.toList()[widget.round]}"',
                }),
                        print('not right')
                      },
                      if (_formkey.currentState.validate()) {
                        widget.round += 1,
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(seconds: 0),
                            pageBuilder: (context, animation1, animation2) =>
                                IngameWidget(words: widget.words, round: widget
                                    .round, points: widget.points,),),)
                      },

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } catch (error) {
      Navigator.pop(context);
    }
  }
}

class MyPoints extends StatefulWidget {

  final int points;
  MyPoints({Key key, this.points}) : super(key: key);

  @override
  _MyPointsState createState() => _MyPointsState();
}

class _MyPointsState extends State<MyPoints> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10),
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/sidekick.jpg',
            scale: 40,
          ),
          Text('=', style: TextStyle(fontSize: 20),),
          Text('${widget.points}')
        ],
      ),
    );
  }
}
