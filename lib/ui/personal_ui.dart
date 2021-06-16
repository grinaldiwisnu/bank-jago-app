import 'package:flutter/material.dart';
import 'package:gin_finans/widget/base_button.dart';
import 'package:gin_finans/widget/dropdown_custom.dart';

class PersonalUI extends StatefulWidget {
  final int slideIndex;
  final Function(bool isPossibleNext) next;

  PersonalUI({Key key, this.slideIndex, this.next}) : super(key: key);

  @override
  _PersonalUIState createState() => _PersonalUIState();
}

class _PersonalUIState extends State<PersonalUI> {
  final formKey = GlobalKey<FormState>();
  List<String> listGoals = [
    "Saving 1-10M",
    "Saving 11-20M",
    "Saving 21-30M",
    "Saving Above 50M"
  ];
  List<String> listIncome = ["1-5M", "6-15M", "16-25M", "Above 25M"];
  List<String> listExpense = ["1-5M", "6-15M", "16-25M", "Above 25M"];

  int selectedGoals, selectedIncome, selectedExpense;

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
                      padding: const EdgeInsets.only(
                        top: 45,
                      ),
                      child: DropdownCustom(
                        title: "Goal for activation",
                        list: listGoals,
                        onChange: (val) {
                          selectedGoals = val;
                        },
                        groupValue: selectedGoals,
                        label: "- Choose Option -",
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                      ),
                      child: DropdownCustom(
                        title: "Monthly income",
                        list: listIncome,
                        onChange: (val) {
                          selectedIncome = val;
                        },
                        groupValue: selectedIncome,
                        label: "- Choose Option -",
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                      ),
                      child: DropdownCustom(
                        title: "Monthly expense",
                        list: listExpense,
                        onChange: (val) {
                          selectedExpense = val;
                        },
                        groupValue: selectedExpense,
                        label: "- Choose Option -",
                      )),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BaseButton(
              onTap: () {
                if ((selectedIncome != null &&
                        selectedGoals != null &&
                        selectedExpense != null) &&
                    (selectedIncome > 0 &&
                        selectedGoals > 0 &&
                        selectedExpense > 0)) {
                  widget.next(true);
                } else {
                  widget.next(false);
                }
              },
            ),
          )),
    );
  }
}
