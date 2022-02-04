import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/screens/project_screen/list_project.dart';
import 'package:projects3/src/screens/tache_screen/AddTache.dart';
import 'package:projects3/src/screens/tache_screen/tache_item_builder.dart';
import 'package:projects3/src/daos/tacheDao.dart';
import 'package:projects3/src/daos/auth.dart';
//import 'package:projects3/src/models/project.dart';

class ListTache extends StatelessWidget {
  static const String screenName = 'listTache';
  Project project;
  Function changeScreen;

  ListTache({ Key? key ,required this.changeScreen,required this.project}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title:Text('les taches') ,
  //       // to return to  ListProject screen 
  //       leading: IconButton(icon:Icon(Icons.arrow_back) , onPressed: (){changeScreen(selectedScreen: ListProject.screenName);},),
  //       ),
  //     body: Center(
  //       child: Text('ListTache'),
  //     ),
      
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('les Taches 11'),  actions: [
          IconButton(onPressed: ()=> Auth.loguOut(), icon: Icon(Icons.logout))
        ],
     // leading: IconButton(onPressed: changeScreen(selectedScreen:ListProject.screenName), icon: Icon(Icons.arrow_back)),
      ),
      body: FutureBuilder<List<Tache>>(
        future: TacheDao.getUserTacheNonAffecter(Auth.uid,project.id),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data!.isEmpty) return Center( child: Text('pas de project '),);
             return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context,index)=> tachetemBuilder(ontap: changeScreen,tache: snapshot.data![index],));
          
          
          
          }

          else{
            return Center(child: CircularProgressIndicator());
          }
         
            
        }
      ),
        floatingActionButton: FloatingActionButton(   
        elevation: 8.0,   
        child: Icon(Icons.add),   
        onPressed: (){   
          { changeScreen(selectedScreen:AddTache.screenName );project;}
        }   
    ),   
    );
  }
}