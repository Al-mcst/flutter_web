import 'package:flutter/material.dart';
//import 'package:flutter_qr_code/qr_image.dart';
import 'package:watcher_web/screens/generate_qr/qr_image.dart';
import 'package:watcher_web/screens/sidebar_screen.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  GenerateQRCodeState createState() => GenerateQRCodeState();
}

class GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Generate QR-Code'),
    //     backgroundColor: Colors.black,
    //     centerTitle: true,
    //   ),
    // drawer: const SidebarScreen(),
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(
        //   width: 300.0,
        //   height: 100.0,
        //   child:
        ElevatedButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return const QRImage("Evacuation Barangay Hall");
                  }),
                ),
              );
            },
            child: const Text('Evacuation Barangay Hall')),
        //),
        const SizedBox(height: 20),
        // SizedBox(
        //     width: 300.0,
        //     height: 100.0,
        //child:
        ElevatedButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return const QRImage("Evacuation School");
                  }),
                ),
              );
            },
            child: const Text('Evacuation School'))
        //),
      ],
    );
  }
}
