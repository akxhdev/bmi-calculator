import 'package:bmi_calculator/pages/home_page/home_page.dart';
import 'package:bmi_calculator/pages/home_page/home_page_provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const appTitle = "BMI Calculator";

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightDynamic,
            textTheme: GoogleFonts.openSansTextTheme(),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkDynamic,
            textTheme: GoogleFonts.openSansTextTheme(
                ThemeData(brightness: Brightness.dark).textTheme),
          ),
          title: appTitle,
          home: ChangeNotifierProvider(
            create: (_) => HomePageProvider(),
            child: const HomePage(),
          ),
        );
      },
    );
  }
}
