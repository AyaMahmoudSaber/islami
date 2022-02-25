import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/main.dart';
import 'dart:math'as math;

class SebhaTab extends StatefulWidget {
  @override
  _SebhaTabState createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter=0;
  List<String>TasbehList=['سبحان الله','الحمد لله','لا اله الا الله','الله اكبر','لا حول ولا قوة الا بالله'];
  int currentindex=0;
  double angle=0.0;

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              InkWell(
                onTap:onTasbehClick,
                child: Container(
                  margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1),
                  child: Transform.rotate(
                    angle:  math.pi/180*angle,
                      child: Image.asset('assets/images/body of seb7a.png')),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01),
                child: Image.asset('assets/images/head of seb7a.png'),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Expanded(child: Column(
            children: [
              Container(
                child: Text('Tasbeh Number',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: MyThemeData.primaryColor,
                  borderRadius:BorderRadius.circular(15),
                ),
                child: Text('${counter}',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: MyThemeData.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(TasbehList[currentindex],style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                )),
              ),
            ],
          ),)
        ],
      ),
    );
  }

  void onTasbehClick()
  {
    setState(() {
      counter++;
      angle+=30.0;
      if(counter%33==0)
        {
          if(currentindex==TasbehList.length)
            {
              currentindex=0;
              counter=0;
            }
            else{
              currentindex++;
          }
        }
    });
  }
}

