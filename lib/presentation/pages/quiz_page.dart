import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/blocs/quiz_bloc.dart';
import '../../data/repositories/quiz_repository.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizBloc(QuizRepository())..add(LoadQuiz('science')),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Culture'),
          backgroundColor: const Color(0xFF5F6FED),
        ),
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state.questions.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.finished) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.emoji_events,
                        size: 80, color: Colors.amber),
                    const SizedBox(height: 20),
                    Text(
                      'Score final',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '${state.score}',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5F6FED),
                      ),
                    ),
                  ],
                ),
              );
            }

            final q = state.questions[state.currentIndex];

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        q.question,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  ...List.generate(q.answers.length, (i) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<QuizBloc>()
                              .add(AnswerQuestion(i));
                        },
                        style: ElevatedButton.styleFrom(
                          padding:
                              const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor:
                              const Color(0xFF5F6FED),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),
                       child: Text(
  q.answers[i],
  style: const TextStyle(
    fontSize: 16,
    color: Colors.white, // ✅ TEXTE BLANC
    fontWeight: FontWeight.w600,
  ),
),

                      ),
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
