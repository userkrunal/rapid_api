import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rapid_api/covid-19/model/covid_model.dart';

class Covid_Api
{

  static Covid_Api covid_api=Covid_Api();
  Future<Welcome> getApi()
  async {
    String link="https://covid-193.p.rapidapi.com/statistics";
    var respones= await http.get(Uri.parse(link),headers: {
      'X-RapidAPI-Key':'12dd88f577msh44f44d4113bb7ebp166c90jsn93bf45a939ff',
      'X-RapidAPI-Host':'covid-193.p.rapidapi.com'
    });
    var json=jsonDecode(respones.body);
    var data=Welcome.fromJson(json);
    return data;
  }
}