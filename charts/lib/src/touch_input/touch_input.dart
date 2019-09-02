import 'package:flutter/material.dart';

class TouchInputNotifier extends ValueNotifier<TouchInput> {
  TouchInputNotifier(TouchInput value) : super(value);
}

abstract class TouchInput {
  Offset getOffset();
}

abstract class TouchLongInput extends TouchInput {}

abstract class TouchPanInput extends TouchInput {}

class LongPressStart extends TouchLongInput {
  final Offset localPosition;

  LongPressStart(this.localPosition);

  @override
  Offset getOffset() {
    return localPosition;
  }
}

class LongPressMoveUpdate extends TouchLongInput {
  final Offset localPosition;

  LongPressMoveUpdate(this.localPosition);

  @override
  Offset getOffset() {
    return localPosition;
  }
}

class LongPressEnd extends TouchLongInput {
  final Offset localPosition;

  LongPressEnd(this.localPosition);

  @override
  Offset getOffset() {
    return localPosition;
  }
}

class PanStart extends TouchPanInput {
  final Offset localPosition;

  PanStart(this.localPosition);

  @override
  Offset getOffset() {
    return localPosition;
  }
}

class PanMoveUpdate extends TouchPanInput {
  final Offset localPosition;

  PanMoveUpdate(this.localPosition);

  @override
  Offset getOffset() {
    return localPosition;
  }
}

class PanEnd extends TouchPanInput {
  final Offset localPosition;

  PanEnd(this.localPosition);

  @override
  Offset getOffset() {
    return localPosition;
  }
}

class NonTouch extends TouchInput {
  @override
  Offset getOffset() {
    return null;
  }
}
