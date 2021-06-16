import 'package:flutter/material.dart';
import 'package:gin_finans/ui/finish_u_i.dart';
import 'package:gin_finans/ui/password_ui.dart';
import 'package:gin_finans/ui/personal_ui.dart';
import 'package:gin_finans/ui/schedule_ui.dart';
import 'package:gin_finans/widget/page_indicator.dart';

class WizardRegisterUI extends StatefulWidget {
  WizardRegisterUI({Key key}) : super(key: key);

  @override
  _WizardRegisterUIState createState() => _WizardRegisterUIState();
}

class _WizardRegisterUIState extends State<WizardRegisterUI> {
  PageController pageController;
  int slideIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  void navigatePage(int page, bool value) {
    if (value) {
      setState(() {
        slideIndex = page;
      });
      pageController.animateToPage(page,
          duration: Duration(milliseconds: 250), curve: Curves.linear);
    }
  }

  Future<bool> _willPopCallback() async {
    if (pageController.page.round() == pageController.initialPage)
      return true;
    else {
      pageController.previousPage(
        duration: Duration(milliseconds: 250),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Theme.of(context).platform == TargetPlatform.android
                ? Icon(Icons.arrow_back_rounded)
                : Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              if (pageController.page.round() == pageController.initialPage)
                Navigator.of(context).pop();
              else {
                pageController.previousPage(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.linear,
                );
              }
            },
            padding: EdgeInsets.zero,
          ),
          centerTitle: false,
          title: Text("Create Account"),
          bottomOpacity: 0,
          backgroundColor: Color(0xff3C80E3),
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Color(0xff3C80E3),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Color(0xff3C80E3),
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PageIndicator(
                      number: 1,
                      current: slideIndex + 1,
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width / 7,
                      color: Colors.black,
                    ),
                    PageIndicator(
                      number: 2,
                      current: slideIndex + 1,
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width / 7,
                      color: Colors.black,
                    ),
                    PageIndicator(
                      number: 3,
                      current: slideIndex + 1,
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width / 7,
                      color: Colors.black,
                    ),
                    PageIndicator(
                      number: 4,
                      current: slideIndex + 1,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  pageSnapping: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    PasswordUI(
                      slideIndex: slideIndex,
                      next: (val) {
                        navigatePage(1, val);
                      },
                    ),
                    PersonalUI(
                      slideIndex: slideIndex,
                      next: (val) {
                        navigatePage(2, val);
                      },
                    ),
                    ScheduleUI(
                      slideIndex: slideIndex,
                      next: (val) {
                        navigatePage(3, val);
                      },
                    ),
                    FinishUI()
                  ],
                  allowImplicitScrolling: true,
                  onPageChanged: (value) {
                    setState(() {
                      slideIndex = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
