import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects3/src/daos/user_dao.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/user.dart';

class ProjectDao{
  static String colName = 'projet';

    static CollectionReference _projectCollection =FirebaseFirestore.instance.collection(colName);

    // get a project by id
      static Future<Project> getProject(String id,String uid) async {

      DocumentSnapshot doc =await  FirebaseFirestore.instance.collection(UserDao.colName).doc(uid).collection(colName).doc(id).get();
      return Project.fromDocumentSnapshot(doc);
  }
    static Future<void> deleteP(String id,String uid) async {

      await  FirebaseFirestore.instance.collection(UserDao.colName).doc(uid).collection(colName).doc(id).delete();
      
  }

  // add new project
       static Future<void > SaveProject(String uid,Project p) async {
         await  FirebaseFirestore.instance.collection(UserDao.colName).doc(uid).collection(colName).add(p.asMap());
  }

  static Future<List<Project>> getUserProject(String uid ) async {
   QuerySnapshot  query =  await  FirebaseFirestore.instance.collection(UserDao.colName).doc(uid).collection(colName).get();
   return query.docs.map(Project.fromQueryDocumentSnapshot).toList();

  }


  
}