import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/models/resource.dart';
import 'package:projects3/src/screens/tache_screen/list_tache.dart';


class ressource_item_builder extends StatelessWidget {
  Resource resource;
  Function ontap;
  ressource_item_builder({ Key? key , required this.resource,required this.ontap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(resource.nom)  ,
      onTap: (){
        
      //  ontap(project: project,selectedScreen:ListTache.screenName);
      },
    );
  }
}