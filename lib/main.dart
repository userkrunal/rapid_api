import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_api/covid-19/provider/covid_provider.dart';
import 'package:rapid_api/covid-19/view/home1.dart';
import 'package:rapid_api/covid-19/view/home_screen.dart';
import 'package:rapid_api/covid-19/view/search_screen.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return ChangeNotifierProvider(
        create: (context) => CovidProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => HomeScreen(),
            'search':(context) => SearchScreen(),
            'contry':(context) => ContryScreen(),
          },
        ),
      );
    },)
  );
}