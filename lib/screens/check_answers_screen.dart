import 'package:flutter/material.dart';
import 'package:englishapp/components/gradient_box.dart';
import 'package:englishapp/providers/quiz_provider.dart';
import 'package:englishapp/screens/home_screen.dart';

import 'package:provider/provider.dart';

class CheckAnswersScreen extends StatefulWidget {
  const CheckAnswersScreen({Key? key}) : super(key: key);

  @override
  _CheckScreenState createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckAnswersScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuizProvider>();
    return Scaffold(
      body: GradientBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Kiểm tra câu trả lời',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final question = provider.questions[index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          'Câu hỏi: ${question.question} ',
                        ),
                        trailing: Text(
                          question.correctAnswer,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: provider.questions.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
