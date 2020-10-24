import 'package:flutter/material.dart';

class ResultButtonWidget extends StatefulWidget {
  final color, text, icon;
  ResultButtonWidget({Key key, this.color, this.text, this.icon});
  @override
  _ResultButtonWidgetState createState() => _ResultButtonWidgetState();
}

class _ResultButtonWidgetState extends State<ResultButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: 40,
              height: 60,
              decoration: BoxDecoration(
                  color: widget.color,
                  border: Border.all(
                      color: widget.color[900], width: 3
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 16),),
                  SizedBox(width: 5,),
                  Icon(widget.icon, color: Colors.white)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
