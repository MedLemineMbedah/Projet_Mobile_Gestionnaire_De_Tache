import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/resourceDao.dart';
import 'package:projects3/src/daos/tacheDao.dart';
import 'package:projects3/src/models/resource.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:projects3/src/screens/UserScreen/AddUser.dart';
import 'package:projects3/src/screens/ressource_screen/ressource_item_builder.dart';
import 'package:projects3/src/screens/signIn.dart';
import 'package:projects3/src/screens/tache_screen/list_tache.dart';

class ListRessource extends StatelessWidget {
  static const String screenName= 'listRessource';
  Tache tache;
  Function changeScreen;
  
  ListRessource({ Key? key,required this.changeScreen,required this.tache}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('les Ressources disponibles'), 
        leading: IconButton(onPressed: ()=> changeScreen(selectedScreen:ListTache.screenName),icon: Icon(Icons.arrow_back)),
     actions: [
          IconButton(onPressed: ()=> Auth.loguOut(), icon: Icon(Icons.logout))
        ],),
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
                                  Tache t = await TacheDao.getUserTache(Auth.uid, tache.id);
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
        child: Icon(Icons.add),   
        onPressed: (){   
          { changeScreen(selectedScreen:AddUser.screenName);}
        }   
    ),   
    );
  }
}