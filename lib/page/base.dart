import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lostark_pattern/model/base.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  BaseStatelessWidget({Key? key}) : super(key: key);

  start(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  Future<Map<String, dynamic>> getAssetJsonData(
          String path, BuildContext context) =>
      DefaultAssetBundle.of(context)
          .loadString(path)
          .then((data) => json.decode(data));
}

abstract class BaseStatefulWidget extends StatefulWidget {
  BaseStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  start(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  close(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }

  Future<Map<String, dynamic>> getAssetJsonData(String path) =>
      DefaultAssetBundle.of(context)
          .loadString(path)
          .then((data) => json.decode(data));
}

mixin Summarable {
  String get name;
}
