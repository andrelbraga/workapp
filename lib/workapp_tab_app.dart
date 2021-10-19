import 'package:flutter/material.dart';
import 'package:workapp/src/models/person_model.dart';
import 'package:workapp/src/widgets/form_widget.dart';
import 'package:workapp/src/widgets/table_widget.dart';

class WorkTabApp extends StatefulWidget {
  const WorkTabApp({Key? key}) : super(key: key);

  @override
  _WorkTabAppState createState() => _WorkTabAppState();
}

class _WorkTabAppState extends State<WorkTabApp> {
  final _formKey = GlobalKey<FormState>();

  final List<Person> personsList = [];

  final TextEditingController _ctrlInputName = TextEditingController();
  final TextEditingController _ctrlInputLastName = TextEditingController();
  final TextEditingController _ctrlInputDocument = TextEditingController();

  Map<String, String> personObj = {};

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _widgetOptionsTab(int _selectedIndex) {
    switch (_selectedIndex) {
      case 0:
        return BuildForm(context, _formKey, _ctrlInputName, _ctrlInputLastName,
            _ctrlInputDocument, personObj);
      case 1:
        return BuildTableData();
      default:
        return const Text("Default");
    }
  }

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
          child: _widgetOptionsTab(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Cadastro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Lista',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
