import 'package:flutter/material.dart';
import 'package:taekwondopensum/MakeBelt.dart';
import 'package:taekwondopensum/pages/IngameWidget.dart';

class HomeWidget extends StatelessWidget {

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

  final kup1 = {
    'Pyojeok-jireugi': 'Pletslag',
    'Me-jumeok area pyojeok-chigi': 'Pletslag i lav sektion',
    'Mooreup-keokki':'Knække knæ',
    'Pyeonson-keut je-chin-chireugi':'Fingerstik m. håndfladen opad',
    'An-palmok hechyo-makki':'Adskilleblokering med inderside af underarm',
    'Twieo ieo seokeo-chagi':'Flyvende blandet spark',
    'Twieo baggueo-chagi':'Flyvende spark m. bageste ben',
    'Twieo neomeo chagi':'Flyvende spark over forhindring',
    'Modeumson-keut':'Femfingerstik',
    'Keokki':'Knække',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Taekwondo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Belt(
              words: kup3,
              color: Colors.red,
              snipColor: Colors.black,
              text: '3.Kup',
              snip: 1,
            ),
            Belt(
              words: kup2,
              color: Colors.red,
              snipColor: Colors.black,
              text: '2.Kup',
              snip: 2,
            ),
            Belt(
              words: kup1,
              color: Colors.red,
              snipColor: Colors.black,
              text: '1.Kup',
              snip: 3,
            ),
          ],
        ),
      ),
    );
  }
}
