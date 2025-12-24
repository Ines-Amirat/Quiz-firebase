import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/question_model.dart';
import '../../data/repositories/quiz_repository.dart';

abstract class QuizEvent {}

class LoadQuiz extends QuizEvent {
  final String theme;
  LoadQuiz(this.theme);
}

class AnswerQuestion extends QuizEvent {
  final int selectedIndex;
  AnswerQuestion(this.selectedIndex);
}

class QuizState {
  final int currentIndex;
  final int score;
  final List<QuestionModel> questions;
  final bool finished;

  QuizState({
    required this.currentIndex,
    required this.score,
    required this.questions,
    required this.finished,
  });

  factory QuizState.initial() =>
      QuizState(currentIndex: 0, score: 0, questions: [], finished: false);
}

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizRepository repository;

  QuizBloc(this.repository) : super(QuizState.initial()) {
    on<LoadQuiz>(_onLoadQuiz);
    on<AnswerQuestion>(_onAnswerQuestion);
  }

  Future<void> _onLoadQuiz(
      LoadQuiz event, Emitter<QuizState> emit) async {
    final questions = await repository.getQuestions(event.theme);
    emit(QuizState(
      currentIndex: 0,
      score: 0,
      questions: questions,
      finished: false,
    ));
  }

  void _onAnswerQuestion(
      AnswerQuestion event, Emitter<QuizState> emit) {
    final q = state.questions[state.currentIndex];
    final isCorrect = event.selectedIndex == q.correctIndex;

    final nextIndex = state.currentIndex + 1;

    emit(QuizState(
      currentIndex: nextIndex,
      score: isCorrect ? state.score + 1 : state.score,
      questions: state.questions,
      finished: nextIndex >= state.questions.length,
    ));
  }
}
