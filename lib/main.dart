import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workapp/src/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MainApp());
}
