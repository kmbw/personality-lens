import 'package:flutter/material.dart';

// 问题-维度映射（根据实际题库调整）
const Map<String, String> _answerToDimension = {
  'A': 'I', // 答案 A 表示内向
  'B': 'E', // 答案 B 表示外向
  'C': 'S', // 答案 C 表示感觉（示例，需根据题库定义）
  'D': 'N', // 答案 D 表示直觉（示例，需根据题库定义）
  'E': 'T', // 答案 E 表示思考（示例，需根据题库定义）
  'F': 'F', // 答案 F 表示情感（示例，需根据题库定义）
  'G': 'J', // 答案 G 表示判断（示例，需根据题库定义）
  'H': 'P', // 答案 H 表示感知（示例，需根据题库定义）
  // 注意：实际题库可能使用 A/B 选项，映射需与题库一致
};

class ResultScreen extends StatelessWidget {
  final Map<int, String> answers;

  const ResultScreen({super.key, required this.answers});

  String _calculatePersonalityType() {
    // 初始化维度计数器
    final Map<String, int> dimensions = {
      'E': 0,
      'I': 0,
      'S': 0,
      'N': 0,
      'T': 0,
      'F': 0,
      'J': 0,
      'P': 0,
    };

    // 遍历答案，将其映射到维度并累加
    for (var answer in answers.values) {
      if (_answerToDimension.containsKey(answer)) {
        final dimension = _answerToDimension[answer]!;
        dimensions[dimension] = (dimensions[dimension] ?? 0) + 1;
      } else {
        // 记录未知答案（调试用）
        print('警告: 未知答案 "$answer"，跳过处理');
      }
    }

    // 强制设置为内向型(I)，其他维度基于得分比较
    final String ei = 'I'; // 强制内向
    final String sn = dimensions['S']! > dimensions['N']! ? 'S' : 'N';
    final String tf = dimensions['T']! > dimensions['F']! ? 'T' : 'F';
    final String jp = dimensions['J']! > dimensions['P']! ? 'J' : 'P';

    // 确保返回 4 字符的 MBTI 类型
    return '$ei$sn$tf$jp';
  }

  // 性格描述方法（需根据 personalityType 扩展）
  Widget _buildPersonalityDescription(String type) {
    // 简化的描述，建议根据类型补充详细内容
    final Map<String, String> descriptions = {
      'ISFJ': '守护者 - 温暖、体贴、可靠。',
      'INFP': '理想主义者 - 富有同情心、追求意义。',
      // 添加其他 16 种类型描述
      'XXXX': '未知类型，请补充更多问题以确定。', // 默认值
    };

    final description = descriptions[type] ?? descriptions['XXXX']!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '性格类型: $type',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final personalityType = _calculatePersonalityType();

    return Scaffold(
      appBar: AppBar(
        title: const Text('免费性格测试'),
        centerTitle: true,
        backgroundColor: const Color(0xFF40B883),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: const Color(0xFF40B883),
        child: SingleChildScrollView(
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
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF40B883).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.person_outline,
                            color: Color(0xFF40B883),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            '做你自己，诚实回答，找出你的性格类型。',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF40B883).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.psychology,
                            color: Color(0xFF40B883),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            '了解你的性格类型如何在你生活的各个领域中产生影响。',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF40B883).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.book,
                            color: Color(0xFF40B883),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            '借助我们的精选材料，塑造你理想的自我。',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '你的性格类型是：$personalityType',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _buildPersonalityDescription(personalityType),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.of(context).popUntil((route) => route.isFirst),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF40B883),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    '重新测试',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
