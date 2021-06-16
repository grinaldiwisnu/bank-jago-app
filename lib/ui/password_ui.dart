import 'package:flutter/material.dart';
import 'package:gin_finans/utils/extensions.dart';
import 'package:gin_finans/widget/base_button.dart';

class PasswordUI extends StatefulWidget {
  final int slideIndex;
  final Function(bool isPossibleNext) next;

  PasswordUI({Key key, this.slideIndex, this.next}) : super(key: key);

  @override
  _PasswordUIState createState() => _PasswordUIState();
}

class _PasswordUIState extends State<PasswordUI> {
  final formKey = GlobalKey<FormState>();
  bool password = true;
  List<String> passwordStatus = ["", "Very Weak", "Weak", "Strong"];
  int passwordUnique = 0;
  List<Color> passwordColors = [
    Colors.transparent,
    Colors.red,
    Colors.orangeAccent,
    Colors.green
  ];

  bool isLowerCase = false,
      isUpperCase = false,
      isNumber = false,
      isCharacter = false;

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
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "Create Password",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Password will be used to login to account",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 35),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        if (val.complexity() != 3) {
                          return "Your password doesn't meet requirement";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          passwordUnique = value.complexity();
                          isNumber = value.isNumber();
                          isCharacter = value.isCharacter();
                          isUpperCase = value.isUpperCase();
                          isLowerCase = value.isLowerCase();
                        });
                      },
                      obscureText: password,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: password
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              password = !password;
                            });
                          },
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Color(0x7F231F20)),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 2),
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
                        fillColor: Color(0xFFF6F8FB),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Complexity: ",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          passwordStatus[passwordUnique],
                          style: TextStyle(
                              color: passwordColors[passwordUnique],
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            isLowerCase
                                ? Container(
                                    height: 32,
                                    width: 32,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        shape: BoxShape.circle),
                                  )
                                : Text(
                                    "a",
                                    style: TextStyle(
                                        fontSize: 32, color: Colors.white),
                                  ),
                            Text(
                              "Lowercase",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            isUpperCase
                                ? Container(
                                    height: 32,
                                    width: 32,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        shape: BoxShape.circle),
                                  )
                                : Text(
                                    "A",
                                    style: TextStyle(
                                        fontSize: 32, color: Colors.white),
                                  ),
                            Text(
                              "Uppercase",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            isNumber
                                ? Container(
                                    height: 32,
                                    width: 32,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        shape: BoxShape.circle),
                                  )
                                : Text(
                                    "123",
                                    style: TextStyle(
                                        fontSize: 32, color: Colors.white),
                                  ),
                            Text(
                              "Number",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            isCharacter
                                ? Container(
                                    height: 32,
                                    width: 32,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        shape: BoxShape.circle),
                                  )
                                : Text(
                                    "9+",
                                    style: TextStyle(
                                        fontSize: 32, color: Colors.white),
                                  ),
                            Text(
                              "Character",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BaseButton(
              onTap: () {
                if (isUpperCase && isLowerCase && isCharacter && isNumber) {
                  widget.next(true);
                }
              },
            ),
          )),
    );
  }
}
