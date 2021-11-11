

import 'package:flutter/material.dart';
import 'package:prac_1/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Settings());
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController txtWork=TextEditingController();
   TextEditingController txtShort = TextEditingController();
    TextEditingController txtLong = TextEditingController();
  static const String WORKTIME = "workTime";
  static const String SHORTBREAK = "shortBreak";
  static const String LONGBREAK = "longBreak";
  late int workTime;
  late int shortBreak;
  late int longBreak;
  late SharedPreferences preferences;
  

  TextStyle textStyle = TextStyle(fontSize: 24);

  @override
  void initState() {
    TextEditingController txtWork = TextEditingController();
    TextEditingController txtShort = TextEditingController();
    TextEditingController txtLong = TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: <Widget>[
          Text(
            "Work",
            style: textStyle,
          ),
          Text(""),
          Text(""),
          SettingsButton(Color(0xff455A64), "-", -1, WORKTIME, updateSettings, 2.0),
          
          TextField(
            controller: txtWork,
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          SettingsButton(
            Color(0xff009688),
            "+",
            1,WORKTIME,updateSettings,2.0
          ),
          Text("Short", style: textStyle),
          Text(""),
          Text(""),
          SettingsButton(
            Color(0xff455A64),
            "-",
            -1,SHORTBREAK,updateSettings,2.0
          ),
          TextField(
              controller: txtShort,
              style: textStyle,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number),
          SettingsButton(Color(0xff009688), "+", 1,SHORTBREAK,updateSettings,2.0),
          Text(
            "Long",
            style: textStyle,
          ),
          Text(""),
          Text(""),
          SettingsButton(
            Color(0xff455A64),
            "-",
            -1,LONGBREAK,updateSettings,2.0
          ),
          TextField(
              controller: txtLong,
              style: textStyle,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number),
          SettingsButton(
            Color(0xff009688),
            "+",
            1,LONGBREAK,updateSettings,2.0
          ),
        ],
        padding: const EdgeInsets.all(20.0),
      ),
    );
  }

  readSettings() async {
    preferences = await SharedPreferences.getInstance();
    int? workTime = preferences.getInt(WORKTIME);
    if(workTime==null){
      await preferences.setInt(WORKTIME,int.parse('30'));
    }
    int? shortBreak = preferences.getInt(SHORTBREAK);
    if(shortBreak==null){
      await preferences.setInt(SHORTBREAK,int.parse('5'));
    }
    int? longBreak = preferences.getInt(LONGBREAK);
     if(longBreak==null){
      await preferences.setInt(LONGBREAK,int.parse('5'));
    }
    setState(() {
      txtWork.text = workTime.toString();
      txtShort.text = shortBreak.toString();
      txtLong.text = longBreak.toString();
    });
  }

  void updateSettings(String key, int value) {
    switch (key) {
      case WORKTIME:
        {
          // int workTime = preferences.getInt(WORKTIME);
          workTime += value;
          if (workTime >= 1 && workTime <= 180) {
            preferences.setInt(WORKTIME, workTime);
            setState(() {
              txtWork.text = workTime.toString();
            });
          }
        }
        break;

      case SHORTBREAK:
        {
          // int short = preferences.getInt(SHORTBREAK);
          shortBreak += value;
          if (shortBreak >= 1 && shortBreak <= 120) {
            preferences.setInt(SHORTBREAK, shortBreak);
            setState(() {
              txtShort.text = shortBreak.toString();
            });
          }
        }
        break;
      case LONGBREAK:
        {
          // int long = preferences.getInt(LONGBREAK);
          longBreak += value;
          if (longBreak >= 1 && longBreak <= 180) {
            preferences.setInt(LONGBREAK, longBreak);
            setState(() {
              txtLong.text = longBreak.toString();
            });
          }
        }
    }
  }
}
