
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String? welcomeGet;
  List? parameters;
  List? errors;
  int? results;
  List? response;

  Welcome({
    this.welcomeGet,
    this.parameters,
    this.errors,
    this.results,
    this.response,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    welcomeGet: json["get"],
    parameters: json["parameters"] ,
    errors: json["errors"] ,
    results: json["results"],
    response: json["response"],
  );

  Map<String, dynamic> toJson() => {
    "get": welcomeGet,
    "parameters": parameters ,
    "errors": errors ,
    "results": results,
    "response": response,
  };
}

class Response {
  Continent? continent;
  String? country;
  int? population;
  Cases? cases;
  Deaths? deaths;
  Tests? tests;
  DateTime? day;
  DateTime? time;

  Response({
    this.continent,
    this.country,
    this.population,
    this.cases,
    this.deaths,
    this.tests,
    this.day,
    this.time,
  });

  factory Response.fromJson(Map json) => Response(
    continent: continentValues.map[json["continent"]]!,
    country: json["country"],
    population: json["population"],
    cases: json["cases"],
    deaths: json["deaths"] ,
    tests: json["tests"],
    day: json["day"] ,
    time: json["time"] ,
  );

  Map toJson() => {
    "continent": continentValues.reverse[continent],
    "country": country,
    "population": population,
    "cases": cases?.toJson(),
    "deaths": deaths?.toJson(),
    "tests": tests?.toJson(),
    "day": "${day!.year.toString().padLeft(4, '0')}-${day!.month.toString().padLeft(2, '0')}-${day!.day.toString().padLeft(2, '0')}",
    "time": time?.toIso8601String(),
  };
}

class Cases {
  String? casesNew;
  int? active;
  int? critical;
  int? recovered;
  String? the1MPop;
  int? total;

  Cases({
    this.casesNew,
    this.active,
    this.critical,
    this.recovered,
    this.the1MPop,
    this.total,
  });

  factory Cases.fromJson(Map json) => Cases(
    casesNew: json["new"],
    active: json["active"],
    critical: json["critical"],
    recovered: json["recovered"],
    the1MPop: json["1M_pop"],
    total: json["total"],
  );

  Map toJson() => {
    "new": casesNew,
    "active": active,
    "critical": critical,
    "recovered": recovered,
    "1M_pop": the1MPop,
    "total": total,
  };
}

enum Continent { NORTH_AMERICA, AFRICA, ASIA, OCEANIA, SOUTH_AMERICA, EUROPE, ALL }

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "All": Continent.ALL,
  "Asia": Continent.ASIA,
  "Europe": Continent.EUROPE,
  "North-America": Continent.NORTH_AMERICA,
  "Oceania": Continent.OCEANIA,
  "South-America": Continent.SOUTH_AMERICA
});

class Deaths {
  String? deathsNew;
  String? the1MPop;
  int? total;

  Deaths({
    this.deathsNew,
    this.the1MPop,
    this.total,
  });

  factory Deaths.fromJson(Map<String, dynamic> json) => Deaths(
    deathsNew: json["new"],
    the1MPop: json["1M_pop"],
    total: json["total"],
  );

  Map toJson() => {
    "new": deathsNew,
    "1M_pop": the1MPop,
    "total": total,
  };
}

class Tests {
  String? the1MPop;
  int? total;

  Tests({
    this.the1MPop,
    this.total,
  });

  factory Tests.fromJson(Map json) => Tests(
    the1MPop: json["1M_pop"],
    total: json["total"],
  );

  Map toJson() => {
    "1M_pop": the1MPop,
    "total": total,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
