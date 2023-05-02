import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:watcher_web/screens/welcome/welcome_screen.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key, required String title}) : super(key: key);
  @override
  SidebarState createState() => SidebarState();
}

const primaryColor = Color(0xFF6252DA);
const canvasColor = Color.fromARGB(255, 161, 161, 219);
const scaffoldBackgroundColor = Color(0xFF7777B6);

class SidebarState extends State<Sidebar> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    title: const Text('Admin Dashboard'),
                    leading: IconButton(
                      onPressed: () {
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: SidebarScreen(
              controller: _controller,
            ),
            body: Row(
              children: [
                if (!isSmallScreen) SidebarScreen(controller: _controller),
                Expanded(
                    child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      switch (_controller.selectedIndex) {
                        case 0:
                          _key.currentState?.closeDrawer();
                          return const Center(
                            child: Text(
                              'Dashboard',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          );
                        case 1:
                          _key.currentState?.closeDrawer();
                          return const Center(
                            child: Text(
                              'Resident List',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          );
                        case 2:
                          _key.currentState?.closeDrawer();
                          return const Center(
                            child: Text(
                              'Evacuation Center',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40),
                            ),
                          );
                        case 3:
                          _key.currentState?.closeDrawer();
                          return Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const WelcomeScreen()),
                                        (route) => false);
                                  })
                                ]),
                          );

                        default:
                          return const Center(
                            child: Text(
                              'Dashboard',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          );
                      }
                    },
                  ),
                ))
              ],
            ));
      }),
    );
  }
}

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({Key? key, required SidebarXController controller})
      : _controller = controller,
        super(key: key);
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    const SizedBox(
      height: 100.0,
    );
    return SidebarX(
      controller: _controller,
      theme: const SidebarXTheme(
        decoration: BoxDecoration(
            color: canvasColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedTextStyle: TextStyle(color: Colors.white),
      ),
      extendedTheme: const SidebarXTheme(width: 250),
      footerDivider: Divider(color: Colors.white.withOpacity(0.8), height: 5),
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: SvgPicture.asset(
            "assets/icons/chat.svg",
          ),
        );
      },
      items: const [
        SidebarXItem(
          icon: Icons.dashboard,
          label: '  Dashboard',
        ),
        SidebarXItem(icon: Icons.list, label: '  Resident List'),
        SidebarXItem(icon: Icons.house, label: '  Evacuation Center'),
        SidebarXItem(icon: Icons.exit_to_app, label: '  Signout'),
      ],
    );
  }
}
