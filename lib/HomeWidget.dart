import 'package:flutter/material.dart';
import 'package:taekwondopensum/pages/IngameWidget.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Taekwondo'),
      ),
      body: Belt(),
    );
  }
}

class Belt extends StatelessWidget {

  var words = {'hej': 'hello', 'nej': 'no', 'hvordan': 'how', 'jeg':'I'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: () {Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                IngameWidget(words: words, round: 0,)
        ));},
        child: Container(
          margin: EdgeInsets.all(10),
          height: 40,
          color: Colors.red,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('3.Kup', style: TextStyle(color: Colors.white),),
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
