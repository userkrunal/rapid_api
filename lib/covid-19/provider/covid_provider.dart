import 'package:flutter/cupertino.dart';
import 'package:rapid_api/covid-19/hlper/covid_api.dart';
import 'package:rapid_api/covid-19/model/covid_model.dart';

class CovidProvider extends ChangeNotifier
{
  List<CovidModel> covid=[];

  Future<List<CovidModel>> getCovidData()
  async {
    covid=await CovidApi.covidApi.getApi();
    return covid;
  }

  List<CovidModel> l1=[];
  List<CovidModel> filtered=[];
  void searchcountry(String search)
  {
    if(search.isEmpty)
      {
        l1=covid;
      }
    else
      {
        filtered.clear();
        for(var c in covid)
          {
            if(c.country!.toLowerCase().contains(search.toLowerCase()))
              {
                filtered.add(c);
              }
          }
        l1=filtered;
      }
    notifyListeners();
  }
}