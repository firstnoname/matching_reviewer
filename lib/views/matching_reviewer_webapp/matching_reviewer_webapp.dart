import 'package:flutter/material.dart';
import 'package:matching_reviewer/views/views.dart';

class MatchingReviewerWebApp extends StatelessWidget {
  const MatchingReviewerWebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
