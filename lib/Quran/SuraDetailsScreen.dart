import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/main.dart';

class SuraDatielsScreen extends StatefulWidget {
  static const String routeName = 'sura_datails';

  @override
  _SuraDatielsScreenState createState() => _SuraDatielsScreenState();
}

class _SuraDatielsScreenState extends State<SuraDatielsScreen> {
  List<String> varses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as suraNameArg;
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg3.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                '${args.SuraName}',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Container(
              margin: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: varses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          MyThemeData.primaryColor),
                    ))
                  : ListView.separated(
                      separatorBuilder: (buildContext, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          width: double.infinity,
                          height: 1,
                          color: MyThemeData.primaryColor,
                        );
                      },
                      itemBuilder: (buildContext, index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      varses[index]+'{${index+1}}',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                    )),
                              ),
                            ]);
                      },
                      itemCount: varses.length,
                    ),
            )),
      ],
    );
  }

  void loadSuraDatials(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/Files/${index + 1}.txt');
    List<String> ayat = fileContent.split('\n');
    this.varses = ayat;
    setState(() {});
  }
}

class suraNameArg {
  String SuraName;
  int SuraIndex;
  suraNameArg(this.SuraName, this.SuraIndex);
}
