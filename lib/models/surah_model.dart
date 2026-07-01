class SurahModel {
  final int number;
  final String englishName;
  final String arabicName;
  final String revelationType;
  final int ayahs;

  SurahModel({
    required this.number,
    required this.englishName,
    required this.arabicName,
    required this.revelationType,
    required this.ayahs,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      number: json["number"],
      englishName: json["englishName"],
      arabicName: json["name"],
      revelationType: json["revelationType"],
      ayahs: json["numberOfAyahs"],
    );
  }
}