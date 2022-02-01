import 'package:flutter/material.dart';
import 'package:projects3/src/screens/project_screen/list_project.dart';

class CreateProjectScreen extends StatelessWidget {
  static const String screenName = 'createProject';
  Function changeScreen;
   CreateProjectScreen({ Key? key , required this.changeScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text('create Project') ,
        // to return to  ListProject screen 
        leading: IconButton(icon:Icon(Icons.arrow_back) , onPressed: (){changeScreen(selectedScreen: ListProject.screenName);},),
        ),
      body: Center(
        child: Text('ListTache'),
      ),
      
    );
  }
}