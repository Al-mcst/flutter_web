import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LocationCountWidget extends StatelessWidget {
  final String location;

  LocationCountWidget({required this.location});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .where('location', isEqualTo: location)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final count = snapshot.data!.size;
          return Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(location),
                Text(count.toString()),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/widgets.dart';

// class UserEvacuationCount extends StatefulWidget {
//   const UserEvacuationCount({super.key});
//   @override
//   UserEvacuationCountState createState() => UserEvacuationCountState();
// }

// class UserEvacuationCountState extends State<UserEvacuationCount> {
//   int evacuationCenter1Count = 0;
//   int evacuationCenter2Count = 0;

//   @override
//   void initState() {
//     loadEvacueeCount();
//     debugPrint(evacuationCenter1Count.toString());
//     super.initState();
//   }

//   // void documentsLoopFromFirestore() {
//   //   FirebaseFirestore.instance.collection('user').get().then(
//   //     (value) {
//   //       value.docs.forEach(
//   //         (result) {
//   //           FirebaseFirestore.instance.collection('user').add(
//   //                 result.data(),
//   //               );
//   //         },
//   //       );
//   //     },
//   //   );
//   // }

//   void loadEvacueeCount() async {
//     FirebaseFirestore.instance
//         .collection('user')
//         .get()
//         .then((value) => value.docs.forEach((element) {
//               debugPrint(element['location']);
//               if (element['location'] != "") {
//                 if (element['location'] == 'Evacuation Barangay Hall') {
//                   debugPrint('barangay hall true');
//                   evacuationCenter1Count += 1;
//                 } else if (element['location'] == 'Evacuation School') {
//                   evacuationCenter2Count += 1;
//                 }
//               }
//             }));
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }

//   //   for (var data in snapshot.data!.docs) {
//   //   userData.add(UsersApp(
//   //     // id: data['id'],
//   //     name: data['name'],
//   //     email: data['email'],
//   //     phoneNumber: data['phoneNumber'],
//   //     // imageUrl: data['imageUrl']
//   //   ));
//   // }
// }
