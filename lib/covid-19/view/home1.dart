import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_api/covid-19/model/covid_model.dart';
import 'package:rapid_api/covid-19/provider/covid_provider.dart';
import 'package:sizer/sizer.dart';

class ContryScreen extends StatefulWidget {
  const ContryScreen({Key? key}) : super(key: key);

  @override
  State<ContryScreen> createState() => _ContryScreenState();
}

class _ContryScreenState extends State<ContryScreen> {
  CovidProvider? cpT;
  CovidProvider? cpF;
  @override
  Widget build(BuildContext context) {
    cpF=Provider.of<CovidProvider>(context,listen: false);
    cpT=Provider.of<CovidProvider>(context,listen: true);
   int index= ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(child: Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/img_1.png"),fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${cpF!.covid[index].countryInfo!.flag}"),fit: BoxFit.fill)),
                  ),
                  Text("${cpF!.covid[index].country}",style: TextStyle(fontSize:25.sp,color: Colors.white)),
                  Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${cpF!.covid[index].countryInfo!.flag}"),fit: BoxFit.fill)),
                  ),
                ],
              ),
              Divider(height: 2.h,color: Colors.white,thickness: 2),
              SizedBox(height: 20),
              Text("Total Cases :- ${cpF!.covid[index].cases}",style: TextStyle(fontSize: 20.sp,color: Colors.white)),
              SizedBox(height: 20),
              Text("Active Cases :- ${cpF!.covid[index].active}",style: TextStyle(fontSize: 20.sp,color: Colors.white)),
              SizedBox(height: 20),
              Text("Critical Cases :- ${cpF!.covid[index].critical}",style: TextStyle(fontSize: 20.sp,color: Colors.white)),
              SizedBox(height: 20),
              Text("CasesPerOneMillion  :- ${cpF!.covid[index].casesPerOneMillion}",style: TextStyle(fontSize: 20.sp,color: Colors.white)),
              SizedBox(height: 20),
              Text("Deaths :- ${cpF!.covid[index].deaths}",style: TextStyle(fontSize: 20.sp,color: Colors.white)),
              SizedBox(height: 20),
              Text("DeathsPerOneMillion  :- ${cpF!.covid[index].deathsPerOneMillion}",style: TextStyle(fontSize: 20.sp,color: Colors.white)),
              SizedBox(height: 20),
              Text("Tests  :- ${cpF!.covid[index].tests}",style: TextStyle(fontSize: 20.sp,color: Colors.white)),
              SizedBox(height: 20),
              Text("Population  :- ${cpF!.covid[index].population}",style: TextStyle(fontSize: 20.sp,color: Colors.white)),

            ],
          ),
        ),
      ),
    ));
  }
}
