import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/resourceDao.dart';
import 'package:projects3/src/models/resource.dart';
import 'package:projects3/src/screens/tache_screen/list_tache.dart';


class ressource_item_builder extends StatelessWidget {
  Resource resource;
  Function ontap;
  ressource_item_builder({ Key? key , required this.resource,required this.ontap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

Dismissible(
                    key: ObjectKey(resource.id),
                    background: Container(color: Colors.red),
                    onDismissed: (direction) {
                     // documentSnapshot.data().remove(index);
                     ResourceDao.deleteRe(resource.id);
                      print(resource.nom);
                    //  ProjectDao.deleteP(project.id, Auth.uid);
                     
                     
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
      title: Text(resource.nom)  ,
      onTap: (){
        
      //  ontap(project: project,selectedScreen:ListTache.screenName);
      },
    )
     )
    );
  }
}