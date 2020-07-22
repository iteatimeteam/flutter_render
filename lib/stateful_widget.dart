import 'package:flutter/widgets.dart';
import 'package:flutter_jsc/flutter_jsc.dart';
import 'package:flutter_render/logic.dart';

class StatefulContainer extends StatefulWidget {
  StatefulContainer({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<JSObject>(
      stream: jsStream,
      builder: (BuildContext context, AsyncSnapshot<JSObject> snapshot) {
        return widget.child;
      },
    );
  }
}
