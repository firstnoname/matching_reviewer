import 'dart:convert';

import 'package:matching_reviewer/models/models.dart';

class Questionnaire {
  List<Question> questions;
  String questionType;

  Questionnaire({
    required this.questions,
    required this.questionType,
  });

  Map<String, dynamic> toMap() {
    return {
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionType': questionType,
    };
  }

  factory Questionnaire.fromMap(Map<String, dynamic> map) {
    return Questionnaire(
      questions: List<Question>.from(
          map['questions']?.map((x) => Question.fromMap(x))),
      questionType: map['questionType'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Questionnaire.fromJson(String source) =>
      Questionnaire.fromMap(json.decode(source));
}
