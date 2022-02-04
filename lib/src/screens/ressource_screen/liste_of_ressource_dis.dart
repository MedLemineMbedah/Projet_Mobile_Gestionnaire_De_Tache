import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/resourceDao.dart';
import 'package:projects3/src/daos/tacheDao.dart';
import 'package:projects3/src/models/resource.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/screens/ressource_screen/ressource_item_builder.dart';

class ListRessource extends StatelessWidget {
  static const String screenName= 'listRessource';
  Function changeScreen;
  ListRessource({ Key? key,required this.changeScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('les Ressources disponibles'),),
      body: FutureBuilder<List<Resource>>(
        future: ResourceDao.getAllResourcesDipo(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data!.isEmpty) return Center( child: Text('pas de Ressource '),);
             return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context,index)=>   ListTile(
                               title: Text(snapshot.data![index].nom)  ,
                          onTap: ()  async {
                                  ResourceDao.ResourceAuccupe(snapshot.data![index].id);
                                  Tache t = await TacheDao.getUserTache(Auth.uid, "iZFy09vK6gb9MESPAgr5");
                                
                                  TacheDao.SaveTacheOfRe(snapshot.data![index].id,t);
                                  print("Saved");
                          //  ontap(project: project,selectedScreen:ListTache.screenName);
                          },
                        ));
          
          
          
          
          }

          else{
            return Center(child: CircularProgressIndicator());
          }
         
            
        }
      ),
       floatingActionButton: FloatingActionButton(   
        elevation: 8.0,   
        child: Icon(Icons.logout),   
        onPressed: (){   
         Auth.loguOut();  
        }   
    ),   
    );
  }
}