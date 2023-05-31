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
        future: cpF!.showData(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            {
              return Text("${snapshot.error}");
            }
          else if(snapshot.hasData)
            {
             Welcome welcome=snapshot.data!;
              return Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/img.png"),fit: BoxFit.fill)),
              );
            }
          return Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
