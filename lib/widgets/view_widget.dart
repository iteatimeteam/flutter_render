import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../colors.dart';

class ViewWidget extends StatelessWidget {
  ViewWidget({Key key, this.props, this.child}) : super(key: key);
  final Widget child;
  final Map<String, String> props;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.tryParse(props['width']) ?? 0.0,
      height: double.tryParse(props['width']) ?? 0.0,
      color: ColorBoard[props['background-color']],
      child: child,
    );
  }
}
