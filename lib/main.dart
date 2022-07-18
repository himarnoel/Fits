import 'package:fits/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Map<int, Color> color = const {
      50: Color(0xFF614FE0),
      100: Color(0xFF614FE0),
      200: Color(0xFF614FE0),
      300: Color(0xFF614FE0),
      400: Color(0xFF614FE0),
      500: Color(0xFF614FE0),
      600: Color(0xFF614FE0),
      700: Color(0xFF614FE0),
      800: Color(0xFF614FE0),
      900: Color(0xFF614FE0),
    };
    MaterialColor myColor = MaterialColor(0xFF614FE0, color);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(color: Colors.white),
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(textTheme),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: myColor,
        ),
        home: const Welcome());
  }
}
