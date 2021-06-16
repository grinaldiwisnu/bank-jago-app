import 'package:flutter/material.dart';
import 'package:gin_finans/widget/ExpandedBox.dart';
import 'package:gin_finans/widget/custom_scrollbar.dart';

class DropdownCustom extends StatefulWidget {
  final List<String> list;
  final String title;
  bool isStrechedDropDown = false;
  Function(int) onChange;
  int groupValue;
  String label = '- Choose Option -';

  DropdownCustom(
      {Key key,
      this.list,
      this.title,
      this.onChange,
      this.groupValue,
      this.label})
      : super(key: key);

  @override
  _DropdownCustomState createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Column(
        children: [
          Container(
              // height: 45,
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
                            style: TextStyle(fontSize: 10, color: Colors.grey),
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
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isStrechedDropDown =
                              !widget.isStrechedDropDown;
                        });
                      },
                      child: Icon(
                        widget.isStrechedDropDown
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        size: 16,
                      ))
                ],
              )),
          ExpandedBox(
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
        ],
      ),
    );
  }
}
