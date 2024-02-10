import 'package:flutter/material.dart';

class ExitDialog extends StatefulWidget {
  @override
  _ExitDialogState createState() => _ExitDialogState();
}

class _ExitDialogState extends State<ExitDialog> {
  bool leave = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.close),
      // show exit dialog
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit?'),
            content: Text('Are you sure you want to exit?'),
            actions: <Widget>[
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  leave = false;
                },
                child: Text('No'),
              ),
              FilledButton(
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
    );
  }
}
