import 'package:flutter/material.dart';
import 'package:gin_finans/ui/wizard_register_ui.dart';
import 'package:gin_finans/utils/extensions.dart';

class MainUI extends StatefulWidget {
  MainUI({Key key}) : super(key: key);

  @override
  _MainUIState createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: this.formKey,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          backgroundColor: Color(0xff1F7AE6),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  76,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 1),
                              shape: BoxShape.circle),
                          child: Text(
                            "1",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 7,
                          color: Colors.black,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 1),
                              shape: BoxShape.circle),
                          child: Text(
                            "2",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 7,
                          color: Colors.black,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 1),
                              shape: BoxShape.circle),
                          child: Text(
                            "3",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width / 7,
                          color: Colors.black,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 1),
                              shape: BoxShape.circle),
                          child: Text(
                            "4",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 50.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/bg.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome to",
                            style: TextStyle(
                                fontSize: 32.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                "GIN ",
                                style: TextStyle(
                                    fontSize: 32.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Finans",
                                style: TextStyle(
                                    fontSize: 32.0,
                                    color: Color(0xff1F7AE6),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "Welcome to The Bank of The Future.\nManage and track your accounts on \nthe go.",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6.0)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 8.0),
                              child: TextFormField(
                                validator: (value) {
                                  return value.isEmail().message;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined),
                                  contentPadding: EdgeInsets.zero,
                                  hintText: "Email",
                                  hintStyle:
                                      TextStyle(color: Color(0x7F231F20)),
                                  border: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 0),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.0),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 0),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.0),
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 0),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.0),
                                    ),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.redAccent, width: 2),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6.0),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xffF4F4F4),
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: 76,
                color: Color(0xffF8F8F8),
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WizardRegisterUI()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff74A0E1),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
