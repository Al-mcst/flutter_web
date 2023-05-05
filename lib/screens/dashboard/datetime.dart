// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class DateTime extends StatefulWidget {
//   const DateTime({super.key});

//   @override
//   DateTimeState createState() => DateTimeState();
// }

// class DateTimeState extends State<DateTime> {
//   @override
//   void initstate() {
//     super.initState();
//     sendDataToFirebase();
//   }

//   void sendDataToFirebase() async {
//     FirebaseFirestore.instance
//         .collection('readings')
//         .add({'timestamp': FieldValue.serverTimestamp()});
//   }

//   final _numberToMonthMap = {
//     1: 'Jan',
//     2: 'Feb',
//     3: 'Mar',
//     4: 'Apr',
//     5: 'May',
//     6: 'Jun',
//     7: 'Jul',
//     8: 'Aug',
//     9: 'Sep',
//     10: 'Oct',
//     11: 'Nov',
//     12: 'Dec',
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.black, title: const Text('Date and Time')),
//       body: FirestoreListView(
//           query: FirebaseFirestore.instance
//               .collection('readings')
//               .orderBy('timestamp', descending: true),
//           loadingBuilder: (_) => const CircularProgressIndicator()),
//     );
//   }
// }
