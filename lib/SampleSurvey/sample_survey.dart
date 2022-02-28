import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  double x = 0.0;
  double y = 0.0;

  void _updateCursorLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      if (kDebugMode) {
        print('x = ' + x.toString());
      }
      y = details.position.dy;
      if (kDebugMode) {
        print('y = ' + y.toString());
      }
    });
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.00),
                  ),
                  Text(
                    "A",
                    textAlign: TextAlign.center,
                    textScaleFactor: 2.0,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(20.00),
                  ),
                  const Text(
                    "Sample Topic: A vs B",
                    textAlign: TextAlign.center,
                    textScaleFactor: 2.0,
                  ),
                  ConstrainedBox(
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
              const Padding(
                padding: EdgeInsets.all(10.00),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(20.00),
              ),
              Text(
                "B",
                textAlign: TextAlign.center,
                textScaleFactor: 2.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
