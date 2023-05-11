// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class QrCodePage extends StatefulWidget {
//   const QrCodePage({super.key});

//   @override
//   QrCodePageState createState() => QrCodePageState();
// }

// class QrCodePageState extends State<QrCodePage> {
//   final String _text1 = 'First QR code text';
//   final String _text2 = 'Second QR code text';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('QR Codes'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             QrImage(
//               data: "chool",
//               size: 200,
//             ),
//             const SizedBox(height: 20),
//             QrImage(
//               data: "NidaBagon",
//               size: 200,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               child: const Text('Save to Firestore'),
//               onPressed: () async {
//                 // Get the current user's email
//                 final User user = FirebaseAuth.instance.currentUser!;
//                 final String email = user.email!;

//                 // Save the QR code texts to Firestore
//                 await FirebaseFirestore.instance
//                     .collection('user')
//                     .doc(email)
//                     .set({
//                   'qr_text_1': _text1,
//                   'qr_text_2': _text2,
//                 });

//                 ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('QR codes saved to Firestore!')));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'qr_image.dart';

// // class GenerateQRCode extends StatefulWidget {
// //   const GenerateQRCode({super.key});

// //   @override
// //   GenerateQRCodeState createState() => GenerateQRCodeState();
// // }

// // class GenerateQRCodeState extends State<GenerateQRCode> {
// //   TextEditingController controller = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Flutter + QR code'),
// //         centerTitle: true,
// //       ),
// //       body: Column(
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: [
// //           Container(
// //             margin: const EdgeInsets.all(20),
// //             child: TextField(
// //               controller: controller,
// //               decoration: const InputDecoration(
// //                   border: OutlineInputBorder(),
// //                   labelText: 'Enter Evacuation Name'),
// //             ),
// //           ),
// //           //This button when pressed navigates to QR code generation
// //           ElevatedButton(
// //               onPressed: () async {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: ((context) {
// //                       return QRImage(controller);
// //                     }),
// //                   ),
// //                 );
// //               },
// //               child: const Text('GENERATE QR CODE')),
// //         ],
// //       ),
// //     );
// //   }
// // }
