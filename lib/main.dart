//import 'dart:async';

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:prac_1/settings.dart';
import 'package:prac_1/timermodel.dart';

import './timer.dart';

import 'settings.dart';


import 'package:flutter/material.dart';

import 'package:prac_1/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
void main() => runApp(MyApp());
 final double defaultPadding = 5.0;
 final countDownTimer timer=countDownTimer();
 
class MyApp extends StatelessWidget {


    MyApp({Key? key}) : super(key: key);

@override
 Widget build(BuildContext context) {
    
 return MaterialApp(
 title: 'My Work Timer',
 theme: ThemeData(
 primarySwatch: Colors.blueGrey,
 ),
 home: TimerHomePage(),
 );}
}

/*class TimerHomePage extends StatelessWidget {
  
  const TimerHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem<String>> menuItems=
    <PopupMenuItem<String>>[];
    menuItems.add(PopupMenuItem(
      value: 'Settings',
      child: Text('Settings'),
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text("My work timer"),
        actions: [PopupMenuButton<String>(itemBuilder: (BuildContext context){//make popup button show on screen
          return menuItems.toList();
        },
        onSelected: (s){
          if(s=='Settings'){
            goToSettings(context);
          }
        },
        )],
        
      ),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        final double availableWidth=constraints.maxWidth;
        return  Column(
        children: [Row(
          children: [Padding(padding: EdgeInsets.all(defaultPadding)),
          Expanded(child: ProductivityButton(color: Color(0xff009688), text: "Work", onPressed: EmptyMethod)),
          Padding(padding: EdgeInsets.all(defaultPadding)),
          Expanded(child: ProductivityButton(color: Color(0xff607D8B), text: "Short Break", onPressed: () => timer.startBreak(true))),
          Padding(padding: EdgeInsets.all(defaultPadding)),
          Expanded(child: ProductivityButton(color: Color(0xff455A64), text: "Long Break", onPressed: () => timer.startBreak(false))),
           Padding(padding: EdgeInsets.all(defaultPadding),),
],
        ),
         StreamBuilder(initialData:'00:00',
        stream:timer.stream(),
        builder:(BuildContext context, AsyncSnapshot snapshot){
          timerModel timer=(snapshot.data=='00:00')? timerModel('00:00',1)
          :snapshot.data;
          return  Expanded(child: CircularPercentIndicator(radius: availableWidth/2,
        lineWidth: 10.0,
        percent: timer.percent,
        center: Text(timer.time, style: Theme.of(context).textTheme.bodyText1),
        progressColor: Color(0xff009688),));
        }),
        
       
        
        Row(children: [Padding(padding: EdgeInsets.all(defaultPadding)),
        Expanded(child: ProductivityButton(color: Color (0xff212121), text: "Stop", onPressed: () =>timer.stopTimer())),
        Padding(padding: EdgeInsets.all(defaultPadding)),
         Expanded(child: ProductivityButton(color: Color (0xff009688), text: "Restart", onPressed: () => timer.startTimer())),
        ],)],
      );

      })
     
    );
  }
}*/
class TimerHomePage extends StatefulWidget {
  const TimerHomePage({ Key? key }) : super(key: key);
  
  @override
  _TimerHomePageState createState() => _TimerHomePageState();
}

class _TimerHomePageState extends State<TimerHomePage> {
 @override
  void initState() {
    // TODO: implement initState
      timer.startWork();
  }
  @override
  Widget build(BuildContext context) {
   final List<PopupMenuItem<String>> menuItems=
    <PopupMenuItem<String>>[];
    menuItems.add(PopupMenuItem(
      value: 'Settings',
      child: Text('Settings'),
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text("My work timer"),
        actions: [PopupMenuButton<String>(itemBuilder: (BuildContext context){//make popup button show on screen
          return menuItems.toList();
        },
        onSelected: (s){
          if(s=='Settings'){
            goToSettings(context);
          }
        },
        )],
        
      ),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        final double availableWidth=constraints.maxWidth;
        return  Column(
        children: [Row(
          children: [Padding(padding: EdgeInsets.all(defaultPadding)),
          Expanded(child: ProductivityButton(color: Color(0xff009688), text: "Work", onPressed: EmptyMethod)),
          Padding(padding: EdgeInsets.all(defaultPadding)),
          Expanded(child: ProductivityButton(color: Color(0xff607D8B), text: "Short Break", onPressed: () => timer.startBreak(true))),
          Padding(padding: EdgeInsets.all(defaultPadding)),
          Expanded(child: ProductivityButton(color: Color(0xff455A64), text: "Long Break", onPressed: () => timer.startBreak(false))),
           Padding(padding: EdgeInsets.all(defaultPadding),),
],
        ),
         StreamBuilder(initialData:'00:00',
        stream:timer.stream(),
        builder:(BuildContext context, AsyncSnapshot snapshot){
          timerModel timer=(snapshot.data=='00:00')? timerModel('00:00',1)
          :snapshot.data;
          return  Expanded(child: CircularPercentIndicator(radius: availableWidth/2,
        lineWidth: 10.0,
        percent: timer.percent,
        center: Text(timer.time, style: Theme.of(context).textTheme.bodyText1),
        progressColor: Color(0xff009688),));
        }),
        
       
        
        Row(children: [Padding(padding: EdgeInsets.all(defaultPadding)),
        Expanded(child: ProductivityButton(color: Color (0xff212121), text: "Stop", onPressed: () =>timer.stopTimer())),
        Padding(padding: EdgeInsets.all(defaultPadding)),
         Expanded(child: ProductivityButton(color: Color (0xff009688), text: "Restart", onPressed: () => timer.startTimer())),
        ],)],
      );

      })
     
    );
  
  }
}
void EmptyMethod(){}
void goToSettings(BuildContext context)
{
Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
}
