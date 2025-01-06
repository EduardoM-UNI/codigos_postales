import 'package:codigos_postales/screens/home/home_page.dart';
import 'package:codigos_postales/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          foregroundColor: AppStyles.whiteColor,
          centerTitle: true,
        ),
      ),
      home: const Scaffold(
        body: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
