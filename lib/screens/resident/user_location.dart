// import 'dart:async';
// import 'dart:html';
// import 'package:flutter/material.dart';
// //import 'package:google_maps/google_maps.dart';
// import 'dart:ui' as ui;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:watcher_web/screens/resident/edit_user.dart';

// class UserLocationScreen extends StatelessWidget {
//   UserLocationScreen(this.email, {Key? key}) : super(key: key) {
//     _reference = FirebaseFirestore.instance.collection('employee').doc(email);
//     _futureData = _reference.get();
//   }

//   String email;
//   late DocumentReference _reference;

//   //_reference.get()  --> returns Future<DocumentSnapshot>
//   //_reference.snapshots() --> Stream<DocumentSnapshot>
//   late Future<DocumentSnapshot> _futureData;
//   late Map data;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User Location'),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 //add the id to the map
//                 data['email'] = email;

//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => EditItem(data)));
//               },
//               icon: const Icon(Icons.edit)),
//           IconButton(
//               onPressed: () {
//                 //Delete the item
//                 _reference.delete();
//               },
//               icon: const Icon(Icons.delete))
//         ],
//       ),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: _futureData,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Some error occurred ${snapshot.error}'));
//           }

//           if (snapshot.hasData) {
//             //Get the data
//             DocumentSnapshot documentSnapshot = snapshot.data;
//             data = documentSnapshot.data() as Map;

//             //display the data
//             return Column(
//               children: [
//                 Text('${data['name']}'),
//                 Text('${data['phoneNumber']}'),
//               ],
//             );
//           }

//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// } 

//   // _UserLocationScreenState createState() => _UserLocationScreenState();


// // class _UserLocationScreenState extends State<UserLocationScreen> {
// //   final FirebaseFirestore _db = FirebaseFirestore.instance;
// //   late Stream<DocumentSnapshot> _stream;
// //   Completer<GoogleMapController> _controller = Completer();

// //   @override
// //   void initState() {
// //     super.initState();
// //     _stream = _db.collection('employee').doc(widget.userId).snapshots();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('User Location'),
// //       ),
// //       body: StreamBuilder<DocumentSnapshot>(
// //         stream: _stream,
// //         builder:
// //             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
// //           if (snapshot.hasError) {
// //             return Text('Error: ${snapshot.error}');
// //           }

// //           if (!snapshot.hasData || !snapshot.data!.exists) {
// //             return Center(child: CircularProgressIndicator());
// //           }

// //           GeoPoint location = snapshot.data!['location'];
// //           LatLng latLng = LatLng(location.latitude, location.longitude);

// //           return GoogleMap(
// //             initialCameraPosition: CameraPosition(target: latLng, zoom: 15),
// //             onMapCreated: (GoogleMapController controller) {
// //               _controller.complete(controller);
// //             },
// //             markers: {
// //               Marker(
// //                 markerId: MarkerId(widget.userId),
// //                 position: latLng,
// //               ),
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
