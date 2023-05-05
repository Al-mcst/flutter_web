import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:watcher_web/screens/sidebar_screen.dart';

class QRLocationWidget extends StatefulWidget {
  const QRLocationWidget({super.key});

  @override
  _QRLocationWidgetState createState() => _QRLocationWidgetState();
}

class _QRLocationWidgetState extends State<QRLocationWidget> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    if (await Permission.location.request().isGranted) {
      setState(() {
        _currentPosition = null; // reset position while fetching
      });
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentPosition = position;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Scaffold(
        appBar: AppBar(
            title: const Text('Watcher Dashboard'),
            backgroundColor: Colors.black),
        drawer: const SidebarScreen());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_currentPosition != null)
          QrImage(
            data:
                '${_currentPosition!.latitude},${_currentPosition!.longitude}',
            size: 200.0,
          )
        else
          const CircularProgressIndicator(),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: _getLocation,
          child: const Text('Get Location'),
        ),
      ],
    );
  }
}
