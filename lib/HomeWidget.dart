import 'package:flutter/material.dart';
import 'package:taekwondopensum/pages/IngameWidget.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taekwondo'),
      ),
      body: InkWell(
        onTap: () {Navigator.push(context, MaterialPageRoute(
        builder: (context) =>
            IngameWidget()
      ));},
        child: Belt()),
    );
  }
}

class Belt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        height: 40,
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('3.Kup'),
              Container(
                width: 10,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
