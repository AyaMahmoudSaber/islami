import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Hadeht/Hadeht_Tab.dart';
import 'package:islami_app/Quran/Quran_Tab.dart';
import 'package:islami_app/Radio/Radio_Tab.dart';
import 'package:islami_app/Sebha/Sebha_Tab.dart';
import 'package:islami_app/Setting/Setting%20Tab.dart';
import 'package:islami_app/main.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/bg3.png',
            width: double.infinity, height: double.infinity, fit: BoxFit.fill),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Islami',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: MyThemeData.primaryColor,
            ),
            child: BottomNavigationBar(
              onTap: (index) {
                currentPage = index;
                setState(() {});
              },
              currentIndex: currentPage,
              selectedItemColor: MyThemeData.SelectedColor,
              unselectedItemColor: MyThemeData.unSelectedColor,
              backgroundColor: MyThemeData.primaryColor,
              items: [
                BottomNavigationBarItem(
                  label: 'Quran',
                  icon: Image.asset(
                    'assets/images/quran.png',
                    width: 30,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Hadeth',
                  icon: Image.asset(
                    'assets/images/Group 6.png',
                    width: 30,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Sebha',
                  icon: Image.asset(
                    'assets/images/sebha.png',
                    width: 30,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Radio',
                  icon: Image.asset(
                    'assets/images/radio.png',
                    width: 30,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Setting',
                  icon: Icon(
                    Icons.settings,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          body: Container(child: getCurrentPage()),
        ),
      ],
    );
  }

  Widget getCurrentPage() {
    if (currentPage == 0) {
      return QuranTab();
    } else if (currentPage == 1) {
      return HadehtTab();
    } else if (currentPage == 2) {
      return SebhaTab();
    } else if (currentPage == 3) {
      return RadioTab();
    } else {
      return SettingTab();
    }
  }
}
