import 'package:flutter/material.dart';
import 'package:islami_app/Quran/SuraDetailsScreen.dart';

class SuraNameItem extends StatelessWidget {
  String SuraName;
  int SuraIndex;
  SuraNameItem(this.SuraName, this.SuraIndex);
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDatielsScreen.routeName,
            arguments:suraNameArg(SuraName, SuraIndex) );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${SuraName}',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
