import 'package:flutter/material.dart';
import './room.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  final Room room;
  final Function selectRoom;

  Carousel(this.room, this.selectRoom) : super();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      
    )
  }
}
