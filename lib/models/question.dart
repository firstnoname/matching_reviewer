import 'dart:convert';

import 'models.dart';

class Question {
  int number;
  String question;
  List<Answer> answers;

  Question({
    required this.number,
    required this.question,
    required this.answers,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'qeustion': question,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      number: map['number']?.toInt() ?? 0,
      question: map['qeustion'] ?? '',
      answers: List<Answer>.from(map['answers']?.map((x) => Answer.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));
}
