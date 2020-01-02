import 'package:flutter/material.dart';

class SectionIcon extends StatelessWidget {
  final String icon;
  final bool selected;
  final Function onTap;

  SectionIcon(this.icon, this.selected, this.onTap) : super();

  Image getImage() {
    String file = 'assets/images/' +
        this.icon +
        (this.selected ? '-selected' : '-default') +
        '.png';
    return Image(image: AssetImage(file));
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.onTap,
        child: Container(height: 50, width: 50, child: getImage()));
  }
}
