import 'package:flutter/cupertino.dart';
import 'package:rapid_api/covid-19/hlper/covid_api.dart';
import 'package:rapid_api/covid-19/model/covid_model.dart';

class CovidProvider extends ChangeNotifier
{
  Future<List<Welcome>> showData()
  async {
    return await Covid_Api.covid_api.getApi();
    notifyListeners();
  }
}