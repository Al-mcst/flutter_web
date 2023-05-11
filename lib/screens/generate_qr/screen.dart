import 'package:flutter/material.dart';
import 'package:watcher_web/controllers/background.dart';
import 'package:watcher_web/responsive.dart';
import 'package:watcher_web/screens/generate_qr/user_count.dart';
import 'package:watcher_web/screens/generate_qr/qr_code.dart';
import 'package:watcher_web/screens/sidebar_screen.dart';

class Screens extends StatelessWidget {
  const Screens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR-Code'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      drawer: const SidebarScreen(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Expanded(
            child: UserEvacuationCount(),
          ),
          const SizedBox(height: 500),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 450,
                  child: GenerateQRCode(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
