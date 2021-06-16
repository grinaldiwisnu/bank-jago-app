import 'package:flutter/material.dart';
import 'package:gin_finans/widget/app_alert_dialog.dart';
import 'package:gin_finans/widget/base_button.dart';
import 'package:gin_finans/widget/dropdown_custom.dart';

class ScheduleUI extends StatefulWidget {
  final int slideIndex;
  final Function(bool isPossibleNext) next;

  ScheduleUI({Key key, this.slideIndex, this.next}) : super(key: key);

  @override
  _ScheduleUIState createState() => _ScheduleUIState();
}

class _ScheduleUIState extends State<ScheduleUI> {
  final formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now().add(Duration(hours: 1));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                    margin: EdgeInsets.only(bottom: 15),
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
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.date_range_outlined,
                        color: Color(0xff3C80E3),
                      ),
                    ),
                  ),
                  Text(
                    "Schedule Video Call",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Choose the date and time that you preferred, we\nwill send a link via email to make a viddeo call on\nthe scheduled date and time.",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 45,
                      ),
                      child: DropdownCustom(
                        title: "Date",
                        onSelectDate: (str) {
                          setState(() {
                            selectedDate = str;
                          });
                        },
                        isDatePicker: true,
                        groupValue: selectedDate,
                        label: "- Choose Date -",
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                      ),
                      child: DropdownCustom(
                        title: "Time",
                        onSelectTime: (str) {
                          setState(() {
                            selectedDate = str;
                          });
                        },
                        groupValue: selectedDate,
                        label: "- Choose Time -",
                        isTime: true,
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
                print(this.selectedDate);
                if (selectedDate != null) {
                  widget.next(true);
                } else {
                  AppAlertDialog(
                      title: "Warning",
                      description:
                          "Please select the date and time to continue registering.",
                      positiveButtonText: 'Okay',
                      positiveButtonOnTap: () =>
                          Navigator.pop(context)).show(context);
                }
              },
            ),
          )),
    );
  }
}
