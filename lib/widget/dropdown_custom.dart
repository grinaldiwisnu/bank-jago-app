import 'package:flutter/material.dart';
import 'package:gin_finans/widget/ExpandedBox.dart';
import 'package:gin_finans/widget/custom_scrollbar.dart';

class DropdownCustom extends StatefulWidget {
  final List<String> list;
  final String title;
  bool isStrechedDropDown = false;
  Function(int) onChange;
  dynamic groupValue;
  String label = '- Choose Option -';
  final bool isDatePicker, isTime;
  Function(DateTime) onSelectDate;
  Function(DateTime) onSelectTime;

  DropdownCustom(
      {Key key,
      this.list,
      this.title,
      this.onChange,
      this.groupValue,
      this.label,
      this.isDatePicker,
      this.onSelectDate,
      this.onSelectTime,
      this.isTime})
      : super(key: key);

  @override
  _DropdownCustomState createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: widget.groupValue,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 7)));
    if (picked != null && picked != widget.groupValue) {
      setState(() {
        widget.groupValue = picked;
        widget.label =
            "${picked.year.toString()}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
        widget.onSelectDate(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(widget.groupValue),
    );

    if (picked != null && picked != widget.groupValue) {
      final time = widget.groupValue.toLocal();
      setState(() {
        widget.groupValue = DateTime(
            time.year, time.month, time.day, picked.hour, picked.minute);
        widget.label = picked.toString();
        widget.onSelectTime(widget.groupValue);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (widget.isDatePicker != null && widget.isDatePicker) {
                setState(() {
                  _selectDate(context);
                });
              } else if (widget.isTime != null && widget.isTime) {
                setState(() {
                  _selectTime(context);
                });
              } else {
                setState(() {
                  widget.isStrechedDropDown = !widget.isStrechedDropDown;
                });
              }
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                constraints: BoxConstraints(
                  minHeight: 45,
                  minWidth: double.infinity,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.label,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(
                      widget.isStrechedDropDown
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 16,
                    )
                  ],
                )),
          ),
          widget.isDatePicker == null && widget.isTime == null
              ? ExpandedBox(
                  expand: widget.isStrechedDropDown,
                  height: 100,
                  child: CustomScrollbar(
                    builder: (context, scrollController2) => ListView.builder(
                        padding: EdgeInsets.all(0),
                        controller: scrollController2,
                        shrinkWrap: true,
                        itemCount: widget.list.length,
                        itemBuilder: (context, index) {
                          return RadioListTile(
                              title: Text(widget.list.elementAt(index)),
                              value: index,
                              groupValue: widget.groupValue,
                              onChanged: (val) {
                                setState(() {
                                  widget.groupValue = val;
                                  widget.label = widget.list.elementAt(index);
                                  widget.isStrechedDropDown = false;
                                  widget.onChange(index);
                                });
                              });
                        }),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
