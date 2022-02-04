import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/screens/ressource_screen/liste_of_ressource_dis.dart';
import 'package:projects3/src/screens/tache_screen/list_tache.dart';
//import 'package:projects3/src/screens/tache_screen/liste_tache_of_project.dart';


class ProjectItemBuilder extends StatelessWidget {
  Project project;
  Function ontap;
  ProjectItemBuilder({ Key? key , required this.project,required this.ontap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(project.titre)  ,
      subtitle: Text(
        "date fin: ${project.dateFin.toString()}"
        ),
        trailing:  Text(project.dateDedut.toString()),
      onTap: (){
        ontap(project: project,selectedScreen:ListTache.screenName);
      },
    );
  }
}