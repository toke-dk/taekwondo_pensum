import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {print('it works');},
      child: Container(
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
