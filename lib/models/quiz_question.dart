class QuizQuestion {
  final String topic;
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuizQuestion({
    required this.topic,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

List<QuizQuestion> quizQuestions = [
  // -------------------- TENSE --------------------
  QuizQuestion(
    topic: "Tense",
    question: "She ____ to school every day.",
    options: ["go", "goes", "went", "gone"],
    correctAnswer: "goes",
  ),
  QuizQuestion(
    topic: "Tense",
    question: "I ____ my homework yesterday.",
    options: ["do", "did", "done", "doing"],
    correctAnswer: "did",
  ),
  QuizQuestion(
    topic: "Tense",
    question: "They ____ playing football now.",
    options: ["is", "are", "was", "were"],
    correctAnswer: "are",
  ),
  QuizQuestion(
    topic: "Tense",
    question: "He ____ been to London before.",
    options: ["has", "have", "had", "having"],
    correctAnswer: "has",
  ),
  QuizQuestion(
    topic: "Tense",
    question: "We ____ to the park every Sunday.",
    options: ["go", "goes", "going", "went"],
    correctAnswer: "go",
  ),

  // -------------------- PARTS OF SPEECH --------------------
  QuizQuestion(
    topic: "Parts of Speech",
    question: "'Quickly' is a ____.",
    options: ["Noun", "Verb", "Adjective", "Adverb"],
    correctAnswer: "Adverb",
  ),
  QuizQuestion(
    topic: "Parts of Speech",
    question: "'Beautiful' is a ____.",
    options: ["Adjective", "Adverb", "Verb", "Noun"],
    correctAnswer: "Adjective",
  ),
  QuizQuestion(
    topic: "Parts of Speech",
    question: "'Run' can be a ____.",
    options: ["Noun", "Verb", "Adjective", "Both Noun & Verb"],
    correctAnswer: "Both Noun & Verb",
  ),
  QuizQuestion(
    topic: "Parts of Speech",
    question: "'Happiness' is a ____.",
    options: ["Verb", "Noun", "Adjective", "Adverb"],
    correctAnswer: "Noun",
  ),
  QuizQuestion(
    topic: "Parts of Speech",
    question: "'She sings beautifully' – 'beautifully' is ____.",
    options: ["Adjective", "Adverb", "Verb", "Noun"],
    correctAnswer: "Adverb",
  ),

  // -------------------- VOICE --------------------
  QuizQuestion(
    topic: "Voice",
    question: "The letter was written by him. This sentence is ____ voice.",
    options: ["Active", "Passive"],
    correctAnswer: "Passive",
  ),
  QuizQuestion(
    topic: "Voice",
    question: "She wrote a letter. This sentence is ____ voice.",
    options: ["Active", "Passive"],
    correctAnswer: "Active",
  ),
  QuizQuestion(
    topic: "Voice",
    question: "The book has been read by me. This is ____ voice.",
    options: ["Active", "Passive"],
    correctAnswer: "Passive",
  ),
  QuizQuestion(
    topic: "Voice",
    question: "They play football every day. This is ____ voice.",
    options: ["Active", "Passive"],
    correctAnswer: "Active",
  ),
  QuizQuestion(
    topic: "Voice",
    question: "The cake was baked by my mother. This sentence is ____ voice.",
    options: ["Active", "Passive"],
    correctAnswer: "Passive",
  ),
];
