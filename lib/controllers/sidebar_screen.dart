import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watcher_web/controllers/MenuAppController.dart';
import 'package:watcher_web/responsive.dart';
import 'sidebar.dart';
import 'package:watcher_web/screens/dashboard/dashboard_screen.dart';
//import 'package:watcher_web/screens/PDRRMO/employee_screen.dart';
import 'package:watcher_web/screens/resident/resident_screen.dart';
import 'package:watcher_web/screens/evacuation/evacuation_screen.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
            //
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: ResidentScreen(),
            ),
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: EvacuationScreen(),
            ),
            // const Expanded(
            //   // It takes 5/6 part of the screen
            //   flex: 5,
            //   child: LogoutScreen(),
            // ),
          ],
        ),
      ),
    );
  }
}
