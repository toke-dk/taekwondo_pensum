import 'package:flutter/material.dart';
import 'package:taekwondopensum/MakeBelt.dart';
import 'package:taekwondopensum/pages/IngameWidget.dart';

class HomeWidget extends StatelessWidget {

  final kup4 = {
    'Beom-seogi': 'Tigerstand',
    'Bo-jumeok joonbi-seogi': 'Dækket næve retstand',
    'Mo seogi': 'Spids stand',
    'Batangson geodureo momtong an-makki': 'Håndrods blokering m. støtte i midtersektion (modsatarm/ben)',
    'Eotgeoreo area makki': 'Krydshånds blokering i lav sektion',
    'Gawi-makki': 'Sakse blokering',
    'Doo-jumeok jecheo-jireugi': 'Dobbelt slag m. knyttet næve m. håndfladerne opad',
    'Momtong hechyo-makki': 'Udadgående adskille blokering',
    'Geodeureo deung jumeok eolgul ap-chigi': 'Omvendt knoslag i høj sektion m. støtte',
    'Sonnal area makki': 'Knivhåndsblokering i lav sektion (dobbelt)',
    'Geodeup-chagi': 'To ens spark m. samme ben',
    'Bada-chagi': 'Blokadespark',
    'Twieo chagi': 'Flyvende spark',
    'Nakeo-chagi': 'Front-krogspark',
  };

  final kup3 = {
    'Mo-joochoom-seogi': 'Spids hestestand',
    'Ap-joochoom-seogi': 'Kort hestestand',
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
    'An-chung-joochoom-seogi': 'Indaddrejet hestestand',
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
    'Tong-milgi joonbi-seogi': 'Skubbe klar stand',
    'Gyottari-seogi': 'Hjælpe stand',
    'O-ja-seogi': 'T-stand',
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
              words: kup4,
              color: Colors.blue,
              snipColor: Colors.red,
              text: '4.Kup',
              snip: 1,
            ),
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
