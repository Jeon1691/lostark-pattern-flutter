import 'package:flutter/material.dart';
import 'package:memoize/memoize.dart';
import 'package:lostark_pattern/model/biackiss.dart';

class CircleSelector extends StatelessWidget {
  final List<BiackissShapeItem> _data;
  final String _imagePath;
  final VoidCallback onClickItem;

  final Function _indexes = memo1((List<BiackissShapeItem> data) =>
      data.map((item) => item.index).toList());

  CircleSelector(this._data, this._imagePath, {required this.onClickItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: (context, i) => _indexes(_data).contains(i)
            ? IconButton(
                icon: Image.asset(_imagePath),
                onPressed: onClickItem,
              )
            : Container(),
        itemCount: 25,
      ),
    );
  }
}
