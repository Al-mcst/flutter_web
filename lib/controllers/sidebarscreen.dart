import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:watcher_web/screens/welcome/welcome_screen.dart';
import 'package:watcher_web/screens/dashboard/dashboard_screen.dart';

class SidebarScreen extends StatefulWidget {
  const SidebarScreen({super.key});

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
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255)),
              accountName:
                  Text(_name, style: const TextStyle(color: Colors.black)),
              accountEmail:
                  Text(_email, style: const TextStyle(color: Colors.black)),
              currentAccountPicture: const FlutterLogo()
              // const CircleAvatar(
              //   backgroundImage: NetworkImage("assets/images/watcher.png"),
              //   radius: 1,
              // ),
              ),
          ListTile(
              leading: const Icon(
                Icons.dashboard,
              ),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
                const DashboardScreen();
              }),
          ListTile(
            leading: const Icon(
              Icons.edit_document,
            ),
            title: const Text('Resident List'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DashboardScreen()));
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
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
