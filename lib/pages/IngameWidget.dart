// TODO make focusNode
// TODO make it over and over
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:taekwondopensum/ExitDialog.dart';
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
    if (_showAnswer) {
      showAnswerWidget = Container(
              height: 56,
                  color: isAnswer ? Colors.lightGreen : Colors.redAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                     Text(
                       isAnswer ? 'Korrekt!' : 'Tæt på!',
                           style: TextStyle(color: Colors.white, fontSize: 19),
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
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: ExitDialog(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Point'),
                SizedBox(width: 8,),
                CircleAvatar(
                  child: Text('$points', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  radius: 20,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                )
              ],
            ),
            Text('Runde: ${widget.round + 1}/${widget.words.values.length}')
          ],
        )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              showAnswerWidget,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 50,),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: CircleAvatar(
                      radius: 22,
                      child: Text(
                        '${widget.round + 1}',
                        style: TextStyle(fontSize: 27),
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.lightbulb_outline),)
                ],
              ),
              Divider(
                thickness: 2,
                height: 20,
                indent: 20,
                endIndent: 20,),
              Container(
                child: Text(
                  '${_wordsKeys[widget.round]}',
                  style: TextStyle(fontSize: 25, fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
                ),
              ),
             ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return _wordsValues.where((String option) {
                      return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (String selection) {
                    print('You just selected $selection');
                  },
                ),
                SizedBox(height: 50,),
                /*TextFormField(
                  textAlign: TextAlign.center,
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
                                          totalWords: widget.words,
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
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
