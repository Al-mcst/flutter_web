import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:watcher_web/constants.dart';
import 'package:watcher_web/controllers/MenuAppController.dart';
import 'package:watcher_web/controllers/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        canvasColor: Colors.white,
      ),
      dark: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => MenuAppController(),
            ),
          ],
          child: const MainScreen(),
        ),
      ),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Admin Panel',
    //   theme: ThemeData.dark().copyWith(
    //     scaffoldBackgroundColor: bgColor,
    //     textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
    //         .apply(bodyColor: Colors.white),
    //     canvasColor: secondaryColor,
    //   ),
    //   home: MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider(
    //         create: (context) => MenuController(),
    //       ),
    //     ],
    //     child: MainScreen(),
    //   ),
    // );
  }
}
