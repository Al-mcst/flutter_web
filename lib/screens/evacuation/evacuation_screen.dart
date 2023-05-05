// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_maps/maps.dart';

// class MyMap extends StatelessWidget {
//   final List<MapLatLng> locations = [
//     MapLatLng(37.7749, -122.4194), // San Francisco
//     MapLatLng(40.7128, -74.0060), // New York
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SfMaps(
//         layers: [
//           MapShapeLayer(
//             source: MapShapeSource.asset(
//               'assets/world_map.json',
//               shapeDataField: 'name',
//               dataCount: _data.length,
//               primaryValueMapper: (index) => _data[index].name,
//             ),
//             markers: [
//               MapMarker(
//                 latitude: locations[0].latitude,
//                 longitude: locations[0].longitude,
//                 iconColor: Colors.blue,
//               ),
//               MapMarker(
//             latitude: locations[1].latitude,
//             longitude: locations[1].longitude,
//             iconColor: Colors.green,
//           ),
//         ],
//       ),
//     ],
//   ),
// );
// }
// }

// class _CountryData {
// _CountryData(this.name);

// final String name;
// }
// final List<_CountryData> _data = <_CountryData>[
// _CountryData('Philippines'),
// ];

