
import 'package:cloud_firestore/cloud_firestore.dart';
class UserMadel{
  String id;
  String nom;
  String  prenom;
  String  email;
  bool isAdmin;
  
  

  UserMadel({required this.nom,required this.prenom,required this.email, this.isAdmin = false, this.id = ''});

  Map<String ,dynamic> asMap(){
    return {
    'nom': nom,
    "prenom" : prenom,
    'email' : email,
    'isAdmin' : false
    
    };
  }

  static UserMadel fromMap(Map<String,dynamic > data , String idP){
    return  UserMadel(
      id : idP,
      nom:  data['nom'] ?? '' ,
       prenom: data['prenom'] ?? '',
       email: data['email']  ?? '',
       isAdmin: data['isAdmin']  ?? false,
        );
  }

  static UserMadel fromDocumentSnapshot(DocumentSnapshot doc){
    return fromMap(doc.data() as Map<String ,dynamic>, doc.id);
  }

}