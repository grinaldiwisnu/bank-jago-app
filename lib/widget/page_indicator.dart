import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int number;
  final int current;

  const PageIndicator({Key key, this.number, this.current}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: current >= number ? Color(0xff72A55F) : Colors.white,
          border: Border.all(color: Colors.black, width: 1),
          shape: BoxShape.circle),
      child: Text(
        this.number.toString(),
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
