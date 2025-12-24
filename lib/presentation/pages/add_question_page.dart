import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddQuestionPage extends StatefulWidget {
  const AddQuestionPage({super.key});

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  final themeCtrl = TextEditingController();
  final questionCtrl = TextEditingController();
  final answersCtrl = List.generate(4, (_) => TextEditingController());

  int correctIndex = 0;
  bool loading = false;

  Future<void> saveQuestion() async {
    setState(() => loading = true);

    await FirebaseFirestore.instance.collection('questions').add({
      'theme': themeCtrl.text.trim(),
      'question': questionCtrl.text.trim(),
      'answers': answersCtrl.map((e) => e.text.trim()).toList(),
      'correctIndex': correctIndex,
    });

    setState(() => loading = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une question'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: themeCtrl,
              decoration: const InputDecoration(
                labelText: 'Thème (ex: science)',
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: questionCtrl,
              decoration: const InputDecoration(
                labelText: 'Question',
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'Réponses (cocher la bonne)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            for (int i = 0; i < 4; i++)
              Row(
                children: [
                  Radio<int>(
                    value: i,
                    groupValue: correctIndex,
                    onChanged: (v) {
                      setState(() => correctIndex = v!);
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: answersCtrl[i],
                      decoration: InputDecoration(
                        labelText: 'Réponse ${i + 1}',
                      ),
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: loading ? null : saveQuestion,
              child: loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}
