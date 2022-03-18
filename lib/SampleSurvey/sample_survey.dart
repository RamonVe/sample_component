import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import '../Utils/move_event.dart';

class SampleSurvey extends StatefulWidget {
  const SampleSurvey({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of the application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  State<SampleSurvey> createState() => _SampleSurveyState();
}

class _SampleSurveyState extends State<SampleSurvey> {
  // The coordinates of the region for the graph-like input widget are set to zero.
  double xGrid = 0.0;
  double yGrid = 0.0;

  // The converted coordinates to decimal are set to zero.
  double xDecimal = 0.0;
  double yDecimal = 0.0;

  // The converted decimal to percentages are set to zero.
  double xPercent = 0;
  double yPercent = 0;

  // The size of the box used in the graph-like input widget are finalized.
  final double sizeX = 25;
  final double sizeY = 25;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the SampleSurvey object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(10.00),
          ),
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Flexible(
                  child: Text(
                    "A Sample Title: Thing A Vs. Thing B",
                    textScaleFactor: 1.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.00),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: const [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Thing A',
                      textDirection: TextDirection.rtl,
                      textScaleFactor: 1.50,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: 25,
                    height: 200,
                    // Y axis bar
                    child: FAProgressBar(
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.up,
                      currentValue: currentY(yDecimal),
                      backgroundColor: Colors.blueGrey,
                      progressColor: Colors.blue,
                      displayText: '%',
                      animatedDuration: Duration.zero,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(17.00),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2.5),
              ),
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(10.00),
                  ),
                  Column(
                    children: [
                      Container(
                        constraints: BoxConstraints.tight(
                          const Size(300, 200),
                        ),
                        child: GestureDetector(
                          onDoubleTap: submit,
                          onPanUpdate: (details) => _updateGestureLocation(MoveEvent.fromDragUpdateDetails(details)),
                          child: MouseRegion(
                            onExit: (event) => onExit(MoveEvent.fromPointerEvent(event)),
                            cursor: SystemMouseCursors.precise,
                            onHover: (event) => _updateGestureLocation(MoveEvent.fromPointerEvent(event)),
                            child: Stack(
                              children: [
                                Container(
                                  color: Colors.blueGrey,
                                ),
                                Positioned(
                                  bottom: yGrid - (sizeY / 2),
                                  left: xGrid - (sizeX / 2),
                                  child: Center(
                                    child: SizedBox(
                                      height: sizeY,
                                      width: sizeX,
                                      child: Container(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(2.5),
                      ),
                      SizedBox(
                        width: 300,
                        height: 25,
                        // X axis bar
                        child: FAProgressBar(
                          direction: Axis.horizontal,
                          currentValue: currentX(xDecimal),
                          backgroundColor: Colors.blueGrey,
                          progressColor: Colors.blue,
                          displayText: '%',
                          animatedDuration: Duration.zero,
                          maxValue: 100,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 60.0),
                        child: Text(
                          "Thing B",
                          textScaleFactor: 1.50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                child: results(),
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          submit();
                        },
                      );
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          xGrid = 0.0;
                          yGrid = 0.0;
                          xDecimal = 0.0;
                          yDecimal = 0.0;
                        },
                      );
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // This function uses the MoveEvent class to update the coordinates of where the box is being dragged.
  void _updateGestureLocation(MoveEvent details) {
    setState(
      () {
        xGrid = details.xPosition;
        if (kDebugMode) {
          print(
            'xGrid = ' + xGrid.toString(),
          );
        }

        xDecimal = calculator(xGrid, 300);
        if (kDebugMode) {
          print(
            'xDecimal % = ' + xDecimal.toString(),
          );
          print('\n');
        }

        yGrid = yTransform(details.yPosition);
        if (kDebugMode) {
          print(
            'yGrid = ' + yGrid.toString(),
          );
        }

        yDecimal = calculator(yGrid, 200);
        if (kDebugMode) {
          print(
            'yDecimal % = ' + yDecimal.toString(),
          );
          print('\n');
        }
      },
    );
  }

  // This function sets the coordinates to zero when the cursor leaves the graph-like widget.
  // Only works properly for Web-App format and not mobile.
  void onExit(MoveEvent event) {
    setState(
      () {
        xGrid = 0.0;
        yGrid = 0.0;
        _updateGestureLocation(event);
      },
    );
  }

  // Since the y axis is originally calculated from the top of the screen to the bottom,
  // the y axis needs to be transformed.
  // First the y axis is set to a negative number,
  // and then the y axis max length is added to it to essentially invert the y axis.
  // That way as the box is dragged up for the y axis, the bar fills up instead of being depleted.
  double yTransform(dy) {
    var transformedY = -dy + 200;
    return transformedY;
  }

  // This function converts coordinates into formatted decimals.
  double calculator(double grid, double maxGrid) {
    var decimal = grid / maxGrid;
    var formattedDecimal = double.parse(
      decimal.toStringAsFixed(2),
    );
    return formattedDecimal;
  }

  // This function prevents the x percentage from exceeding 100,
  // or from ever being negative.
  int currentX(xDecimal) {
    var xInt = (xDecimal * 100).toInt();
    if (xInt > 100) {
      xInt = 100;
    }
    if (xInt < 0) {
      xInt = 0;
    }
    return xInt;
  }

  // This function prevents the y percentage from exceeding 100,
  // or from ever being negative.
  int currentY(yDecimal) {
    var yInt = (yDecimal * 100).toInt();
    if (yInt > 100) {
      yInt = 100;
    }
    if (yInt < 0) {
      yInt = 0;
    }
    return yInt;
  }

  // This function does nothing, in theory this function would send the user to the next survey.
  submit() {
    setState(
      () {},
    );
  }

  // This function returns a text widget of the current percentages for wherever the box is dragged to,
  // This function is needed because percentages below ten don't show properly in the progress bars.
  Text results() {
    return Text(
      "Thing A: " +
          currentY(yDecimal).toInt().toString() +
          "% " +
          "Thing B: " +
          currentX(xDecimal).toInt().toString() +
          "% ",
      textScaleFactor: 1.5,
    );
  }
}
