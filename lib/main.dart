import 'package:taekwondopensum/pages/IngameWidget.dart';

import 'HomeWidget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomeWidget(),
    '/ingame': (context) => IngameOverviewer()
  },
));