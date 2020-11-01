import 'package:flutter/material.dart';
import 'package:taekwondopensum/MakeBelt.dart';
import 'package:taekwondopensum/pages/IngameWidget.dart';

class HomeWidget extends StatelessWidget {

  final kup2 = {
/*
    'An-chung-joochoom-seogi': 'Indaddrejet hestestand',
    'Sonnal-deung bakat-makki': 'Udadgående blokering med omvendt knivhånd',
    'Agwison kaljebi': 'Slag mod hals med agwison',
    'Han-sonnal area makki': 'Enkelt knivhåndsblokering i lav sektion',
    'Sonnal area makki': 'Knivhåndsblokering i lav sektion',
    'Palkoop olryeo-chigi': 'Opadgående albuestød',
    'Palkoop nareyo-chigi': 'Nedadgående albuestød',
    'Twieo ieo-chagi': 'Samme spark 2 gange flyvende',
    'Dwit nakeo-chagi': 'Bagudrettet krogspark',
*/

    'Jibge-jumeok': 'Pinsetnæve',
    'Gawison-keut': 'Sakse fingerstik',
    'Hanson-keut': 'Enkelt fingerstik',
    'Moeun-dooson-keut': 'Dobbelt fingerstik',
    'Moeun-seson-keut': 'Tre fingerstik',
    'Agwison': 'Runding mellem tommel og pegefinger',
    'Kaljebi': 'Slag mod hals m. agwison',
    'Ko': 'Niende',
    'Ship': 'Tiende'
  };

  final kup3 = {
      'Bam-jumeok': 'Kastanjenæve',
      'Balnal-deung': 'Inderside af fod',
      'Sonnal-deung': 'Inderside af knivhånd',
      'Teok': 'Hage',
      'Dangyo': 'Trække',
      'Santeul': 'Bjerg',
      'Oe-santeul': 'Halvt bjerg',
      'Pal': 'Ottende',
      'Geodeureo': 'Støtte',
    };


@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Taekwondo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Belt(words: kup3, color: Colors.red, snipColor: Colors.black, text: '3.Kup',),
            Kup2Belt(words: kup2,)
          ],
        ),
      ),
    );
  }
}


