class CreateQuizStates {
  final String imageUrl;
  final String title;
  final String description;
  CreateQuizStates(
      {this.imageUrl = "", this.title = "", this.description = ""});

  CreateQuizStates copyWith(
      {String? imageUrl, String? title, String? description}) {
    return CreateQuizStates(
        imageUrl: imageUrl ?? this.imageUrl,
        title: title ?? this.title,
        description: description ?? this.description);
  }
}
