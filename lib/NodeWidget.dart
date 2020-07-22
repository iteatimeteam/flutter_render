import 'package:flutter/widgets.dart';

abstract class NodeWidget extends StatefulWidget {
  final Map<String, String> props;
  final List<Widget> children;
  NodeWidget(this.props, this.children);
}
