import 'package:flutter/material.dart';
import 'package:lostark_pattern/model/biackiss.dart';
import 'package:lostark_pattern/page/base.dart';
import 'package:lostark_pattern/widget/circle_selector.dart';

mixin Biackiss {
  String get name => "비아키스";
}

abstract class BiackissPatternPage extends BaseStatefulWidget {
  late final String _imagePath;
  late final String _dataPath;
}

abstract class _BiackissPatternPageState
    extends BaseState<BiackissPatternPage> {
  Future<List<BiackissShape>> getData() => getAssetJsonData(widget._dataPath)
      .then((data) => BiackissPattern.fromJson(data))
      .then((data) => data.patterns);
}

class BiackissSelectPatternPage extends BaseStatelessWidget with Biackiss {
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
    getData().then((patterns) {
      _patterns = patterns;
      setState(() {
        _patterns.shuffle();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CircleSelector(
          _patterns.last.data,
          widget._imagePath,
          onClickItem: (BiackissShapeItem item) {
            if (item.answer) {
              setState(() {
                _patterns.removeLast();
              });
            } else {

            }
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
    getData().then((patterns) {
      setState(() {
        _patterns = patterns;
        _patterns.shuffle();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CircleSelector(
          _patterns.isNotEmpty ? _patterns.last.data : [],
          widget._imagePath,
          onClickItem: (BiackissShapeItem item) {
            setState(() {
              _patterns.removeLast();
            });
          },
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
