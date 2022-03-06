import 'dart:convert';

import 'models.dart';

class Question {
  int number;
  String qeustion;
  List<Answer> answers;

  Question({
    required this.number,
    required this.qeustion,
    required this.answers,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'qeustion': qeustion,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      number: map['number']?.toInt() ?? 0,
      qeustion: map['qeustion'] ?? '',
      answers: List<Answer>.from(map['answers']?.map((x) => Answer.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));
}
