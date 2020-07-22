import 'dart:async';

import 'package:flutter_jsc/flutter_jsc.dart';

const jsLogic = '''
var data = {
    color: 'red',
    width: 50,
    height: 50
}

function setValue(prop, value) {
   data[prop] = value
   notify(data) 
}

function getValue(prop) {
    return data[prop]
}
''';

final JSContext context = JSContext();
JSObject _data;
void initContext() {
  context.evaluateScript(jsLogic);
  context.global.setFunction('notify', function: (JSValue thisObj, List<JSValue> args) {
    return null;
  });

  _data = generatorData();
}

JSObject generatorData() {
  JSObject data = context.global.getProperty('data');
  return data;
}

JSObject get jsData => _data;

StreamController<JSObject> _streamController = StreamController.broadcast();

StreamController get jsDataStreamController => _streamController;

Stream get jsStream => _streamController.stream;
