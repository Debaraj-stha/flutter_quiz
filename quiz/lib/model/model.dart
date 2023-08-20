class QuizQuestion {
  final int id;
  final String question;
  final String? description;
  final Map<String, String?> answers;
  final String multipleCorrectAnswers;
  final Map<String, String> correctAnswers;
  final String? correctAnswer;
  final String? explanation;
  final String? tip;
  final List<Tag> tags;
  final String category;
  final String difficulty;

  QuizQuestion({
    required this.id,
    required this.question,
    this.description,
    required this.answers,
    required this.multipleCorrectAnswers,
    required this.correctAnswers,
    this.correctAnswer,
    this.explanation,
    this.tip,
    required this.tags,
    required this.category,
    required this.difficulty,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'],
      question: json['question'],
      description: json['description'],
      answers: Map<String, String?>.from(json['answers']),
      multipleCorrectAnswers: json['multiple_correct_answers'],
      correctAnswers: Map<String, String>.from(json['correct_answers']),
      correctAnswer: json['correct_answer'],
      explanation: json['explanation'],
      tip: json['tip'],
      tags: List<Tag>.from(json['tags'].map((tag) => Tag.fromJson(tag))),
      category: json['category'],
      difficulty: json['difficulty'],
    );
  }
}

class Tag {
  final String name;

  Tag({required this.name});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(name: json['name']);
  }
}

class history {
  String id;
  int score;
  DateTime playedAt;
  history({required this.id, required this.score, required this.playedAt});
  factory history.fromJson(Map<String, dynamic> json) =>
      history(id: json['id'], score: json['score'], playedAt: json['playedAt']);
  Map<String, dynamic> toJson() =>
      {"id": id, "score": score, "playedAt": playedAt};
}

class history_details {
  String id;
  String question;
  String correctAnswer;
  String givenAnswer;
  String historyId;
  history_details(
      {required this.id,
      required this.question,
      required this.historyId,
      required this.correctAnswer,
      required this.givenAnswer});
  factory history_details.fromJson(Map<String, dynamic> json) =>
      history_details(
        historyId: json['historyId'],
          id: json['id'],
          question: json['question'],
          correctAnswer: json['correctAnswer'],
          givenAnswer: json['givenAnswer']);
  Map<String, dynamic> toJson() => {
        "id": id,
        "historyId":historyId,
        "question": question,
        "correctAnswer": correctAnswer,
        "givenAnswer": givenAnswer
      };
}
