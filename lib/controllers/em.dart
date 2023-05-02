// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class SideMenu extends StatelessWidget {
//   SideMenu({
//     Key? key,
//   }) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           const DrawerHeader(
//             child: Image.asset("assets/images/logo.png"),
//           ),
//           DrawerListTile(
//            title: "Dashboard",
//             svgSrc: "assets/icons/menu_dashbord.svg",
//             press: () {
//               key.currentState.closeDrawer();
//             },
//           ),
//           DrawerListTile(
//             title: const Text("Resident List"),
//             leading: const Icon(Icons.people),
//             onTap: () {
//               _key.currentState?.closeDrawer();
//             },
//           ),
//           DrawerListTile(
//             title: const Text("Evacuation Center"),
//             leading: const Icon(Icons.house),
//             onTap: () {
//               _key.currentState?.closeDrawer();
//             },
//           ),
//           const Divider(color: Colors.black),
//           DrawerListTile(
//             leading: const Icon(Icons.exit_to_app),
//             title: const Text(
//               "Logout",
//               style: TextStyle(color: Colors.white54),
//             ),
//             onTap: () {
//               FirebaseAuth.instance.signOut();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DrawerListTile extends StatelessWidget {
//   final String title;
//   final IconData iconData;
//   final Function onTap;

//   const DrawerListTile({super.key, required this.title, required this.iconData, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(iconData),
//       title: Text(title),
//       onTap: onTap as void Function()?,
//     );
//   }
// }

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