import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watcher_web/constants.dart';
import 'package:watcher_web/controllers/main_screen.dart';
import 'package:watcher_web/controllers/side.dart';
import 'package:watcher_web/controllers/sidemenu.dart';
import 'package:watcher_web/controllers/sidebar.dart';
import 'package:watcher_web/controllers/MenuAppController.dart';
import 'package:watcher_web/controllers/sidebar_screen.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watcher Admin Panel',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: const Color.fromARGB(255, 0, 0, 0)),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
        ],
        child: const MainScreen(),
      ),
    );
  }
}
