// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:watcher_web/controllers/MenuAppController.dart';
// import 'package:watcher_web/controllers/sidemenu.dart';
// import 'package:watcher_web/responsive.dart';
// import 'sidebar.dart';
// import 'package:watcher_web/screens/dashboard/dashboard_screen.dart';
// import 'package:watcher_web/screens/welcome/welcome_screen.dart';
// import 'package:watcher_web/screens/resident/resident_screen.dart';
// import 'package:watcher_web/screens/evacuation/evacuation_screen.dart';

// class SidebarScreen extends StatelessWidget {
//   const SidebarScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: context.read<MenuAppController>().scaffoldKey,
//       drawer: const Sidebar(),
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // We want this side menu only for large screen
//             if (Responsive.isDesktop(context))
//               const Expanded(
//                 child: Sidebar(),
//               ),
//             const Expanded(
//               flex: 4,
//               child: DashboardScreen(),
//             ),
//             // const Expanded(
//             //   flex: 4,
//             //   child: ResidentScreen(),
//             // ),
//             // const Expanded(
//             //   flex: 4,
//             //   child: EvacuationScreen(),
//             // ),
//             // const Expanded(
//             //   flex: 4,
//             //   child: WelcomeScreen(),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // import 'package:watcher_web/responsive.dart';
// // import 'sidebar.dart';
// // import 'package:watcher_web/screens/dashboard/dashboard_screen.dart';
// // import 'package:watcher_web/screens/welcome/welcome_screen.dart';
// // import 'package:watcher_web/screens/resident/resident_screen.dart';
// // import 'package:watcher_web/screens/evacuation/evacuation_screen.dart';

// // class SidebarScreen extends StatelessWidget {
// //   const SidebarScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('My Dashboard'),
// //       ),
// //       drawer: const Sidebar(),
// //       body: const Center(
// //         child: Sidebar(),
// //       ),
// //       // key: context.read<MenuAppController>().scaffoldKey,
// //       // drawer: const Sidebar(),
// //       // body: SafeArea(
// //       //   child: Row(
// //       //     crossAxisAlignment: CrossAxisAlignment.start,
// //       //     children: [
// //       //       // We want this side menu only for large screen
// //       //       if (Responsive.isDesktop(context))
// //       //         const Expanded(
// //       //           child: Sidebar(),
// //       //         ),
// //       //       const Expanded(
// //       //         flex: 4,
// //       //         child: DashboardScreen(),
// //       //       ),

// //       //     ],
// //       //   ),
// //       // ),
// //     );
// //   }
// // }
