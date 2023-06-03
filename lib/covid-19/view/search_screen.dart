import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_api/covid-19/model/covid_model.dart';
import 'package:rapid_api/covid-19/provider/covid_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  CovidProvider? cpT;
  CovidProvider? cpF;
  @override
  Widget build(BuildContext context) {
    cpF=Provider.of<CovidProvider>(context,listen: false);
    cpT=Provider.of<CovidProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(height: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: TextField(
                onChanged: (value) {
                  cpF!.searchcountry(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.cyan)
                  )
                ),
                // decoration: InputDecoration(
                //   filled: true,
                //   fillColor: Colors.teal.shade50,
                // ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'show');
                },
                child: ListTile(title: Text("${cpF!.l1[index].country}"),
                  leading: Image.network("${cpF!.l1[index].countryInfo!.flag}",height: 50,width: 70,fit: BoxFit.fill)
                ),
              );
            },itemCount: cpT!.l1.length,),
          )
        ],
      ),
    ));
  }
}
