import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  BaseStatelessWidget({Key? key}) : super(key: key);

  start(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
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
}
