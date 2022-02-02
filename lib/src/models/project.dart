import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Project{
  String id;
  String titre;
  DateTime dateDedut;
  DateTime dateFin;
  

  Project({required this.dateDedut,required this.dateFin,required this.titre, this.id = ''});

  Map<String ,dynamic> asMap(){
    return {
    'titre': titre,
    "dateDedut" : dateDedut,
    'dateFin' : dateFin
    };
  }

  static Project fromMap(Map<String,dynamic > data , String idP){
    return  Project(
      id : idP,
      dateDedut:  data['dateDedut'] !=null ? DateTime.parse(data['dateDedut'] )  :  DateTime.now() ,
       dateFin: data['dateFin'] !=null ? DateTime.parse(data['dateFin'] )  :  DateTime.now(),
        titre: data['titre'] ?? ''
        );
  }

  

  static Project  fromDocumentSnapshot(DocumentSnapshot doc){
    return fromMap(doc.data() as Map<String,dynamic> , doc.id);
  }

   static Project  fromQueryDocumentSnapshot(QueryDocumentSnapshot doc){
    return fromMap(doc.data() as Map<String,dynamic> , doc.id);
  }


  


}