// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
// class DatabaseTest extends StatelessWidget {
//   final databaseReference = FirebaseDatabase.instance.reference();
//   @override
//   Widget build(BuildContext context) {
//     createData();
//     readData();
//     return Text("created data");
//   }
//
//   void createData() {
//     databaseReference
//         .child("Patients/Patient1")
//         .set({'name': 'test1', 'score': 150});
//     databaseReference
//         .child("Patients/Patient2")
//         .set({'name': 'test2', 'score': 250});
//     databaseReference
//         .child("Patients/Patient3")
//         .set({'name': 'test3', 'score': 50});
//     databaseReference
//         .child("Patients/Patient4")
//         .set({'name': 'test4', 'score': 350});
//   }
//
//   void readData() {
//     var query = databaseReference.child("Patients").orderByChild("score");
//     query.onChildAdded.forEach((event) {
//       print(event.snapshot.value);
//     });
//    databaseReference.orderByChild("name").once().then((DataSnapshot snapshot) {
//      print('Data : ${snapshot.value}');
//    });
//    databaseReference.once().then((DataSnapshot snapshot) {
//      print('Data : ${snapshot.value}');
//    });
//   }
// }
