import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:projects3/src/daos/tacheDao.dart';
import 'package:projects3/src/models/tache.dart';

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
import 'package:projects3/src/screens/tache_screen/list_tache.dart';
//import 'package:projects3/src/models/project.dart';

class AddTache extends StatelessWidget {
  static const String screenName = 'AddTache';
  Project project;
  Function changeScreen;

  var context;

  AddTache({Key? key, required this.changeScreen, required this.project})
      : super(key: key);

  TextEditingController _title = TextEditingController(text: "");
   int duree= 1 ;
  late String titre;
   String btnText = 'Ajouter tache';

  final _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
  
   return Scaffold(
        appBar: AppBar(
            title: Text('Ajouter une Tache'),
            // to return to  ListProject screen
            // leading: IconButton(onPressed: ()=> changeScreen(selectedScreen:ListTache.screenName),icon: Icon(Icons.arrow_back)),
            leading: IconButton(
                onPressed: () => Auth.loguOut(), icon: Icon(Icons.arrow_back))
            // backgroundColor: Colors.blue,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                titre = value;
              },
              // decoration: const InputDecoration(
              //   border: OutlineInputBorder(),
              //   labelText: 'Title',
              //   hintText: 'Entrer Title',
              // )),

              decoration: const InputDecoration(
                labelText: 'nom',
                hintText: 'Entrer Title',
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              )),
          TextFormField(
              keyboardType: TextInputType.number,

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                duree = int.parse(value);
              },
              // decoration: const InputDecoration(
              //   border: OutlineInputBorder(),
              //   labelText: 'duree',
              //   hintText: 'Entrer la duree',
              // )
              // ),

              decoration: const InputDecoration(
                labelText: 'duree',
                hintText: 'Entrer la duree',
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  Tache t = Tache(duree: duree, titre: titre,occupation:false,teminer: false);

                TacheDao.SaveTache(Auth.uid,project.id , t);

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
                }
              },
              child: const Text('Ajouter'),
            ),
          ),
        ],
      ),
    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
