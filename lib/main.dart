import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_jsc/flutter_jsc.dart';
import 'package:flutter_render/logic.dart';
import 'package:flutter_render/page.dart';
import 'package:flutter_render/widget_factory.dart';
import 'package:xml/xml.dart';

void main() {
  initContext();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    parseXML();
  }

  Random random = Random();
  void _incrementCounter() {
    List<String> colors = ['red', 'blue', 'black'];
    int index = random.nextInt(3);
    String currentColor = colors[index];
    context.global.getProperty('setValue').callAsFunction(
        arguments: [JSValue.fromDart('color', context: context), JSValue.fromDart(currentColor, context: context)]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: parseXML(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget parseXML() {
    final XmlDocument document = XmlDocument.parse(pageXML);
    Widget documentWidget = generatorXMLNode(document.children.first);
    return documentWidget;
  }

  Widget generatorXMLNode(XmlNode node) {
    if (node.children == null || node.children.isEmpty) {
      return createWidget(node);
    }

    List<Widget> children = generatorChildren(node.children);
    return createWidget(node, children: children);
  }

  List<Widget> generatorChildren(List<XmlNode> children) {
    return children.where((XmlNode element) => element is XmlElement).map((XmlNode child) {
      return generatorXMLNode(child);
    }).toList();
  }
}
