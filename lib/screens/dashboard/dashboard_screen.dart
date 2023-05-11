// import 'package:watcher_web/responsive.dart';
// import 'package:flutter/material.dart';
// import 'package:watcher_web/screens/dashboard/water_chart.dart';
// import 'package:watcher_web/screens/sidebar_screen.dart';
// import '../../constants.dart';

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Scaffold(
//       appBar: AppBar(
//           title: const Text('Watcher Dashboard'),
//           backgroundColor: Colors.black),
//       drawer: const SidebarScreen(),
//     );
//     return SafeArea(
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(defaultPadding),
//         child: Column(
//           children: [
//             WaterChart(),
//             const SizedBox(height: defaultPadding),
//             // Row(
//             //   crossAxisAlignment: CrossAxisAlignment.start,
//             //   children: [
//             //     Expanded(
//             //       flex: 5,
//             //       child: Column(
//             //         children: [
//             //           const MyFiles(),
//             //           const SizedBox(height: defaultPadding),
//             //           const RecentFiles(),
//             //           if (Responsive.isMobile(context))
//             //             const SizedBox(height: defaultPadding),
//             //           if (Responsive.isMobile(context)) const StarageDetails(),
//             //         ],
//             //       ),
//             //     ),
//             //     if (!Responsive.isMobile(context))
//             //       const SizedBox(width: defaultPadding),
//             //     // On Mobile means if the screen is less than 850 we dont want to show it
//             //     if (!Responsive.isMobile(context))
//             //       const Expanded(
//             //         flex: 2,
//             //         child: StarageDetails(),
//             //       ),
//             //   ],
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
