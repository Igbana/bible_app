import 'dart:convert';

List<Devotional> devotionsFromJson(List<dynamic> jsonList) {
  return List<Devotional>.from(
    jsonList.map(
      (x) => Devotional.fromJson(x),
    ),
  );
}

String devotionsToJson(List<Devotional> data) {
  return json.encode(
    List<dynamic>.from(
      data.map((x) => null),
    ),
  );
}

class Devotional {
  int? id;
  String date, translation, title, memoryVerse, memoryVersePassage, fullPassage;
  String fullText, bibleInAYear, image, prayerBurden, thoughtOfTheDay;
  String memoryVerseImageToShare, thoughtOfTheDayImageToShare, prayerBurdenImageToShare;

  Devotional(
      {this.id,
      required this.date,
      required this.title,
      required this.translation,
      required this.memoryVerse,
      required this.memoryVersePassage,
      required this.fullPassage,
      required this.fullText,
      required this.bibleInAYear,
      required this.image,
      required this.prayerBurden,
      required this.thoughtOfTheDay,
      required this.memoryVerseImageToShare,
      required this.thoughtOfTheDayImageToShare,
      required this.prayerBurdenImageToShare});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'title': title,
      'translation': translation,
      'memoryVerse': memoryVerse,
      'memoryVersePassage': memoryVersePassage,
      'fullPassage': fullPassage,
      'fullText': fullText,
      'bibleInAYear': bibleInAYear,
      'image': image,
      'prayerBurden': prayerBurden,
      'thoughtOfTheDay': thoughtOfTheDay,
      'memoryVerseImageToShare': memoryVerseImageToShare,
      'thoughtOfTheDayImageToShare': thoughtOfTheDayImageToShare,
      'prayerBurdenImageToShare': prayerBurdenImageToShare,
    };
  }

  @override
  String toString() {
    return 'DevotionalModel{int: $id, date: $date, translation: $translation, title: $title, memoryVerse: $memoryVerse, memoryVersePassage: $memoryVersePassage, fullPassage: $fullPassage, fullText: $fullText, bibleInAYear: $bibleInAYear, image: $image, prayerBurden: $prayerBurden, thoughtOfTheDay: $thoughtOfTheDay, memoryVerseImageToShare: $memoryVerseImageToShare, thoughtOfTheDayImageToShare: $thoughtOfTheDayImageToShare, prayerBurdenImageToShare: $prayerBurdenImageToShare,}';
  }

  factory Devotional.fromJson(Map<String, dynamic> json) {
    return Devotional(
      date: json['date'] ?? '',
      title: json['title'] ?? '',
      translation: json['translation'] ?? '',
      memoryVerse: json['memoryVerse'] ?? '',
      memoryVersePassage: json['memoryVersePassage'] ?? '',
      fullPassage: json['fullPassage'] ?? '',
      fullText: json['fullText'] ?? '',
      bibleInAYear: json['bibleInAYear'] ?? '',
      image: json['image'] ?? '',
      prayerBurden: json['prayerBurden'] ?? '',
      thoughtOfTheDay: json['thoughtOfTheDay'] ?? '',
      memoryVerseImageToShare: json['memoryVerseImageToShare'] ?? '',
      thoughtOfTheDayImageToShare: json['thoughtOfTheDayImageToShare'] ?? '',
      prayerBurdenImageToShare: json['prayerBurdenImageToShare'] ?? '',
    );
  }
}
