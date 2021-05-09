import 'package:flutter/material.dart';
import 'package:lostark_pattern/page/base.dart';

class SplashPage extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("INTRO"),
        ),
      ),
    );
  }
}
