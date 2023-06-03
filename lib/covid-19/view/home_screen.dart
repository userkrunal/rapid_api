import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_api/covid-19/model/covid_model.dart';
import 'package:rapid_api/covid-19/provider/covid_provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CovidProvider? cpT;
  CovidProvider? cpF;
  @override
  Widget build(BuildContext context) {
    cpF=Provider.of<CovidProvider>(context,listen: false);
    cpT=Provider.of<CovidProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      body: FutureBuilder(
        future: cpF!.getCovidData(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            {
              return Text("${snapshot.error}");
            }
          else if(snapshot.hasData)
            {
              List<CovidModel> covidData=snapshot.data!;
              return Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/img.png"),fit: BoxFit.fill)),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "search");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Container(height: 60,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white70),child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text("Search...",style: TextStyle(fontSize: 25,color: Colors.black)),
                              Spacer(),
                              Icon(Icons.search,size: 30,color: Colors.black,)
                            ],
                          ),
                        ),),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, 'contry',arguments: index);
                              },
                                child: ListTile(leading: Image.network("${covidData[index].countryInfo!.flag}",height: 50,width: 70,fit: BoxFit.fill,),title: Text("${covidData[index].country}",style: TextStyle(fontSize: 3.h,color: Colors.white)))),
                          );
                        },itemCount: covidData.length),
                    ),
                  ],
                ),
              );
            }
          return Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
