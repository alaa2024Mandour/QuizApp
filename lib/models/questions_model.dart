class QuizQuestions {

  String question;
  List<String> answers ;

  QuizQuestions(this.question,this.answers);


  List<String> getShuffledAnswers(){
      final shuffledList = List.of(answers);
      shuffledList.shuffle();
      return shuffledList;
  }
}