// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  String? activeCasesText;
  String? countryText;
  LastUpdate? lastUpdate;
  String? newCasesText;
  NewDeathsText? newDeathsText;
  String? totalCasesText;
  String? totalDeathsText;
  String? totalRecoveredText;

  Welcome({
    this.activeCasesText,
    this.countryText,
    this.lastUpdate,
    this.newCasesText,
    this.newDeathsText,
    this.totalCasesText,
    this.totalDeathsText,
    this.totalRecoveredText,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    activeCasesText: json["Active Cases_text"],
    countryText: json["Country_text"],
    lastUpdate: lastUpdateValues.map[json["Last Update"]]!,
    newCasesText: json["New Cases_text"],
    newDeathsText: newDeathsTextValues.map[json["New Deaths_text"]]!,
    totalCasesText: json["Total Cases_text"],
    totalDeathsText: json["Total Deaths_text"],
    totalRecoveredText: json["Total Recovered_text"],
  );

  Map<String, dynamic> toJson() => {
    "Active Cases_text": activeCasesText,
    "Country_text": countryText,
    "Last Update": lastUpdateValues.reverse[lastUpdate],
    "New Cases_text": newCasesText,
    "New Deaths_text": newDeathsTextValues.reverse[newDeathsText],
    "Total Cases_text": totalCasesText,
    "Total Deaths_text": totalDeathsText,
    "Total Recovered_text": totalRecoveredText,
  };
}

enum LastUpdate { THE_202305310118, THE_202305302316, THE_202305300708, THE_202305310016, THE_202305301009, THE_202305301812, THE_202305301209 }

final lastUpdateValues = EnumValues({
  "2023-05-30 07:08": LastUpdate.THE_202305300708,
  "2023-05-30 10:09": LastUpdate.THE_202305301009,
  "2023-05-30 12:09": LastUpdate.THE_202305301209,
  "2023-05-30 18:12": LastUpdate.THE_202305301812,
  "2023-05-30 23:16": LastUpdate.THE_202305302316,
  "2023-05-31 00:16": LastUpdate.THE_202305310016,
  "2023-05-31 01:18": LastUpdate.THE_202305310118
});

enum NewDeathsText { THE_259, THE_8, EMPTY, THE_48, THE_35, THE_7, THE_138, THE_1, THE_4, THE_5, THE_2 }

final newDeathsTextValues = EnumValues({
  "": NewDeathsText.EMPTY,
  "+1": NewDeathsText.THE_1,
  "+138": NewDeathsText.THE_138,
  "+2": NewDeathsText.THE_2,
  "+259": NewDeathsText.THE_259,
  "+35": NewDeathsText.THE_35,
  "+4": NewDeathsText.THE_4,
  "+48": NewDeathsText.THE_48,
  "+5": NewDeathsText.THE_5,
  "+7": NewDeathsText.THE_7,
  "+8": NewDeathsText.THE_8
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
