import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/project_dao.dart';
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
    return 
    Dismissible(
                    key: ObjectKey(project.id),
                    background: Container(color: Colors.red),
                    onDismissed: (direction) {
                     // documentSnapshot.data().remove(index);
                     print(project.titre);
                     ProjectDao.deleteP(project.id, Auth.uid);
                     
                     
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
    child: Card(
   child:
    
    ListTile(
      title: Text(project.titre)  ,
      subtitle: Text(
        "date fin: ${project.dateFin.toString()}"
        
        ),
        
        trailing:  Text(project.dateDedut.toString()),
      onTap: (){
        ontap(project: project,selectedScreen:ListTache.screenName);
      },
    )
    )
    );
  }
}