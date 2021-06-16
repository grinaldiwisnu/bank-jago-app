import 'package:flutter/material.dart';
import 'package:gin_finans/widget/base_button.dart';
import 'package:gin_finans/widget/page_indicator.dart';

class PersonalUI extends StatefulWidget {
  final int slideIndex;
  final Function(bool isPossibleNext) next;

  PersonalUI({Key key, this.slideIndex, this.next}) : super(key: key);

  @override
  _PersonalUIState createState() => _PersonalUIState();
}

class _PersonalUIState extends State<PersonalUI> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
          backgroundColor: Color(0xff3C80E3),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PageIndicator(
                          number: 1,
                          current: widget.slideIndex + 1,
                        ),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 7,
                          color: Colors.black,
                        ),
                        PageIndicator(
                          number: 2,
                          current: widget.slideIndex + 1,
                        ),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 7,
                          color: Colors.black,
                        ),
                        PageIndicator(
                          number: 3,
                          current: widget.slideIndex + 1,
                        ),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 7,
                          color: Colors.black,
                        ),
                        PageIndicator(
                          number: 4,
                          current: widget.slideIndex + 1,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Personal Information",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Please fill in the information bellow and your goal\nfor digital saving.",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 35),
                      child: Container()),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BaseButton(
              onTap: () {
                if (formKey.currentState.validate()) {
                  widget.next(true);
                }
              },
            ),
          )),
    );
  }
}
