import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/project_dao.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/screens/project_screen/Update_project_screen.dart';
import 'package:projects3/src/screens/ressource_screen/liste_of_ressource_dis.dart';
import 'package:projects3/src/screens/tache_screen/list_tache.dart';

import 'package:projects3/src/screens/project_screen/list_project.dart';
//import 'package:projects3/src/screens/tache_screen/liste_tache_of_project.dart';

class ProjectItemBuilder extends StatelessWidget {
  Project project;
  // Function changeScreen;
  //ListProject({ Key? key,required this.changeScreen}) : super(key: key);
  Function ontap;
  ProjectItemBuilder({Key? key, required this.project, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20.0),
        color: Colors.orangeAccent,
        child: Icon(Icons.edit, color: Colors.white),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.0),
        color: Colors.redAccent,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        title: Text(project.titre),
        subtitle: Text("date fin: ${project.dateFin.toString()}"),
        trailing: Text(project.dateDedut.toString()),
        onTap: () {
          ontap(project: project, selectedScreen: ListTache.screenName);
        },
      ),
      key: ObjectKey(project.id),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          print(project.id);
        } else if (direction == DismissDirection.endToStart) {
          //Scaffold.of(context).showSnackBar(SnackBar(content: Text("Swipe to right")));
          print(project.id);
          print("supprimer");
          ProjectDao.deleteP(project.id, Auth.uid);
        }
      },
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Confirm"),
                  content:
                      const Text("Are you sure you wish to delete this item?"),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text("DELETE")),
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("CANCEL"),
                    ),
                  ],
                );
              });
        } else {
          onTap:
          {
            ontap(project: project, selectedScreen: updateProjet.screenName);
          }
        }
      },
    );
  }
}
