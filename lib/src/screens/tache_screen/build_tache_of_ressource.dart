import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/screens/tache_screen/tache_item_builder.dart';
import 'package:projects3/src/daos/tacheDao.dart';
import 'package:projects3/src/daos/auth.dart';
//import 'package:projects3/src/models/project.dart';

class ListTache_of_project extends StatelessWidget {
  static const String screenName = 'listTache';
  
//  Project project;
 // Function changeScreen;
  ListTache_of_project({ Key? key }) : super(key: key);
 // Project project;

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
      appBar: AppBar(title: Text('votre taches'), actions: [
          IconButton(onPressed: ()=> Auth.loguOut(), icon: Icon(Icons.logout))
        ],),
      body: FutureBuilder<List<Tache>>(
        future: TacheDao.getResourceTache(Auth.uid),
        builder: (context, snapshot) {
          
          if(snapshot.hasData){
            if(snapshot.data!.isEmpty) return Center( child: Text('pas de tache !!! '),);




             return
             
              ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context,index)=> 
            
            Dismissible(key:ObjectKey(snapshot.data![index].id), 
            
            background: Container(color: Colors.red),
                    onDismissed: (direction) {
                     // documentSnapshot.data().remove(index);
                     print(snapshot.data![index].titre);
                     //ProjectDao.deleteP(project.id, Auth.uid);
                     
                     
                    },

                    confirmDismiss: (DismissDirection direction) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm"),
        content: const Text("Are you sure you wish to delete this item?"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            
            child: const Text("DELETE")
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("CANCEL"),
          ),
        ],
      );
    },
  );
},

                    

                    direction: DismissDirection.endToStart,
            
            child: 
            ListTile(
                        title: Text(snapshot.data![index].titre)  ,
                        subtitle: Text(
                          "duree: ${snapshot.data![index].duree.toString()}"
                          ),
                        onTap: (){
                        //  ontap(project: tache,selectedScreen:ListTache.screenName);
                        },
                      )
            )
                      );



          
            //tachetemBuilder(ontap: changeScreen,tache: snapshot.data![index],));
          }

          else{
            return Center(child: CircularProgressIndicator());
          }
         
            
        }
      ),
    //    floatingActionButton: FloatingActionButton(   
    //     elevation: 8.0,   
    //     child: Icon(Icons.logout),   
    //     onPressed: (){   
    //      Auth.loguOut();  
    //     }   
    // ),  
    );
  }
}