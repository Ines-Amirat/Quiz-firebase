abstract class QuizEvent {}

class LoadQuiz extends QuizEvent {
  final String theme;
  LoadQuiz(this.theme);
}

class AnswerQuestion extends QuizEvent {
  final int index;
  AnswerQuestion(this.index);
}
