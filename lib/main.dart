import 'package:flutter/material.dart';
import 'ui/home.dart';
final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    backgroundColor: Colors.pinkAccent.shade100,
    scaffoldBackgroundColor: Colors.redAccent.shade50,
    primaryColor: Colors.pink,
    accentColor: Colors.amberAccent.shade100,
     textTheme: _appTextTheme(base.textTheme)

  );
}
TextTheme _appTextTheme(TextTheme base){
  return base.copyWith(
    headline1: base.headline1.copyWith(
      fontWeight: FontWeight.w500
    ),
    headline6: base.headline6.copyWith(
      fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w300,
      fontSize: 14.0
    ),
    button: base.button.copyWith(
      letterSpacing: 3.0,color: Colors.orange.shade100,fontSize: 18,fontWeight: FontWeight.bold
    ),
    bodyText1: base.bodyText1.copyWith(
      fontFamily: "Lobster",
      fontSize: 17.0,
      color: Colors.brown
    )
  ).apply(
    fontFamily: "Lobster",
    displayColor: Colors.amber,
    bodyColor: Colors.redAccent
  );
}

void main() {
  runApp(MaterialApp(
    home: QuizApp(),
   theme: _appTheme,
   /* theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.pinkAccent[800],
     textTheme: TextTheme(
       // headline1: TextStyle(
         // fontSize: 34,
          //fontWeight: FontWeight.bold
        //),
        bodyText1: TextStyle(
          fontSize: 45
        )

      ),


    ),*/
  ));
}



