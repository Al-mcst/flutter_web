import 'package:flutter/material.dart';
import 'package:watcher_web/screens/dashboard/water_chart.dart';
import 'package:watcher_web/screens/sidebar_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: const Text('Watcher Dashboard'),
            backgroundColor: Colors.black),
        drawer: const SidebarScreen(),
        body: WaterChart(),
      );
}
