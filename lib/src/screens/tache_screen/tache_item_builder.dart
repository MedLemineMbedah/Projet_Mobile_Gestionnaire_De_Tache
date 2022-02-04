import 'package:flutter/material.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/screens/ressource_screen/liste_of_ressource_dis.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/resourceDao.dart';
import 'package:projects3/src/models/resource.dart';
import 'package:projects3/src/daos/auth.dart';

class tachetemBuilder extends StatelessWidget {
  //static const String screenName = 'listRessource';
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
         ontap(tache: tache,selectedScreen:ListRessource.screenName); 
         
          },//end onTap
    );
    
  }
}

// Scaffold(
//          appBar: AppBar(title: Text('les Ressources disponibles'),),
//          body: FutureBuilder<List<Resource>>(
//         future: ResourceDao.getAllResources(),
//         builder: (context, snapshot) {
//           if(snapshot.hasData){
//             if(snapshot.data!.isEmpty) return Center( child: Text('pas de project '),);
//              return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context,index)=>  ListTile(
//                                title: Text(snapshot.data![index].nom)  ,
//                                   onTap: (){
//                                     ResourceDao.ResourceAuccupe(snapshot.data![index].id);
        
//             //  ontap(project: project,selectedScreen:ListTache.screenName);
//             },
//           ));
//           }

//           else{
//             return Center(child: CircularProgressIndicator());
//           }
         
            
//         }
//       ),
//        floatingActionButton: FloatingActionButton(   
//         elevation: 8.0,   
//         child: Icon(Icons.logout),   
//         onPressed: (){   
//          Auth.loguOut();  
//         }   
//     ),
//       //  ontap(project: tache,selectedScreen:ListTache.screenName);
//        );