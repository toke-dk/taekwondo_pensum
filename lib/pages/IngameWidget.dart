import 'package:flutter/material.dart';
import 'package:taekwondopensum/HomeWidget.dart';

class IngameOverviewer extends StatefulWidget {
  @override
  _IngameOverviewerState createState() => _IngameOverviewerState();
}

class _IngameOverviewerState extends State<IngameOverviewer> {
  @override
  Widget build(BuildContext context) {
      return IngameWidget();
  }
}


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
                    onPressed: () => {Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>
                          HomeWidget()
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


