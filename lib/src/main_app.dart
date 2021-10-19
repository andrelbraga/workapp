import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:workapp/src/localizations/lozalizations.dart';
import 'package:workapp/workapp_tab_app.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Locale locale = const Locale('pt-br', '');
  bool localeLoaded = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      localeLoaded = true;
      locale = locale;
    });
  }
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: "Work App", 
      home: WorkTabApp());
  }
}



