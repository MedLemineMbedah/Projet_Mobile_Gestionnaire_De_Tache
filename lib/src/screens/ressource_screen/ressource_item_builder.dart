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
    child:
    
    ListTile(
      title: Text(resource.nom)  ,
      onTap: (){
        
      //  ontap(project: project,selectedScreen:ListTache.screenName);
      },
    ),

    
    onDismissed: (direction){
      if(direction == DismissDirection.startToEnd){
        print(resource.id);
        
      } else if(direction == DismissDirection.endToStart){
        //Scaffold.of(context).showSnackBar(SnackBar(content: Text("Swipe to right")));
        print(resource.id);
        print("supprimer");
        ResourceDao.deleteRe(resource.id);
      }
    },

    confirmDismiss: (direction) async {
      if(direction==DismissDirection.endToStart){
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
      });
    }
    else{
      print("modifier");
    }
  
  
},
  );
  }
}

