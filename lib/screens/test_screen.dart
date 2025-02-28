import 'package:flutter/material.dart';
import '../data/questions.dart';
import 'result_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int currentQuestion = 0;
  Map<int, String> answers = {};

  void _handleAnswer(String dimension) {
    setState(() {
      answers[currentQuestion] = dimension;
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(answers: answers),
          ),
        );
      }
    });
  }

  // 动态颜色生成方法（示例实现）
  Color _getDynamicColor() {
    // 简单的动态颜色变化，基于问题索引
    return Color.lerp(
      const Color(0xFF40B883),
      Colors.teal,
      currentQuestion / questions.length,
    )!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('免费性格测试'),
        centerTitle: true,
        backgroundColor: const Color(0xFF40B883),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: const Color(0xFF40B883),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'NERIS Type Explorer®',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      questions[currentQuestion].text,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ...questions[currentQuestion].options.map((option) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ElevatedButton(
                          onPressed: () => _handleAnswer(option.dimension),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _getDynamicColor(),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ).copyWith(
                            // 添加波纹动画效果
                            animationDuration:
                                const Duration(milliseconds: 500),
                          ),
                          child: Text(
                            option.text,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                    const Spacer(),
                    // 进度指示器
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '同意',
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 10),
                        ...List.generate(7, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF40B883),
                                width: 2,
                              ),
                              color: index == 3
                                  ? const Color(0xFF40B883)
                                  : Colors.transparent,
                            ),
                          );
                        }),
                        const SizedBox(width: 10),
                        const Text(
                          '反对',
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // 进度条
                    LinearProgressIndicator(
                      value: (currentQuestion + 1) / questions.length,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF40B883),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '问题 ${currentQuestion + 1}/${questions.length}',
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
