
import 'package:cloud_firestore/cloud_firestore.dart';
class Resource{
  String id;
  String nom;
  String  email;
  String  contact;
  bool estOcupper;
  

  Resource({required this.nom, this.email='', this.contact='', this.id = '',this.estOcupper = false});

  Map<String ,dynamic> asMap(){
    return {
    'nom': nom,
    "email" : email,
    'contact' : contact,
    'estOcupper' : estOcupper
    };
  }
  Map<String ,dynamic> asMap_estOcupper(){
    return {
    'estOcupper' : estOcupper
    };
  }

   static Resource fromMap(Map<String,dynamic > data , String idP){
    return  Resource(
      id : idP,
      email:  data['email'] ?? '' ,
       contact: data['contact']  ?? '',
       nom: data['nom'] ?? '' ,
       estOcupper : data['estOcupper'] ?? false
        );
  }

  static Resource fromMapR(Map<String,dynamic > data , String idP){
    return  Resource(

       nom: data['nom'] ?? '' ,
        );
  }

   static Resource fromDocumentSnapshot(DocumentSnapshot doc){
    return fromMap(doc.data() as Map<String ,dynamic>, doc.id);
  }
  

   static Resource fromQueryDocumentSnapshot(QueryDocumentSnapshot doc){
    return fromMap(doc.data() as Map<String ,dynamic>, doc.id);
  }


   static Resource fromQueryDocumentSnapshotR(QueryDocumentSnapshot doc){
    return fromMapR(doc.data() as Map<String ,dynamic>, doc.id);
  }

}