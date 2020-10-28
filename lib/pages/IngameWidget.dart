// TODO make focusNode
// TODO make it over and over
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:taekwondopensum/pages/result/ResultWidget.dart';

class IngameWidget extends StatefulWidget {
  int round;
  var words;

  IngameWidget({Key key, this.words, this.round}) : super(key: key);

  @override
  _IngameWidgetState createState() => _IngameWidgetState();
}

class _IngameWidgetState extends State<IngameWidget> {
  bool _showAnswer = false;
  bool isAnswer = false;
  final nameHolder = TextEditingController();

  clearInput() {
    nameHolder.clear();
  }

  var _wordsKeys;
  int points = 0;
  var cloneWords;
  var _wordsValues;

  @override
  void initState() {
    _wordsKeys = widget.words.keys.toList();
    _wordsValues = widget.words.values.toList();
    _wordsKeys..shuffle();
    cloneWords = Map<String, String>.from(widget.words)..addAll({});
    super.initState();
  }

  String guess = '';
  String _correctionText = '';

  @override
  Widget build(BuildContext context) {
    Widget showAnswerWidget = Container();
    bool leave;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Point: $points'),
        leading: IconButton(
          icon: Icon(Icons.close),
          // show exit dialog
          onPressed: () async {
            print('Showing dialog');
            await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Exit?'),
                content: Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      leave = false;
                    },
                    child: Text('No'),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        leave = true;
                      },
                      child: Text('Yes'))
                ],
              ),
            );
            print(leave);
            if (leave) {
              Navigator.of(context).popUntil((route) => route.isFirst);
            }
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              showAnswerWidget,
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '${widget.round + 1}',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '${_wordsKeys[widget.round]}',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            alignment: Alignment.centerRight,
            child: TextFormField(
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.words,
              controller: nameHolder,
              onChanged: (value) {
                guess = value;
              },
              autofocus: true,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => {
                      setState((){
                        if (! _showAnswer) {
                          if (guess.toLowerCase() ==
                              widget.words[_wordsKeys[widget.round]].toLowerCase()) {
                            isAnswer = true;
                            points += 1;
                            cloneWords.remove(_wordsKeys[widget.round]);
                          } else {
                            isAnswer = false;
                          }
                          setState(() {
                            _showAnswer = !_showAnswer;
                          });
                        }
                        else {
                          if (_wordsKeys.length - widget.round - 1 == 0) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultWidget(
                                      remainWords: cloneWords,
                                    )));
                          } else {
                            clearInput();
                            isAnswer = false;
                            guess = '';
                            widget.round += 1;
                            _showAnswer = !_showAnswer;
                          }
                        }
                      })

                    },
                    icon: Icon(Icons.send),

                  ),
                  hintText: 'Skriv dit bud her',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                    //borderRadius: BorderRadius.circular(12)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: isAnswer ? Colors.green : Colors.blue, width: 2),
                    //borderRadius: BorderRadius.circular(12)
                  ),
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: InputBorder.none),
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
