import 'dart:async';

class ExpressStream extends Stream {
  ExpressStream(this.expression);

  final String expression;

  @override
  StreamSubscription listen(void Function(dynamic event) onData,
      {Function onError, void Function() onDone, bool cancelOnError}) {}
}
