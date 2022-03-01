import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

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
  double xGrid = 0.0;
  double yGrid = 0.0;

  double xDecimal = 0.00;
  double yDecimal = 0.00;

  void _updateCursorLocation(PointerEvent details) {
    setState(
      () {
        xGrid = details.localPosition.dx;
        if (kDebugMode) {
          print('x = ' + xGrid.toString());
        }

        xDecimal = calculator(xGrid, 300);
        if (kDebugMode) {
          print('x % = ' + xDecimal.toString());
        }

        yGrid = details.localPosition.dy;
        if (kDebugMode) {
          print('y = ' + yGrid.toString());
        }

        yDecimal = calculator(yGrid, 200);
        if (kDebugMode) {
          print('y % = ' + yDecimal.toString());
        }
      },
    );
  }

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                "A Really Long Sample Survey Title: Thing A Vs. Thing B",
                textScaleFactor: 2.0,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(20.00),
                  ),
                  SizedBox(
                    width: 25,
                    height: 200,
                    child: FAProgressBar(
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.up,
                      currentValue: 50,
                      backgroundColor: Colors.blueGrey,
                      progressColor: Colors.blue,
                      displayText: '%',
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(20.00),
                  ),
                  Container(
                    constraints: BoxConstraints.tight(
                      const Size(300, 200),
                    ),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.grab,
                      onHover: _updateCursorLocation,
                      child: Container(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(20.00),
              ),
              SizedBox(
                width: 300,
                height: 25,
                child: FAProgressBar(
                  direction: Axis.horizontal,
                  currentValue: 50,
                  backgroundColor: Colors.blueGrey,
                  progressColor: Colors.blue,
                  displayText: '%',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double calculator(double grid, double maxGrid) {
    var decimal = grid / maxGrid;
    var formattedDecimal = double.parse(decimal.toStringAsFixed(2));
    return formattedDecimal;
  }
}
