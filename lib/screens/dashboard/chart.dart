// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// import '../../../constants.dart';

// class Chart extends StatelessWidget {
//   const Chart({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: Stack(
//         children: [
//           LineChart(
//             LineChartData(
//               sectionsSpace: 0,
//               centerSpaceRadius: 70,
//               startDegreeOffset: -90,
//               sections: paiChartSelectionDatas,
//             ),
//           ),
//           Positioned.fill(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: defaultPadding),
//                 Text(
//                   "29.1",
//                   style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                         height: 0.5,
//                       ),
//                 ),
//                 const Text("of 128GB")
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// List<PieChartSectionData> paiChartSelectionDatas = [
//   PieChartSectionData(
//     color: primaryColor,
//     value: 25,
//     showTitle: false,
//     radius: 25,
//   ),
//   PieChartSectionData(
//     color: const Color(0xFF26E5FF),
//     value: 20,
//     showTitle: false,
//     radius: 22,
//   ),
//   PieChartSectionData(
//     color: const Color(0xFFFFCF26),
//     value: 10,
//     showTitle: false,
//     radius: 19,
//   ),
//   PieChartSectionData(
//     color: const Color(0xFFEE2727),
//     value: 15,
//     showTitle: false,
//     radius: 16,
//   ),
//   PieChartSectionData(
//     color: primaryColor.withOpacity(0.1),
//     value: 25,
//     showTitle: false,
//     radius: 13,
//   ),
// ];



// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:syncfusion_flutter_charts/charts.dart';
// // import 'package:http/http.dart' as http;

// // class ChartScreen extends StatefulWidget {
// //   // ignore: prefer_const_constructors_in_immutables
// //   ChartScreen({Key? key}) : super(key: key);

// //   @override
// //   _ChartScreenState createState() => _ChartScreenState();
// // }

// // class _ChartScreenState extends State<ChartScreen> {
// //   List<SalesData> chartData = [];

// //   @override
// //   void initState() {
// //     loadSalesData();
// //     super.initState();
// //   }

// //   Future loadSalesData() async {
// //     final String jsonString = await getJsonFromFirebase();
// //     final dynamic jsonResponse = json.decode(jsonString);
// //     for (Map<String, dynamic> i in jsonResponse) {
// //       chartData.add(SalesData.fromJson(i));
// //     }
// //   }

// //   Future<String> getJsonFromFirebase() async {
// //     String url = "https://flutterdemo-f6d47.firebaseio.com/chartSalesData.json";
// //     http.Response response = await http.get(Uri.parse(url));
// //     return response.body;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Water Level Chart'),
// //         ),
// //         body: Center(
// //           child: FutureBuilder(
// //               future: getJsonFromFirebase(),
// //               builder: (context, snapShot) {
// //                 if (snapShot.hasData) {
// //                   return SfCartesianChart(
// //                       primaryXAxis: CategoryAxis(),
// //                       // Chart title
// //                       title: ChartTitle(text: 'Water Level Distance'),
// //                       series: <ChartSeries<SalesData, String>>[
// //                         LineSeries<SalesData, String>(
// //                             dataSource: chartData,
// //                             xValueMapper: (SalesData sales, _) => sales.month,
// //                             yValueMapper: (SalesData sales, _) => sales.distance,
// //                             // Enable data label
// //                             dataLabelSettings:
// //                                 const DataLabelSettings(isVisible: true))
// //                       ]);
// //                 } else {
// //                   return Card(
// //                     elevation: 5.0,
// //                     child: SizedBox(
// //                       height: 100,
// //                       width: 400,
// //                       child: Center(
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                           children: [
// //                             const Text('Retriving Firebase data...',
// //                                 style: TextStyle(fontSize: 20.0)),
// //                             SizedBox(
// //                               height: 40,
// //                               width: 40,
// //                               child: CircularProgressIndicator(
// //                                 semanticsLabel: 'Retriving Firebase data',
// //                                 valueColor: const AlwaysStoppedAnimation<Color>(
// //                                     Colors.blueAccent),
// //                                 backgroundColor: Colors.grey[300],
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 }
// //               }),
// //         ));
// //   }
// // }

// // class SalesData {
// //   SalesData(this.month, this.distance);

// //   final String month;
// //   final int distance;

// //   factory SalesData.fromJson(Map<String, dynamic> parsedJson) {
// //     return SalesData(
// //       parsedJson['month'].toString(),
// //       parsedJson['sales'],
// //     );
// //   }
// // }
