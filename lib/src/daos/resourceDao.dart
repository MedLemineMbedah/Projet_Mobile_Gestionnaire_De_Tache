import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects3/src/models/resource.dart';
import 'package:projects3/src/models/tache.dart';

class ResourceDao{
  String colName = 'resource';

    static CollectionReference _usersCollection =FirebaseFirestore.instance.collection('resource');

      static Future<Resource> getResource(String id) async {
      DocumentSnapshot doc =await  _usersCollection.doc(id).get();
      return Resource.fromDocumentSnapshot(doc);
  }
  static Future<List<Resource>> getAllResources() async {
      QuerySnapshot doc =await  _usersCollection.get();
      return doc.docs.map(Resource.fromQueryDocumentSnapshot).toList();
  }

}