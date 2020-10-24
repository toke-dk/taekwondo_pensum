// TODO make focusNode
// TODO make it over and over
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taekwondopensum/pages/ResultWidget.dart';

class IngameWidget extends StatefulWidget {
  int round;
  var words;

  IngameWidget({Key key, this.words, this.round}) : super(key: key);

  @override
  _IngameWidgetState createState() => _IngameWidgetState();
}

class _IngameWidgetState extends State<IngameWidget> {
  bool _showAnswer = false;
  bool isAnswer;
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

  var _formkey = GlobalKey<FormState>();
  String guess = '';
  String _correctionText = '';

  @override
  Widget build(BuildContext context) {
    Widget swapButton = Container();
    Widget showAnswerWidget = Container();
    if (_showAnswer) {
      showAnswerWidget = Container(
        height: 60,
        color: isAnswer ? Colors.lightGreen : Colors.redAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  isAnswer ? 'Korrekt!' : 'Tæt på!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                isAnswer
                    ? SizedBox()
                    : Text(
                        '"${_wordsKeys[widget.round]}" er "${widget.words[_wordsKeys[widget.round]]}"',
                        style: TextStyle(color: Colors.white),
                      )
              ],
            ),
          ],
        ),
      );
      swapButton = RaisedButton(
        color: isAnswer ? Colors.lightGreen[800] : Colors.blue,
        child: Text(
          'Næste',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => {
          setState(() {
            if (_wordsKeys.length - widget.round - 1 == 0) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultWidget(
                            remainWords: cloneWords,
                          )));
            } else {
              clearInput();
              guess = '';
              widget.round += 1;
              _showAnswer = !_showAnswer;
            }
          })
        },
      );
    } else {
      swapButton = RaisedButton(
        color: Colors.blue,
        child: Text(
          'Check svar',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
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
        },
      );
    }
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
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              showAnswerWidget,
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '${widget.round + 1}: ${_wordsKeys[widget.round]}',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 60, vertical: 50),
                alignment: Alignment.topCenter,
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: nameHolder,
                  onChanged: (value) {
                    guess = value;
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
                      border: InputBorder.none),
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                _correctionText,
                style: TextStyle(color: Colors.red),
              ),
              Container(
                width: 300,
                margin: EdgeInsets.only(top: 80),
                child: swapButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
