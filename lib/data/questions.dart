import '../models/question.dart';

final questions = [
  Question(
    id: 1,
    text: "在社交场合中，你通常会：",
    options: [
      Option(text: "与很多人交谈，获得能量", dimension: "E"),
      Option(text: "倾向于与少数人深入交谈，或独处以恢复能量", dimension: "I"),
    ],
  ),
  Question(
    id: 2,
    text: "当面对新的项目时，你倾向于：",
    options: [
      Option(text: "先仔细规划每个步骤", dimension: "J"),
      Option(text: "边做边调整，保持灵活", dimension: "P"),
    ],
  ),
  Question(
    id: 3,
    text: "在做决定时，你更多地依靠：",
    options: [
      Option(text: "逻辑分析和客观事实", dimension: "T"),
      Option(text: "个人价值观和感受", dimension: "F"),
    ],
  ),
  Question(
    id: 4,
    text: "你更喜欢关注：",
    options: [
      Option(text: "具体的细节和实际的事实", dimension: "S"),
      Option(text: "整体概念和未来可能性", dimension: "N"),
    ],
  ),
  Question(
    id: 5,
    text: "在团队工作中，你更倾向于：",
    options: [
      Option(text: "主动发言和引导讨论", dimension: "E"),
      Option(text: "倾听他人并在必要时发言", dimension: "I"),
    ],
  ),
  Question(
    id: 6,
    text: "你更喜欢的工作环境是：",
    options: [
      Option(text: "有明确的规则和期限", dimension: "J"),
      Option(text: "灵活自由，可以随时调整", dimension: "P"),
    ],
  ),
  Question(
    id: 7,
    text: "在解决问题时，你通常会：",
    options: [
      Option(text: "寻找最合理的解决方案", dimension: "T"),
      Option(text: "考虑方案对他人的影响", dimension: "F"),
    ],
  ),
  Question(
    id: 8,
    text: "你更容易记住：",
    options: [
      Option(text: "人们说的具体内容", dimension: "S"),
      Option(text: "人们话语背后的含义", dimension: "N"),
    ],
  ),
  Question(
    id: 9,
    text: "周末你更倾向于：",
    options: [
      Option(text: "参加社交活动和聚会", dimension: "E"),
      Option(text: "在家放松或与密友相处", dimension: "I"),
    ],
  ),
  Question(
    id: 10,
    text: "面对新的挑战时，你会：",
    options: [
      Option(text: "遵循已证实有效的方法", dimension: "S"),
      Option(text: "尝试创新的解决方案", dimension: "N"),
    ],
  ),
  Question(
    id: 11,
    text: "在评价他人时，你更看重：",
    options: [
      Option(text: "能力和成就", dimension: "T"),
      Option(text: "品格和为人", dimension: "F"),
    ],
  ),
  Question(
    id: 12,
    text: "你的工作桌通常是：",
    options: [
      Option(text: "整齐有序，物品摆放规律", dimension: "J"),
      Option(text: "随性摆放，但知道东西在哪", dimension: "P"),
    ],
  ),
];