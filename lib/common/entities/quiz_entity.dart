class QuizEntity {
  String? quizId;
  String? title;
  String? description;
  String? imageUrl;

  QuizEntity({this.quizId, this.title, this.description, this.imageUrl});

  Map<String, dynamic> toJson() => {
        "quizId": quizId,
        "title": title,
        "description": description,
        "imageUrl": imageUrl
      };
  factory QuizEntity.fromJson(Map<String, dynamic> json) => QuizEntity(
      quizId: json["quizId"],
      title: json["title"],
      description: json["description"],
      imageUrl: json["imageUrl"]);
}
