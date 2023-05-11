// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:collapsible_sidebar/collapsible_sidebar.dart';
// import 'package:watcher_web/screens/dashboard/dashboard_screen.dart';
// import 'package:watcher_web/screens/welcome/welcome_screen.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Widget contentWidget;
//   late Widget menuWidget;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   String _name = "";
//   String _email = "";

//   Future<void> getUserInfo() async {
//     final User? user = _auth.currentUser;
//     String? email = user?.email;
//     final DocumentSnapshot snapshot =
//         await firestore.collection('employee').doc(email).get();
//     setState(() {
//       _name = (snapshot.data() as dynamic)['name'];
//       _email = (snapshot.data() as dynamic)['email'];
//     });
//   }

//   @override
//   void initState() {
//     super.initState();

//     // Set the default content widget to display the dashboard page
//     contentWidget = const DashboardScreen();

//     // Define the menu widget with the options for the sidebar
//     menuWidget = CollapsibleSidebar(
//       items: [
//         CollapsibleItem(
//           text: 'Dashboard',
//           icon: Icons.dashboard,
//           onPressed: () {
//             setState(() {
//               contentWidget = const DashboardScreen();
//             });
//           },
//         ),
//         CollapsibleItem(
//             text: 'Evaluation',
//             icon: Icons.house,
//             onPressed: () => setState(() => 'Flutter')),
//         CollapsibleItem(
//             text: 'Lists',
//             icon: Icons.house,
//             onPressed: () => setState(() => 'Lists')),
//         CollapsibleItem(
//           text: 'Logout',
//           icon: Icons.logout,
//           onPressed: () {
//             FirebaseAuth.instance.signOut();
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const WelcomeScreen()),
//             );
//           },
//         ),
//       ],
//       body: contentWidget,
//       backgroundColor: Colors.white,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(20.0),
//             alignment: Alignment.centerLeft,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   _name,
//                   style: const TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 5.0),
//                 Text(
//                   _email,
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(child: menuWidget),
//         ],
//       ),
//     );
//   }
// }
