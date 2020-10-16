import 'package:flutter/material.dart';

class IngameWidget extends StatefulWidget {

  var words;
  IngameWidget({Key key, this.words}) : super(key: key);




  @override
  _IngameWidgetState createState() => _IngameWidgetState();
}

class _IngameWidgetState extends State<IngameWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.words);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(widget.words.keys.toList()[0], style: TextStyle(fontSize: 25),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60, vertical: 80),
              alignment: Alignment.topCenter,
              child: TextFormField(
                //autofocus: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(12)
                    ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(12)

                ),
                  fillColor: Colors.grey[300],
                    filled: true,
                  border: InputBorder.none
                ),
                style: TextStyle(fontSize: 15,),
              ),
            ),


                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 80),
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text('Næste', style: TextStyle(color: Colors.white),),
                    onPressed: () =>
                    {Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(seconds: 0),
                        pageBuilder: (context, animation1, animation2) => IngameWidget(words: widget.words,),
                      )
                    )},
                  ),
                ),

          ],
        ),
      ),
    );
  }
}

