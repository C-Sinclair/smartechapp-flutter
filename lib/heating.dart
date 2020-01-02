import 'package:flutter/material.dart';
import './carousel.dart';
import './room.dart';

class Heating extends StatefulWidget {
  @override
  _HeatingState createState() => _HeatingState();
}

var rooms = <Room>[
  Room('LIVING ROOM', 21),
  Room('KITCHEN', 18),
  Room('BEDROOM', 28)
];

class _HeatingState extends State<Heating> {
  final int outsideTemp = 14;
  final int humidity = 11;
  Room room = rooms[1];

  TextStyle get textStyle => TextStyle(
      fontSize: 20, color: Colors.white, decoration: TextDecoration.none);

  Widget get roomTemp => Positioned(
      top: 0,
      left: 0,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('OUTSIDE', style: textStyle),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(outsideTemp.toString() + '°', style: textStyle))
            ]),
      ));

  Widget get humid => Positioned(
      top: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('HUMIDITY', style: textStyle),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(humidity.toString() + '%', style: textStyle))
            ]),
      ));

  void selectRoom(Room room) {
    setState(() {
      this.room = room;
    });
  }

  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 200,
      child: Stack(
        children: <Widget>[roomTemp, humid, Carousel(room, selectRoom)],
      ));
}
