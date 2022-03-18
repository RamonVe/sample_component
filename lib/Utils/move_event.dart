import 'package:flutter/cupertino.dart';

@immutable
class MoveEvent {
  final double xPosition;
  final double yPosition;

  const MoveEvent({
    required this.xPosition,
    required this.yPosition,
  });

  // This factory converts coordinates from the MouseRegion class into usable coordinates for GestureDetector
  factory MoveEvent.fromPointerEvent(PointerEvent event) {
    return MoveEvent(xPosition: event.localPosition.dx, yPosition: event.localPosition.dy);
  }

  // This factory converts coordinates from the GestureDetector allowing the box to be dragged.
  factory MoveEvent.fromDragUpdateDetails(DragUpdateDetails event) {
    return MoveEvent(xPosition: event.localPosition.dx, yPosition: event.localPosition.dy);
  }
}
