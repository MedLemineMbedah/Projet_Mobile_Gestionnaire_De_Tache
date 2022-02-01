import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/screens/project_screen/list_project.dart';
import 'package:projects3/src/screens/tache_screen/list_tache.dart';

class AdminController extends StatefulWidget {
  const AdminController({ Key? key }) : super(key: key);

  @override
  State<AdminController> createState() => _AdminControllerState();
}

class _AdminControllerState extends State<AdminController> {
  Project ?selectedProject = null;
  Tache ?selectedTache = null;



  String screen = 'listProject';
  @override
  Widget build(BuildContext context) {
   void onTapProject({project,selectedScreen}){
     setState(() {
       if(project != null) selectedProject = project;
       screen = selectedScreen;
     });
   }
     void onTapTache({tache,selectedScreen}){
     setState(() {
       if(tache != null) selectedTache = tache;
       screen = selectedScreen;
     });
   }
    void selectProject(Project p){
      setState(() {
        selectedProject = p;
      });
    }

     switch (screen) {
       
         case 'listProject' : return ListProject(changeScreen:onTapProject );
    
    case'listTache' : return ListTache(changeScreen: onTapTache ,);
   
      default: return ListProject(changeScreen:onTapProject);
    }
  }
}