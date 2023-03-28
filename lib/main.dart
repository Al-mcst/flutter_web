import 'package:flutter/material.dart';
import 'package:watcher_web/environment.dart';
import 'package:watcher_web/root_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Environment.init(
    apiBaseUrl: 'https://example.com',
  );

  runApp(const RootApp());
}