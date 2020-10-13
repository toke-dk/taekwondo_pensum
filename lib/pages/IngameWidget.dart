import 'package:flutter/material.dart';

class IngameWidget extends StatefulWidget {
  @override
  _IngameWidgetState createState() => _IngameWidgetState();
}

class _IngameWidgetState extends State<IngameWidget> {
  @override
  Widget build(BuildContext context) {
    print('ingame');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text('Et ord', style: TextStyle(fontSize: 25),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60, vertical: 80),
              alignment: Alignment.topCenter,
              child: TextFormField(
                autofocus: true,
                decoration: InputDecoration(
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
                    onPressed: () => {},
                  ),
                ),

          ],
        ),
      ),
    );
  }
}
