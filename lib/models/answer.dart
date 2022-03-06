import 'dart:convert';

class Answer {
  int number;
  String answer;
  bool isSelected;
  Answer({
    required this.number,
    required this.answer,
    required this.isSelected,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'answer': answer,
      'isSelected': isSelected,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      number: map['number']?.toInt() ?? 0,
      answer: map['answer'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) => Answer.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Answer &&
        other.number == number &&
        other.answer == answer &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode => number.hashCode ^ answer.hashCode ^ isSelected.hashCode;
}
