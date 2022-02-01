import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects3/src/daos/project_dao.dart';
import 'package:projects3/src/daos/user_dao.dart';
import 'package:projects3/src/models/tache.dart';


class TacheDao{
  static String colName = 'tache';

 

 

  // add new Tache
       static Future<void > SaveTache(String uid,String idP,Tache t ) async {
         await  FirebaseFirestore.instance.collection(UserDao.colName).
         doc(uid).collection(ProjectDao.colName).
         doc(idP).collection(colName)
            .add(t.asMap());
  }

  Future<List<Tache>> getUserTache(String uid , idP) async {
   QuerySnapshot  query =  await FirebaseFirestore.instance.collection(UserDao.colName).
         doc(uid).collection(ProjectDao.colName).
         doc(idP).collection(colName).get();
   return query.docs.map(Tache.fromQueryDocumentSnapshot).toList();

  }
}