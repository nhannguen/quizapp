import 'package:flutter/material.dart';
import 'package:englishapp/components/action_button.dart';
import 'package:englishapp/components/gradient_box.dart';
import 'package:englishapp/components/rank_auth_button.dart';
import 'package:englishapp/models/question.dart';
import 'package:englishapp/providers/quiz_provider.dart';
import 'package:englishapp/screens/quiz_screen.dart';
import 'package:englishapp/screens/check_answers_screen.dart';

import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    Key? key,
    required this.score,
    required this.questions,
    required this.totalTime,
    answers,
    required this.answer,
  }) : super(key: key);

  final int score;
  final List<Question> questions;
  final int totalTime;
  final List answer;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: GradientBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Kết quả: ${widget.score * 10} / ${widget.questions.length * 10}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 40),
              ActionButton(
                title: 'Bắt đầu lại',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        totalTime: widget.totalTime,
                        questions: widget.questions,
                      ),
                    ),
                  );
                },
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.check_circle_rounded),
                label: Text('Kiểm tra đáp án'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CheckAnswersScreen()));
                },
              ),
              SizedBox(height: 40),
              RankAuthButton()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final provider = context.read<QuizProvider>();
    provider.updateHighscore(widget.score);
  }
}
