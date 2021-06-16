import 'package:flutter/material.dart';
import 'package:gin_finans/ui/password_ui.dart';
import 'package:gin_finans/ui/personal_ui.dart';

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
        body: SafeArea(
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.topCenter,
            children: [
              Container(
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
                    Container(
                      color: Color(0xff3C80E3),
                    ),
                    Container(
                      color: Color(0xff3C80E3),
                    ),
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