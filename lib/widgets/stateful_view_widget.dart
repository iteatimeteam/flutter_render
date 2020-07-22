import 'package:flutter/material.dart';
import 'package:flutter_jsc/flutter_jsc.dart';
import 'package:flutter_render/logic.dart';

import '../colors.dart';

class StatefulViewWidget extends StatelessWidget {
  StatefulViewWidget({Key key, this.props, this.child}) : super(key: key);
  final Widget child;
  final Map<String, String> props;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<JSObject>(
      stream: jsStream,
      initialData: jsData,
      builder: (BuildContext context, AsyncSnapshot<JSObject> snapshot) {
        return Container(
          width: snapshot.data.getProperty('width').toNumber(),
          height: snapshot.data.getProperty('height').toNumber(),
          color: ColorBoard[snapshot.data.getProperty('color').toString()],
        );
      },
    );
  }
}
