import 'dart:convert';
import 'dart:math';

import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:lostark_pattern/model/biackiss.dart';
import 'package:lostark_pattern/page/base.dart';
import 'package:lostark_pattern/widget/circle_selector.dart';

class BiackissPage extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => start(context, BiackissStatuePage()),
              child: Text("석상 연습"),
            ),
            TextButton(
              onPressed: () => start(context, BiackissSwordPage()),
              child: Text("칼 연습"),
            ),
            TextButton(
              onPressed: () => start(context, BiackissKeyboardPage()),
              child: Text("아재 연습"),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class BiackissPatternPage extends BaseStatefulWidget {
  late final String _imagePath;
  late final String _dataPath;
  final _random = Random();
}

abstract class _BiackissPatternPageState extends State<BiackissPatternPage> {
  Future<List<BiackissShape>> getData(context) => DefaultAssetBundle.of(context)
      .loadString(widget._dataPath)
      .then((data) => BiackissPattern.fromJson(json.decode(data)).patterns);
}

class BiackissStatuePage extends BiackissPatternPage {
  @override
  String get _imagePath => "assets/image/biackiss_statue.png";

  @override
  String get _dataPath => "assets/data/biackiss_statue.json";

  @override
  State createState() => _BiackissStatuePageState();
}

class _BiackissStatuePageState extends _BiackissPatternPageState {
  List<BiackissShape> _patterns = [];

  @override
  void initState() {
    super.initState();
    getData(context).then((patterns) {
      setState(() {
        _patterns = patterns;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final index = widget._random.nextInt(max(_patterns.length - 1, 1));
    return Scaffold(
      body: SafeArea(
        child: CircleSelector(
          _patterns.isNotEmpty ? _patterns[index].data : [],
          widget._imagePath,
          onClickItem: () {
            setState(() {
              _patterns.removeAt(index);
            });
          },
        ),
      ),
    );
  }
}

class BiackissSwordPage extends BiackissPatternPage {
  @override
  String get _imagePath => "assets/image/biackiss_sword.png";

  @override
  String get _dataPath => "assets/data/biackiss_sword.json";

  @override
  State createState() => _BiackissSwordPageState();
}

class _BiackissSwordPageState extends _BiackissPatternPageState {
  List<BiackissShape> _patterns = [];

  @override
  void initState() {
    super.initState();
    getData(context).then((patterns) {
      setState(() {
        _patterns = patterns;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final index = widget._random.nextInt(max(_patterns.length - 1, 1));
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            TimeCircularCountdown(
              countdownTotal: 5,
              unit: CountdownUnit.second,
              onFinished: () {
                setState(() {
                  _patterns.removeAt(index);
                });
              },
            ),
            CircleSelector(
              _patterns.isNotEmpty ? _patterns[index].data : [],
              widget._imagePath,
              onClickItem: () {
                setState(() {
                  _patterns.removeAt(index);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BiackissKeyboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BiackissKeyboardPageState();
}

class _BiackissKeyboardPageState extends State {
  List<BiackissShape> _patterns = [];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
