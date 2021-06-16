import 'package:flutter/material.dart';
import 'package:gin_finans/ui/main_ui.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GIN Finans",
      home: MainUI(),
    );
  }
}
