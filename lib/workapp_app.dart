import 'package:flutter/material.dart';
import 'package:workapp/src/models/person_model.dart';
import 'package:uuid/uuid.dart';
import 'package:workapp/src/services/person_service.dart';
import 'package:workapp/src/widgets/form_widget.dart';

class WorkApp extends StatefulWidget {
  const WorkApp({Key? key}) : super(key: key);

  @override
  _WorkAppState createState() => _WorkAppState();
}

class _WorkAppState extends State<WorkApp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ctrlInputName = TextEditingController();
  final TextEditingController _ctrlInputLastName = TextEditingController();
  final TextEditingController _ctrlInputDocument = TextEditingController();

  Map<String, String> personObj = {};


  @override
  void initState() {
    super.initState();
    _ctrlInputName.addListener(() {
      personObj["name"] = _ctrlInputName.text;
    });
    _ctrlInputLastName.addListener(() {
      personObj["lastName"] = _ctrlInputLastName.text;
    });
    _ctrlInputDocument.addListener(() {
      personObj["document"] = _ctrlInputDocument.text;
    });
  }

  @override
  void dispose() {
    _ctrlInputName.dispose();
    _ctrlInputLastName.dispose();
    _ctrlInputDocument.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Work App"),
          centerTitle: true,
          backgroundColor: Colors.black38),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              BuildForm(context, _formKey, _ctrlInputName, _ctrlInputLastName,
                  _ctrlInputDocument, personObj),
            ])),
      ),
    );
  }
}
