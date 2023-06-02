import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rapid_api/covid-19/model/covid_model.dart';

class CovidApi
{

  static CovidApi covidApi=CovidApi();
  Future<List<CovidModel>> getApi()
  async {
    String? link="https://corona.lmao.ninja/v2/countries/";
    var response =await http.get(Uri.parse(link));
    List json=jsonDecode(response.body);
    List<CovidModel> coviddata=[];
    coviddata=json.map((e) => CovidModel.fromJson(e)).toList();
    return coviddata;
  }
}