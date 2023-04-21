// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class EmployeeScreen extends StatefulWidget {
//   const EmployeeScreen({Key? key}) : super(key: key);

//   @override
//   _EmployeeState createState() => _EmployeeState();
// }

// class _EmployeeState extends State<EmployeeScreen> {
//   late UserCredential _employeeCredential;
//   late String name;
//   late String email;
//   late String phoneNumber;

//   @override
//   void initState() {
//     super.initState();
//     _getEmployeeDetails();
//   }

//   Future<void> _getEmployeeDetails() async {
//     _employeeCredential = await FirebaseAuth.instance.signInAnonymously();
//     final employee = _employeeCredential.user!;
//     setState(() {
//       _name = employee.displayName ?? '-';
//       _email = employee.email ?? '-';
//       _phoneNumber = employee.phoneNumber ?? '-';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User Details'),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: DataTable(
//           columns: const [
//             DataColumn(label: Text('Field')),
//             DataColumn(label: Text('Value')),
//           ],
//           rows: [
//             DataRow(cells: [
//               const DataCell(Text('Name')),
//               DataCell(Text(_name)),
//             ]),
//             DataRow(cells: [
//               const DataCell(Text('Email')),
//               DataCell(Text(_email)),
//             ]),
//             DataRow(cells: [
//               const DataCell(Text('Phone Number')),
//               DataCell(Text(_phoneNumber)),
//             ]),
//           ],
//         ),
//       ),
//     );
//   }
// }
