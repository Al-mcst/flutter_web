import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserEvacuationCount extends StatefulWidget {
  const UserEvacuationCount({super.key});
  @override
  UserEvacuationCountState createState() => UserEvacuationCountState();
}

class UserEvacuationCountState extends State<UserEvacuationCount> {
  List<String> evacuationCenter1Count = [];
  List<String> evacuationCenter2Count = [];

  @override
  void initState() {
    super.initState();
    loadEvacueeCount();
  }

  Future loadEvacueeCount() async {
    await FirebaseFirestore.instance
        .collection('user')
        .get()
        .then((value) => value.docs.forEach((element) {
              debugPrint(element['location']);
              if (element['location'] != "") {
                if (element['location'] == 'Evacuation Barangay Hall') {
                  setState(() {
                    debugPrint('barangay hall true');
                    evacuationCenter1Count.add(element['name']);
                  });
                } else if (element['location'] == 'Evacuation School') {
                  setState(() {
                    evacuationCenter2Count.add(element['name']);
                  });
                }
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<QuerySnapshot>(
    //   stream: FirebaseFirestore.instance
    //       .collection('users')
    //       .where('location', isEqualTo: location)
    //       .snapshots(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       final count = snapshot.data!.size;
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Evacuation Barangay Hall ${evacuationCenter1Count.length}'),
          Text('Evacuation School ${evacuationCenter2Count.length}'),
        ],
      ),
    );
  }
}
