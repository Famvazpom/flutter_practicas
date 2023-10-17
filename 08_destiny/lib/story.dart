class Story {
  late String storyTitle;
  late String choiceA;
  late String choiceB;
  late int nextA;
  late int nextB;

  Story(
      {required String title,
      required String cA,
      required String cB,
      required int nA,
      required int nB}) {
    storyTitle = title;
    choiceA = cA;
    choiceB = cB;
    nextA = nA;
    nextB = nB;
  }
}
