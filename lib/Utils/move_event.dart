import 'package:flutter/cupertino.dart';

@immutable
class MoveEvent {
  final double xPosition;
  final double yPosition;

  const MoveEvent({
    required this.xPosition,
    required this.yPosition,
  });

  factory MoveEvent.fromPointerEvent(PointerEvent event) {
    return MoveEvent(xPosition: event.localPosition.dx, yPosition: event.localPosition.dy);
  }

  factory MoveEvent.fromDragUpdateDetails(DragUpdateDetails event) {
    return MoveEvent(xPosition: event.localPosition.dx, yPosition: event.localPosition.dy);
  }
}
