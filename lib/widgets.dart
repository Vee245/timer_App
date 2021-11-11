import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductivityButton extends StatelessWidget {
  final Color? color;
  final String text;
  final double? size;
  final VoidCallback? onPressed;

 ProductivityButton({@required this.color,required this.text,@required this.size,@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: this.onPressed,
      color: this.color,
      minWidth: this.size,
      
    );
  }
}
typedef CallbackSetting = void Function(String, int);
class SettingsButton extends StatelessWidget {
  
  final Color color;
final String text;
final int value;
final double size;
final String setting;
final CallbackSetting callback;

SettingsButton(@required this.color, @required this.text,@required this.value,@required this.setting, @required this.callback, @required this.size);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(this.text,
      style: TextStyle(color: Colors.white),
      ),
      onPressed: () =>this.callback(this.setting,this.value),
      color: this.color,
      minWidth: this.size,
    );
  }
}