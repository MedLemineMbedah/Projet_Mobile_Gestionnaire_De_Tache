import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects3/src/models/resource.dart';

import 'package:projects3/src/daos/user_dao.dart';

class ResourceDao{
  static String colName = 'resource';

    static CollectionReference _usersCollection =FirebaseFirestore.instance.collection('resource');

      static Future<Resource> getResource(String id) async {
      DocumentSnapshot doc =await  _usersCollection.doc(id).get();
      return Resource.fromDocumentSnapshot(doc);
  }
  static Future<List<Resource>> getAllResources() async {
      QuerySnapshot doc =await  _usersCollection.get();
      return doc.docs.map(Resource.fromQueryDocumentSnapshot).toList();
  }



      static Future<void > SaveTache(String uid,String idP,Resource t ) async {
         await  FirebaseFirestore.instance.collection(ResourceDao.colName).
         doc(uid).collection(ResourceDao.colName).
         doc(idP).collection(colName)
            .add(t.asMap());
  }

    static Future<void> ResourceAuccupe(String idR) async {
      Map<String,dynamic> estOcupper = {
      "estOcupper": true
    };
         await  FirebaseFirestore.instance.collection(UserDao.colName).
         doc(idR).update(estOcupper);
  }

static Future<List<Resource>> getAllResourcesDipo() async {
      QuerySnapshot doc = await  FirebaseFirestore.instance.collection(UserDao.colName).where('estOcupper', isEqualTo: false).get();
      return doc.docs.map(Resource.fromQueryDocumentSnapshot).toList();
  }
}