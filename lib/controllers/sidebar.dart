// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:watcher_web/screens/welcome/welcome_screen.dart';

// // class Sidebar extends StatefulWidget {
// //   const Sidebar({super.key});

// //   @override
// //   _SidebarState createState() => _SidebarState();
// // }

// // class _SidebarState extends State<Sidebar> {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// //   FirebaseFirestore firestore = FirebaseFirestore.instance;
// //   String _name = "";
// //   String _email = "";

// //   @override
// //   void initState() {
// //     super.initState();
// //     getUserInfo();
// //   }

// //   Future<void> getUserInfo() async {
// //     final User? user = _auth.currentUser;
// //     String? email = user?.email;
// //     final DocumentSnapshot snapshot =
// //         await firestore.collection('employee').doc(email).get();
// //     setState(() {
// //       _name = (snapshot.data() as dynamic)['name'];
// //       _email = (snapshot.data() as dynamic)['email'];
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Drawer(
// //       child: ListView(
// //         children: [
// //           UserAccountsDrawerHeader(
// //               decoration: const BoxDecoration(
// //                   color: Color.fromARGB(255, 255, 255, 255)),
// //               accountName:
// //                   Text(_name, style: const TextStyle(color: Colors.black)),
// //               accountEmail:
// //                   Text(_email, style: const TextStyle(color: Colors.black)),
// //               currentAccountPicture: const FlutterLogo()
// //               // const CircleAvatar(
// //               //   backgroundImage: NetworkImage("assets/images/watcher.png"),
// //               //   radius: 1,
// //               // ),
// //               ),
// //           // DrawerHeader(
// //           //   child: Image.asset("assets/images/logo.png"),
// //           // ),
// //           DrawerListTile(
// //             title: "Dashboard",
// //             svgSrc: "assets/icons/menu_dashbord.svg",
// //             press: () {
// //               Navigator.pop(context);
// //             },
// //           ),
// //           DrawerListTile(
// //             title: "Resident List",
// //             svgSrc: "assets/icons/menu_task.svg",
// //             press: () {
// //               Navigator.pop(context);
// //             },
// //           ),
// //           DrawerListTile(
// //             title: "Evacuation",
// //             svgSrc: "assets/icons/menu_doc.svg",
// //             press: () {
// //               Navigator.pop(context);
// //             },
// //           ),
// //           DrawerListTile(
// //             title: "Sign Out",
// //             svgSrc: "assets/icons/menu_store.svg",
// //             press: () {
// //               FirebaseAuth.instance.signOut();
// //               Navigator.pushReplacement(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => const WelcomeScreen()),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class DrawerListTile extends StatelessWidget {
// //   const DrawerListTile({
// //     Key? key,
// //     // For selecting those three line once press "Command+D"
// //     required this.title,
// //     required this.svgSrc,
// //     required this.press,
// //   }) : super(key: key);

// //   final String title, svgSrc;
// //   final VoidCallback press;

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListTile(
// //       onTap: press,
// //       horizontalTitleGap: 0.0,
// //       leading: SvgPicture.asset(
// //         svgSrc,
// //         color: Colors.white54,
// //         height: 16,
// //       ),
// //       title: Text(
// //         title,
// //         style: const TextStyle(color: Colors.white54),
// //       ),
// //     );
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:watcher_web/screens/dashboard/dashboard_screen.dart';
// import 'package:watcher_web/screens/welcome/welcome_screen.dart';

// class Sidebar extends StatefulWidget {
//   const Sidebar({super.key});

//   @override
//   _SidebarState createState() => _SidebarState();
// }

// class _SidebarState extends State<Sidebar> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   String _name = "";
//   String _email = "";

//   @override
//   void initState() {
//     super.initState();
//     getUserInfo();
//   }

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
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           UserAccountsDrawerHeader(
//               decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 255, 255, 255)),
//               accountName:
//                   Text(_name, style: const TextStyle(color: Colors.black)),
//               accountEmail:
//                   Text(_email, style: const TextStyle(color: Colors.black)),
//               currentAccountPicture: const FlutterLogo()
//               // const CircleAvatar(
//               //   backgroundImage: NetworkImage("assets/images/watcher.png"),
//               //   radius: 1,
//               // ),
//               ),
//           ListTile(
//             leading: const Icon(
//               Icons.dashboard,
//             ),
//             title: const Text('Dashboard'),
//             onTap: () {
//               setState(() {
//                 const DashboardScreen();
//               });
//             },
//           ),
//           ListTile(
//             leading: const Icon(
//               Icons.edit_document,
//             ),
//             title: const Text('Resident List'),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const DashboardScreen()),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(
//               Icons.house,
//             ),
//             title: const Text('Evacuation Center'),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const DashboardScreen()),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.exit_to_app),
//             title: const Text(
//               "Logout",
//               // style: TextStyle(color: Colors.white54),
//             ),
//             onTap: () {
//               FirebaseAuth.instance.signOut();
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const WelcomeScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:watcher_web/screens/welcome/welcome_screen.dart';

// // class Sidebar extends StatefulWidget {
// //   const Sidebar({super.key});

// //   @override
// //   _SidebarState createState() => _SidebarState();
// // }

// // class _SidebarState extends State<Sidebar> {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// //   FirebaseFirestore firestore = FirebaseFirestore.instance;
// //   String _name = "";
// //   String _email = "";

// //   @override
// //   void initState() {
// //     super.initState();
// //     getUserInfo();
// //   }

// //   Future<void> getUserInfo() async {
// //     final User? user = _auth.currentUser;
// //     String? email = user?.email;
// //     final DocumentSnapshot snapshot =
// //         await firestore.collection('employee').doc(email).get();
// //     setState(() {
// //       _name = (snapshot.data() as dynamic)['name'];
// //       _email = (snapshot.data() as dynamic)['email'];
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Drawer(
// //       child: Column(
// //         children: [
// //           Container(
// //             decoration: const BoxDecoration(
// //               image: DecorationImage(
// //                 image: AssetImage('assets/images/watcher.png'),
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //             height: 200,
// //             child: Center(
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text(
// //                     _name,
// //                     style: const TextStyle(
// //                       fontSize: 24,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 8),
// //                   Text(
// //                     _email,yy
// //                     style: const TextStyle(
// //                       fontSize: 16,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           // child: ListView(
// //           //   padding: EdgeInsets.zero,
// //           //   children: [
// //           //     UserAccountsDrawerHeader(
// //           //       decoration:
// //           //           const BoxDecoration(color: Color.fromARGB(255, 243, 243, 243)),
// //           //       accountName:
// //           //           Text(_name, style: const TextStyle(color: Colors.black)),
// //           //       accountEmail:
// //           //           Text(_email, style: const TextStyle(color: Colors.black)),
// //           //       currentAccountPicture: const CircleAvatar(
// //           //           backgroundImage: AssetImage("assets/images/watcher.png")),
// //           //     ),
// //           ListTile(
// //             leading: const Icon(
// //               Icons.dashboard,
// //             ),
// //             title: const Text('Dashboard'),
// //             onTap: () {
// //               Navigator.pop(context);
// //             },
// //           ),
// //           ListTile(
// //             leading: const Icon(
// //               Icons.edit_document,
// //             ),
// //             title: const Text('Resident List'),
// //             onTap: () {
// //               Navigator.pop(context);
// //             },
// //           ),
// //           ListTile(
// //             leading: const Icon(
// //               Icons.house,
// //             ),
// //             title: const Text('Evacuation Center'),
// //             onTap: () {
// //               Navigator.pop(context);
// //             },
// //           ),
// //           // const AboutListTile(
// //           //   // <-- SEE HERE
// //           //   icon: Icon(
// //           //     Icons.qr_code,
// //           //   ),
// //           //   applicationIcon: Icon(
// //           //     Icons.qr_code,
// //           //   ),
// //           //   applicationName: 'My Cool App',
// //           //   applicationVersion: '1.0.25',
// //           //   applicationLegalese: '© 2019 Company',
// //           //   aboutBoxChildren: [
// //           //     ///Content goes here...
// //           //   ],
// //           //   child: Text('Qr-Code'),
// //           // ),
// //           ListTile(
// //             leading: const Icon(Icons.exit_to_app),
// //             title: const Text(
// //               "Logout",
// //               // style: TextStyle(color: Colors.white54),
// //             ),
// //             onTap: () {
// //               FirebaseAuth.instance.signOut();
// //               Navigator.pushReplacement(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => const WelcomeScreen()),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }



// // class DrawerListTile extends StatelessWidget {
// //   const DrawerListTile({
// //     Key? key,
// //     // For selecting those three line once press "Command+D"
// //     required this.title,
// //     required this.svgSrc,
// //     required this.press,
// //   }) : super(key: key);

// //   final String title, svgSrc;
// //   final VoidCallback press;

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListTile(
// //       onTap: press,
// //       horizontalTitleGap: 0.0,
// //       leading: SvgPicture.asset(
// //         svgSrc,
// //         color: Colors.white54,
// //         height: 16,
// //       ),
// //       title: Text(
// //         title,
// //         style: TextStyle(color: Colors.white54),
// //       ),
// //     );
// //   }
// // }

// // class DrawerListTile extends StatelessWidget {
// //   const DrawerListTile({
// //     Key? key,
// //     // For selecting those three line once press "Command+D"
// //     required this.title,
// //     required this.svgSrc,
// //     required this.press,
// //   }) : super(key: key);

// //   final String title, svgSrc;
// //   final VoidCallback press;

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListTile(
// //       onTap: press,
// //       horizontalTitleGap: 0.0,
// //       leading: SvgPicture.asset(
// //         svgSrc,
// //         color: Colors.white54,
// //         height: 16,
// //       ),
// //       title: Text(
// //         title,
// //         style: TextStyle(color: Colors.white54),
// //       ),
// //     );
// //   }
// // }