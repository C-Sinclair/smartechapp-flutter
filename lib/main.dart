import 'package:flutter/material.dart';
import './section.dart';
import './heating.dart';

void main() => runApp(App());

const headerHeight = 100.0;
const iconsHeight = 100.0;

class App extends StatelessWidget {
  TextTheme get textTheme => TextTheme(
      title: TextStyle(color: Colors.white),
      subhead: TextStyle(color: Colors.white),
      subtitle: TextStyle(color: Colors.white),
      display1: TextStyle(color: Colors.white),
      display2: TextStyle(color: Colors.white),
      display3: TextStyle(color: Colors.white),
      display4: TextStyle(color: Colors.white),
      headline: TextStyle(color: Colors.white),
      caption: TextStyle(color: Colors.white),
      body1: TextStyle(color: Colors.white),
      body2: TextStyle(color: Colors.white),
      button: TextStyle(color: Colors.white),
      overline: TextStyle(color: Colors.white));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple, textTheme: textTheme),
        home: Screen());
  }
}

class Screen extends StatefulWidget {
  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Screen> {
  String selected = 'bulb';

  SectionIcon sectionIcon(String section) =>
      SectionIcon(section, (selected == section), () {
        setState(() => this.selected = section);
      });

  Widget get icons => Container(
      height: iconsHeight,
      width: MediaQuery.of(context).size.width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            sectionIcon('bulb'),
            sectionIcon('centralheating'),
            sectionIcon('connections'),
            sectionIcon('fire'),
            sectionIcon('worldgrid')
          ]));

  Widget get header => Container(
      padding: EdgeInsets.all(30.0),
      height: headerHeight,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
          Widget>[
        Container(
            width: 30,
            height: 30,
            child: Image(image: AssetImage('assets/images/menu-white.png'))),
        Text('UTILITIES',
            style: TextStyle(
                color: Colors.white, fontSize: 30, decoration: TectD)),
        Container(
            width: 30,
            height: 30,
            child: Image(image: AssetImage('assets/images/cogwheel-white.png')))
      ]));

  Widget build(BuildContext context) {
    var content = <Widget>[header, icons];
    if (this.selected == 'centralheating') {
      content.add(Heating());
    }
    return Column(
      children: content,
    );
  }
}
