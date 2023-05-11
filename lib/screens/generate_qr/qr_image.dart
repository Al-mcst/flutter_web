import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImage extends StatelessWidget {
  const QRImage(this.location, {super.key});

  final String location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location),
        centerTitle: true,
      ),
      body: Center(
        child: QrImage(
          data: location,
          size: 280,
          // You can include embeddedImageStyle Property if you
          //wanna embed an image from your Asset folder
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: const Size(
              100,
              100,
            ),
          ),
        ),
      ),
    );
  }
}
