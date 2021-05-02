import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lostark_pattern/page/biackiss.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BiackissPage(),
      ),
    );
  }
}
