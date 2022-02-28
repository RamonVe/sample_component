import 'package:flutter/material.dart';
import 'SampleSurvey/sample_survey.dart';

void main() {
  runApp(const SampleSurveyApp());
}

class SampleSurveyApp extends StatelessWidget {
  const SampleSurveyApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Survey',
      theme: ThemeData(
        // This is the theme of the application.
        primarySwatch: Colors.blueGrey,
      ),
      home: const SampleSurvey(title: 'Sample Survey'),
    );
  }
}
