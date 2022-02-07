import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:projects3/src/screens/project_screen/list_project.dart';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/screens/controllers/admin_contriller.dart';
import 'package:projects3/src/screens/controllers/user_controller.dart';
import 'package:projects3/src/screens/project_screen/list_project.dart';
import 'package:projects3/src/daos/project_dao.dart';
import 'package:projects3/src/screens/tache_screen/AddTache.dart';

class CreateProjectScreen extends StatefulWidget {
  static const String screenName = 'createProject';
  Function changeScreen;
  CreateProjectScreen({Key? key, required this.changeScreen}) : super(key: key);

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  TextEditingController _title = TextEditingController(text: ' ');

  final _formKey = GlobalKey<FormState>();

  DateTime _dat1 = DateTime.now();
  DateTime _dat2 = DateTime.now();
  //String _title = '';
  String btnText = 'Add project';
  // String titleText = 'Add Project';

  TextEditingController _dat1Controller = TextEditingController();
  TextEditingController _dat2Controller = TextEditingController();
  final DateFormat _dateFormatter =
      DateFormat('yyyy-MM-dd hh:mm'); //DateFormat();

  @override
  void initState() {
    super.initState();

    _dat1Controller.text = _dateFormatter.format(_dat1);
    _dat2Controller.text = _dateFormatter.format(_dat1);
  }

  @override
  void dispose() {
    _dat1Controller.dispose();
    _dat2Controller.dispose();
    super.dispose();
  }

  _handleDateDebutPicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _dat1,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null && date != _dat1) {
      setState(() {
        _dat1 = date;
      });
      _dat1Controller.text = _dateFormatter.format(date);
    }
  }

  _handleDateFinPicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _dat2,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null && date != _dat2) {
      setState(() {
        _dat2 = date;
      });
      _dat2Controller.text = _dateFormatter.format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('create Project'),
          // to return to  ListProject screen
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),

          backgroundColor: Colors.blue,
        ),
        body: GestureDetector(
          onTap: () {},
          child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    // Center(
                    //   child: Text(
                    //     titleText,
                    //     style: TextStyle(
                    //       color: Colors.lightBlueAccent.shade200,
                    //       fontSize: 20.0,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nom',
                                hintText: 'Entrer votre nom',

                                // hintText: 'Nom'
                              ),
                              controller: _title,
                            ),
                          ),

                          // date debut
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: TextFormField(
                              readOnly: true,
                              controller: _dat1Controller,
                              onTap: _handleDateDebutPicker,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                              decoration: InputDecoration(
                                labelText: 'DateDebut',
                                labelStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black54,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          // date fin
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: TextFormField(
                              readOnly: true,
                              controller: _dat2Controller,
                              onTap: _handleDateFinPicker,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                              decoration: InputDecoration(
                                labelText: 'DateFin',
                                labelStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black54,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            height: 60.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                ProjectDao.SaveProject(
                                    Auth.uid,
                                    Project(
                                        dateDedut: DateTime.parse(
                                            _dat1Controller.text),
                                        dateFin: DateTime.parse(
                                            _dat1Controller.text),
                                        titre: _title.text));
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Result'),
                                    content: Text('Ajout avec succes'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Ok'))
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                btnText.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
