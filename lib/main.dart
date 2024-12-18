import 'package:codigos_postales/screens/web/web_view.dart';
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
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Códigos Postales"),
          leading: const Icon(
            Icons.menu,
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  AppStyles.raspberryColor,
                  AppStyles.kleinBlueColor
                ])),
          ),
        ),
        body: WebView(urlString: "https://www.google.com.pe/?hl=es"),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
