import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:watcher_web/screens/dashboard/dashboard.dart';
import 'package:watcher_web/screens/generate_qr/generate_qr.dart';
import 'package:watcher_web/screens/resident/user_list.dart';
import 'package:watcher_web/screens/welcome/welcome_screen.dart';

// class Screen extends StatelessWidget {
//   const Screen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Scaffold(
//       appBar: AppBar(
//           title: const Text('Watcher Dashboard'),
//           backgroundColor: Colors.black),
//       drawer: const SidebarScreen());
// }

class SidebarScreen extends StatefulWidget {
  const SidebarScreen({Key? key}) : super(key: key);
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<SidebarScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String _name = "";
  String _email = "";

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    final User? user = _auth.currentUser;
    String? email = user?.email;
    final DocumentSnapshot snapshot =
        await firestore.collection('employee').doc(email).get();
    setState(() {
      _name = (snapshot.data() as dynamic)['name'];
      _email = (snapshot.data() as dynamic)['email'];
    });
  }

  @override
  Widget build(BuildContext context) => Drawer(
          child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ]),
      ));

  Widget buildHeader(BuildContext context) => Container(
      color: Colors.blue,
      padding: EdgeInsets.only(
        top: 24 + MediaQuery.of(context).padding.top,
        bottom: 24,
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/watcher.png'),
                fit: BoxFit.cover,
              ),
            ),
            height: 100,
            width: 150,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              Text(_name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black)),
              //const SizedBox(height: 8),
              Text(_email,
                  style: const TextStyle(fontSize: 12, color: Colors.black)),
            ],
          )
        ],
      ));

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            // UserAccountsDrawerHeader(
            //     decoration: const BoxDecoration(
            //         color: Color.fromARGB(255, 255, 255, 255)),
            //     accountName:
            //         Text(_name, style: const TextStyle(color: Colors.black)),
            //     accountEmail:
            //         Text(_email, style: const TextStyle(color: Colors.black)),
            //     currentAccountPicture: const FlutterLogo()
            //     // const CircleAvatar(
            //     //   backgroundImage: NetworkImage("assets/images/watcher.png"),
            //     //   radius: 1,
            //     // ),
            //     ),
            ListTile(
                leading: const Icon(
                  Icons.dashboard,
                ),
                title: const Text('Dashboard'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DashboardScreen()));
                }),
            ListTile(
              leading: const Icon(
                Icons.edit_document,
              ),
              title: const Text('Resident List'),
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const UserListsScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.house,
              ),
              title: const Text('Evacuation Center'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.edit_document,
              ),
              title: const Text('Generate QR-Code'),
              onTap: () {
                //Navigator.of(context).push(MaterialPageRoute(
                // builder: (context) => const QRLocationWidget()));
              },
            ),
            const Divider(color: Colors.black),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                "Logout",
                // style: TextStyle(color: Colors.white54),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()),
                );
              },
            ),
          ],
        ),
      );
}
