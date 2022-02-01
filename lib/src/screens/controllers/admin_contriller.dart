import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/screens/project_screen/create_project_screen.dart';
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

   void changeScreen(String s){
     setState(() {
       
       screen = s;
     });
   }
    void selectProject(Project p){
      setState(() {
        selectedProject = p;
      });
    }

     switch (screen) {
       
         case ListProject.screenName : return ListProject(changeScreen:onTapProject );
    
    case ListTache.screenName : return ListTache(changeScreen: onTapTache ,);
    case CreateProjectScreen.screenName : return CreateProjectScreen(changeScreen: changeScreen ,);
   
      default: return ListProject(changeScreen:onTapProject);
    }
  }
}