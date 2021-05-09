import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lostark_pattern/page/base.dart';
import 'package:lostark_pattern/page/login.dart';

class HomePage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoginPage(),
      ),
    );
  }
}