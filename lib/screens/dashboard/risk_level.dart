// mport 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_series/screens/update_record.dart';
 
// class FetchData extends StatefulWidget {
//   const FetchData({Key? key}) : super(key: key);
 
//   @override
//   State<FetchData> createState() => _FetchDataState();
// }
 
// class _FetchDataState extends State<FetchData> {
  
//   Query dbRef = FirebaseDatabase.instance.ref().child('Students');
//   DatabaseReference reference = FirebaseDatabase.instance.ref().child('Students');
  
//   Widget listItem({required Map student}) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.all(10),
//       height: 110,
//       color: Colors.amberAccent,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             student['risk_level'],
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Text(
//             student['age'],
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//           ),

      
//         ],
//       ),
//     );
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Fetching data'),
//       ),
//       body: Container(
//         height: double.infinity,
//         child: FirebaseAnimatedList(
//           query: dbRef,
//           itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
 
//             Map student = snapshot.value as Map;
//             student['key'] = snapshot.key;
 
//             return listItem(student: student);
 
//           },
//         ),
//       )
//     );
//   }
// }
 