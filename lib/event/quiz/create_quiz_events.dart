abstract class CreateQuizEvents {
  const CreateQuizEvents();
}

class QuizImageUrlEvent extends CreateQuizEvents {
  final String imageUrl;
  const QuizImageUrlEvent(this.imageUrl);
}

class QuizTitleEvent extends CreateQuizEvents {
  final String title;
  const QuizTitleEvent(this.title);
}

class QuizDescriptionEvent extends CreateQuizEvents {
  final String description;
  const QuizDescriptionEvent(this.description);
}
