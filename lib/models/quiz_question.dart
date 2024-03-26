class QuizQuestion {
  const QuizQuestion(this.text, this.answers, this.answerIndex);

  final String text;
  final List<String> answers;
  final int answerIndex;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
