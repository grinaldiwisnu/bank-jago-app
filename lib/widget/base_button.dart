import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final Function onTap;
  final String title;

  const BaseButton({Key key, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        height: 86,
        color: Color(0xff3C80E3),
        width: double.infinity,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff5A9EEA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              title ?? "Next",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}
