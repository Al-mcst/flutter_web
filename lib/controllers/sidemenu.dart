// import 'package:collapsible_sidebar/collapsible_sidebar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:watcher_web/screens/dashboard/dashboard_screen.dart';
// import 'package:watcher_web/screens/auth/firebase_auth_service.dart';

// import '../screens/welcome/welcome_screen.dart';

// class SideMenu extends StatelessWidget {
//   const SideMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Collapse Sidebar',
//       home: Scaffold(
//         body: SidebarPage(),
//       ),
//     );
//   }
// }

// class SidebarPage extends StatefulWidget {
//   const SidebarPage({super.key});

//   @override
//   _SidebarPageState createState() => _SidebarPageState();
// }

// class _SidebarPageState extends State<SidebarPage> {
//   late List<CollapsibleItem> _items;
//   late String _headline;
//   final AssetImage _avatarImg = const AssetImage('assets/images/watcher.png');

//   @override
//   void initState() {
//     super.initState();
//     _items = _generateItems;
//     _headline = _items.firstWhere((item) => item.isSelected).text;
//   }

//   List<CollapsibleItem> get _generateItems {
//     return [
//       CollapsibleItem(
//         text: 'Dashboard',
//         icon: Icons.school_outlined,
//         onPressed: () {
//           Navigator.pop(context);
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const DashboardScreen()),
//           );
//         },
//         isSelected: true,
//       ),
//       CollapsibleItem(
//         text: 'Lists',
//         icon: Icons.flutter_dash_outlined,
//         onPressed: () => setState(() => _headline = 'Flutter'),
//       ),
//       CollapsibleItem(
//         text: 'Evacuation',
//         icon: Icons.html_outlined,
//         onPressed: () => setState(() => _headline = 'HTML'),
//       ),
//       CollapsibleItem(
//         text: 'Signout',
//         icon: Icons.css_outlined,
//         onPressed: () {
//           FirebaseAuth.instance.signOut();
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const WelcomeScreen()),
//           );
//         },
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: CollapsibleSidebar(
//         isCollapsed: MediaQuery.of(context).size.width <= 800,
//         items: _items,
//         avatarImg: _avatarImg,
//         title: 'Admin Dashboard',
//         onTitleTap: () {
//           ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Watcher Admin Panel')));
//         },
//         body: _body(size, context),
//         selectedIconBox: Colors.transparent,
//         unselectedTextColor: Colors.white,
//         unselectedIconColor: Colors.white,
//         backgroundColor: const Color.fromARGB(255, 44, 129, 47),
//         selectedTextColor: const Color.fromARGB(255, 65, 68, 255),
//         textStyle: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
//         titleStyle: const TextStyle(
//             fontSize: 20,
//             fontStyle: FontStyle.italic,
//             fontWeight: FontWeight.bold),
//         toggleTitleStyle:
//             const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         sidebarBoxShadow: const [
//           BoxShadow(
//             color: Color.fromARGB(255, 63, 181, 171),
//             blurRadius: 20,
//             spreadRadius: 0.01,
//             offset: Offset(3, 3),
//           ),
//           BoxShadow(
//             color: Color.fromARGB(255, 77, 240, 83),
//             blurRadius: 50,
//             spreadRadius: 0.01,
//             offset: Offset(3, 3),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _body(Size size, BuildContext context) {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       color: const Color.fromARGB(255, 255, 255, 255),
//       child: Center(
//         child: Text(
//           _headline,
//           style: Theme.of(context).textTheme.displayMedium,
//           overflow: TextOverflow.visible,
//           softWrap: false,
//         ),
//       ),
//     );
//   }
// }



// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:fluttersidebar_app/Home.dart';
// // import 'package:fluttersidebar_app/Profile.dart';
// // import 'package:fluttersidebar_app/Settings.dart';
// // import 'package:watcher_web/screens/dashboard/dashboard_screen.dart';

// // void main() => runApp(MyApp());

// // class MyApp extends StatefulWidget {
// //   @override
// //   _MyAppState createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   int index = 0;
// //   List<Widget> list = [
// //     const DashboardScreen(),
// //   ];
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Colors.red,
// //           title: Text('Side Bar'),
// //         ),
// //         body: list[index],
// //         drawer: MyDrawer(),
// //       ),
// //     );
// //   }
// // }

// // class MyDrawer extends StatelessWidget {
// //   final Function onTap;

// //   MyDrawer({this.onTap});
// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       width: MediaQuery.of(context).size.width * 0.8,
// //       child: Drawer(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: <Widget>[
// //             DrawerHeader(
// //               decoration: BoxDecoration(color: Colors.red),
// //               child: Padding(
// //                 padding: EdgeInsets.all(8),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   mainAxisAlignment: MainAxisAlignment.end,
// //                   children: <Widget>[
// //                     Container(
// //                       width: 70,
// //                       height: 70,
// //                       child: CircleAvatar(
// //                         backgroundImage: NetworkImage(
// //                             'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70'),
// //                       ),
// //                     ),
// //                     SizedBox(
// //                       height: 15,
// //                     ),
// //                     Text(
// //                       'Mr.John',
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         fontWeight: FontWeight.w800,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                     SizedBox(
// //                       height: 2,
// //                     ),
// //                     Text(
// //                       'John300@gmail.com',
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 12,
// //                       ),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             ListTile(
// //               leading: Icon(Icons.home),
// //               title: Text('Home'),
// //               onTap: () => onTap(context, 0),
// //             ),
// //             ListTile(
// //               leading: Icon(Icons.person),
// //               title: Text('Profile'),
// //               onTap: () => onTap(context, 0),
// //             ),
// //             ListTile(
// //               leading: Icon(Icons.phone),
// //               title: Text('Phone'),
// //               onTap: () => onTap(context, 0),
// //             ),
// //             ListTile(
// //               leading: Icon(Icons.settings),
// //               title: Text('Settings'),
// //               onTap: () => onTap(context, 0),
// //             ),
// //             Divider(
// //               height: 1,
// //             ),
// //             ListTile(
// //               leading: Icon(Icons.exit_to_app),
// //               title: Text('Logout'),
// //               onTap: () => onTap(context, 0),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
