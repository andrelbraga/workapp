import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:workapp/src/models/person_model.dart';
import 'package:workapp/src/services/person_service.dart';
import 'package:workapp/src/widgets/input_button.dart';
import 'package:workapp/src/widgets/input_widget.dart';

// ignore: non_constant_identifier_names
Widget BuildForm(
    BuildContext context,
    GlobalKey key,
    TextEditingController ctlrName,
    TextEditingController ctlrLastName,
    TextEditingController ctlrDocument,
    dynamic personObj) {
  var uuid = const Uuid();

  handleSubmit() async {
    var person = Person(
      id: uuid.v4(),
      name: personObj["name"],
      lastName: personObj["lastName"],
      document: personObj["document"],
    );
    try {
      await insertPerson(person);
    } catch (error) {
      return error;
    }
    ctlrName.text = "";
    ctlrLastName.text = "";
    ctlrDocument.text = "";
  }

  return Form(
    key: key,
    child: Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.black26, width: 1.0),
              bottom: BorderSide(color: Colors.black26, width: 1.0),
              left: BorderSide(color: Colors.black26, width: 1.0),
              right: BorderSide(color: Colors.black26, width: 1.0))),
      child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: InputField(ctlrName, "Name")),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: InputField(ctlrLastName, "LastName")),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: InputField(ctlrDocument, "Document")),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: InputButton(context, personObj, handleSubmit)),
          ],
        )
      )
    ),
  );
}
