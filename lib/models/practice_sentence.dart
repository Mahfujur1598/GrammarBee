class PracticeSentence {
  final String beforeBlank;
  final String afterBlank;
  final String answer;

  PracticeSentence({
    required this.beforeBlank,
    required this.afterBlank,
    required this.answer,
  });
}


List<PracticeSentence> practiceSentences = [
  PracticeSentence(
      beforeBlank: "The sun", afterBlank: "rises in the east.", answer: "always"),
  PracticeSentence(
      beforeBlank: "Bangladesh", afterBlank: "is the capital.", answer: "Dhaka"),
  PracticeSentence(
      beforeBlank: "The flower", afterBlank: "smells good.", answer: "very"),
];

