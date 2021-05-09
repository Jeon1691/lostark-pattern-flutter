import 'package:flutter/material.dart';
import 'package:lostark_pattern/page/base.dart';

class ErrorPage extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Error!")),
      ),
    );
  }
}
