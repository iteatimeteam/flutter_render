import 'package:flutter/widgets.dart';
import 'package:flutter_render/widgets/stateful_view_widget.dart';
import 'package:flutter_render/widgets/view_widget.dart';
import 'package:xml/xml.dart';

Widget createWidget(XmlNode node, {List<Widget> children}) {
  final XmlElement element = node;
  final List<XmlAttribute> attributes = node.attributes;
  Map<String, String> props = {};
  bool hasExpress = false;
  attributes.forEach((XmlAttribute attribute) {
    if (attribute.value.contains('_getValue')) {
      hasExpress = true;
    }
    props['${attribute.name}'] = attribute.value;
  });
  Widget content;
  switch (element.name.local) {
    case 'view':
      {
        if (hasExpress) {
          return StatefulViewWidget(
            props: props,
            child: Flex(
              direction: Axis.vertical,
              children: children,
            ),
          );
        } else {
          return ViewWidget(
            props: props,
            child: Flex(
              direction: Axis.vertical,
              children: children,
            ),
          );
        }
      }
  }
}
