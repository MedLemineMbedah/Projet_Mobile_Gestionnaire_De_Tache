import 'package:flutter/material.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/screens/tache_screen/list_tache.dart';

class tachetemBuilder extends StatelessWidget {
  Tache tache;
  Function ontap;
   tachetemBuilder({ Key? key , required this.tache,required this.ontap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tache.titre)  ,
      subtitle: Text(
        "duree: ${tache.duree.toString()}"
        ),
      onTap: (){
      //  ontap(project: tache,selectedScreen:ListTache.screenName);
      },
    );
  }
}