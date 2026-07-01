class VerseModel {
  final int number;
  final String arab;
  final String translation;

  VerseModel({
    required this.number,
    required this.arab,
    required this.translation,
  });

  factory VerseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return VerseModel(
      number: json["numberInSurah"],
      arab: json["text"],
      translation: json["translation"]["id"],
    );
  }
}