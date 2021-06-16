import 'package:flutter/material.dart';
import 'package:gin_finans/ui/main_ui.dart';
import 'package:gin_finans/widget/base_button.dart';

class FinishUI extends StatefulWidget {
  const FinishUI({Key key}) : super(key: key);

  @override
  _FinishUIState createState() => _FinishUIState();
}

class _FinishUIState extends State<FinishUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff3C80E3),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                ),
                Text(
                  "All Set Up",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Thank you for registering to GIN Finans!",
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      Icons.check,
                      color: Colors.lightGreen,
                      size: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BaseButton(
            title: "Done",
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MainUI()),
                  (route) => false);
            },
          ),
        ));
  }
}
