// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


// class ListScreen extends StatefulWidget {
//   @override
//   _ListScreenState createState() => _ListScreenState();
// }

// class _ListScreenState extends State<ListScreen> {

//   TextEditingController titleController = new TextEditingController();
//   TextEditingController authorController = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//           appBar: AppBar(
//             title: const Text("List View"),
//           ),
//           body: BookList(),
//           // ADD (Create)
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       content: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           const Text("Add"),
//                           const Padding(
//                             padding: EdgeInsets.only(top: 10),
//                             child: Text("Name: ", textAlign: TextAlign.start,),
//                           ),
//                           TextField(

//                             controller: titleController,
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(top: 20),
//                             child: Text("Phone Number: "),
//                           ),
//                           TextField(
//                             controller: authorController,
//                           ),
//                         ],
//                       ),
//                       actions: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: RaisedButton(
//                             color: Colors.red,
//                             onPressed: () { Navigator.of(context).pop();},
//                             child: const Text("Undo", style: TextStyle(color: Colors.white),),),
//                         ),

//                         //Add Button

//                         RaisedButton(

//                           onPressed: () {
//                             //TODO: Firestore create a new record code

//                             Map<String, dynamic> newBook = new Map<String,dynamic>();
//                             newBook["title"] = titleController.text;
//                             newBook["author"] = authorController.text;

//                             Firestore.instance
//                                 .collection("books")
//                                 .add(newBook)
//                                 .whenComplete((){
//                               Navigator.of(context).pop();
//                             } );

//                           },
//                           child: const Text("save", style: TextStyle(color: Colors.white),),
//                         ),

//                       ],
//                     );
//                   }
//               );
//             } ,
//             tooltip: 'Add Title',
//             child: const Icon(Icons.add),
//           ),
//         );
//   }
// }


// class BookList extends StatelessWidget {

//   TextEditingController titleController = new TextEditingController();
//   TextEditingController authorController = new TextEditingController();


//   @override
//   Widget build(BuildContext context) {
//     //TODO: Retrive all records in collection from Firestore
//     return StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('books').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting: return const Center(child: CircularProgressIndicator(),);
//             default:
//               return ListView(

//                 padding: const EdgeInsets.only(bottom: 80),
//                 children: snapshot.data.doc.map((DocumentSnapshot document) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
//                     child: Card(
//                       child: ListTile(
//                         onTap: (){
//                           showDialog(
//                               context: context,
//                               builder: (BuildContext context){
//                                 return AlertDialog(
//                                   title: const Text("Update Dilaog"),
//                                   content: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       const Text("Title: ", textAlign: TextAlign.start,),
//                                       TextField(
//                                         controller: titleController,
//                                         decoration: InputDecoration(
//                                           hintText:  document['title'],
//                                         ),
//                                       ),
//                                       const Padding(
//                                         padding: EdgeInsets.only(top: 20),
//                                         child: Text("Author: "),
//                                       ),
//                                       TextField(
//                                         controller: authorController,
//                                         decoration: InputDecoration(
//                                           hintText:  document['author'],

//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   actions: <Widget>[
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                                       child: RaisedButton(
//                                         color: Colors.red,
//                                         onPressed: () { Navigator.of(context).pop();},
//                                         child: const Text("Undo", style: TextStyle(color: Colors.white),),),
//                                     ),
//                                     // Update Button
//                                     RaisedButton(
//                                       onPressed: () {

//                                          //TODO: Firestore update a record code

//                                         Map<String, dynamic> updateBook = new Map<String,dynamic>();
//                                         updateBook["title"] = titleController.text;
//                                         updateBook["author"] = authorController.text;

//                                         // Updae Firestore record information regular way
//                                        FirebaseFirestore.instance
//                                            .collection("books")
//                                            .doc(document.doc)
//                                            .update(updateBook)
//                                            .whenComplete((){
//                                          Navigator.of(context).pop();
//                                        });

//                                         // Update firestore record information using a transaction to prevent any conflict in data changed from different sources
// //                                         Firestore.instance.runTransaction((transaction) async {
// // //                                          await transaction.update(document.reference, {'title': titleController.text, 'author': authorController.text })
// //                                           await transaction.update(document.reference, updateBook)
// //                                               .then((error){
// //                                             Navigator.of(context).pop();
// //                                           });
// //                                         });
// //                                       },


//                                       child: const Text("update",
//                                         style: TextStyle(color: Colors.white),),),


//                                   ],
//                                 );
//                               }
//                           );
//                         },
//                         title: new Text("Title " + document['title']),
//                         subtitle: new Text("Author " + document['author']),
//                         trailing:
//                         // Delete Button
//                         InkWell(
//                           onTap: (){
//                             //TODO: Firestore delete a record code
//                       Firestore.instance
//                           .collection("books")
//                           .document(document.documentID)
//                           .delete()
//                           .catchError((e){
//                         print(e);
//                       });


//                           }, child:
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                           child: Icon(Icons.delete),
//                         ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               );
//           }
//         },
//       );
//   }
// }
