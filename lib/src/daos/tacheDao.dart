// import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/project_dao.dart';
import 'package:projects3/src/daos/user_dao.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:provider/provider.dart';

class TacheDao {
  static String colName = 'tache';

  // add new Tache
  static Future<void> SaveTache(String uid, String idP, Tache t) async {
    await FirebaseFirestore.instance
        .collection(UserDao.colName)
        .doc(uid)
        .collection(ProjectDao.colName)
        .doc(idP)
        .collection(colName)
        .add(t.asMap());
  }

  //      static Future<void > SaveTache1(Tache t ) async {
  //        await  FirebaseFirestore.instance.collection(UserDao.colName).
  //        doc().collection(ProjectDao.colName).
  //        doc().collection(colName)
  //           .add(t.asMap());
  // }

  // static Future<List<Tache>> getUserTache(String uid ,idP) async {
  //  QuerySnapshot  query =  await FirebaseFirestore.instance.collection(UserDao.colName).
  //        doc(uid).collection(ProjectDao.colName).doc(uid).collection(colName).doc(idP).get();
  //  return query.docs.map(Tache.fromQueryDocumentSnapshot).toList();

  // }
//haa4i
  static Future<Tache> getUserTache(String uid, String idT) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection(UserDao.colName)
        .doc(uid)
        .collection(ProjectDao.colName)
        .doc('Gmr2q29eBAXeUwRpYdeB')
        .collection(colName)
        .doc(idT)
        .get();
<<<<<<< HEAD

=======
        // Query<Map<String, dynamic>> doc = await FirebaseFirestore.instance
        // .collectionGroup("tache").where('id',isEqualTo: idT);
        
>>>>>>> 96d4587e511545c9a28b59e6ef3ab25c1c273942
    return Tache.fromDocumentSnapshot(doc);
  }
  ///////////////////////////////////////////////////

  //////////////////////////////////////////////////

  static Future<List<Tache>> getResourceTache(String uid) async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection(UserDao.colName)
        .doc(uid)
        .collection(colName)
        .get();
    return query.docs.map(Tache.fromQueryDocumentSnapshot).toList();
  }

  static Future<void> affecterUneTache(String uid, Tache t) async {
    await FirebaseFirestore.instance
        .collection(UserDao.colName)
        .doc(uid)
        .collection(colName)
        .add(t.asMap());
  }

  static Future<List<Tache>> getUserTacheNonAffecter(String uid, idP) async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection(UserDao.colName)
        .doc(uid)
        .collection(ProjectDao.colName)
        .doc(idP)
        .collection(colName)
        .where('occupation', isEqualTo: false)
        .get();
    return query.docs.map(Tache.fromQueryDocumentSnapshot).toList();
  }

  //Get tache terminer
  static Future<List<Tache>> getUserTacheTerminer() async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection(UserDao.colName)
        .doc('Ajd6QYvkVLeZ3DZSL9mqqvOcVCA2')
        .collection(colName)
        .where('terminer', isEqualTo: true)
        .get();
    return query.docs.map(Tache.fromQueryDocumentSnapshot).toList();
  }

  //Save tache for ressource
  static Future<void> SaveTacheOfRe(String idR, Tache t) async {
    await FirebaseFirestore.instance
        .collection(UserDao.colName)
        .doc(idR)
        .collection(colName)
        .add(t.asMap());
  }

  static Future<void> changeEtat(String uid, String idT) async {
    Map<String, dynamic> occupation = {"occupation": true};
    await FirebaseFirestore.instance
        .collection(UserDao.colName)
        .doc(uid)
        .collection(ProjectDao.colName)
        .doc('Gmr2q29eBAXeUwRpYdeB')
        .collection(TacheDao.colName)
        .doc(idT)
        .update(occupation);
  }

  static Future<void> changeTermin(String uid, String idT) async {
    Map<String, dynamic> terminer = {"terminer": false};

    await FirebaseFirestore.instance
        .collection(UserDao.colName)
        .doc(uid)
        .collection(TacheDao.colName)
        .doc(idT)
        .update(terminer);
  }

//delete
  static Future<void> supprimerTache(String uid, String idT) async {
    await FirebaseFirestore.instance
        .collection(UserDao.colName)
        .doc(uid)
        .collection(ProjectDao.colName)
        .doc('Gmr2q29eBAXeUwRpYdeB')
        .collection(TacheDao.colName)
        .doc(idT)
        .delete();
  }

  static String get idP {
    return FirebaseFirestore.instance
        .collection(UserDao.colName)
        .doc(Auth.uid)
        .collection(ProjectDao.colName)
        .id;
  }

  static Future<void> UpdateTache(
      String uid, Tache tache, String idT) async {
    FirebaseFirestore.instance
        .collection(UserDao.colName)
        .doc(uid)
        .collection(ProjectDao.colName)
        .doc(idP)
        .collection(TacheDao.colName)
        .doc(idT)
        .update(tache.asMap());
  }

  // static Future<Tache> getUserTache1(String uid, String idT) async {
  //   // DocumentSnapshot doc = await FirebaseFirestore.instance
  //   //     .collection(UserDao.colName)
  //   //     .doc(uid)
  //   //     .collection(ProjectDao.colName).doc('Gmr2q29eBAXeUwRpYdeB')
  //   //     .collection(colName)
  //   //     .doc(idT)
  //   //     .get();
  //     QuerySnapshot  query = FirebaseFirestore.instance.collectionGroup("tache").where('id',isEqualTo: idT);
  //     //   return doc.docs.map(Tache.fromQueryDocumentSnapshot).toList();
  //     if(query.docs.length != 0){
  //       return  query.docs.first.map(Tache.fromQueryDocumentSnapshot).toList();
  //     }
  //  // return query.map(Tache.fromQueryDocumentSnapshot).toList();
  // }
  //  Future<void> getUserTache2(String uid, String idT) async{
  //    FirebaseFirestore.instance.collectionGroup("tache").where('id' ,isEqualTo: false ).where('iscanceled' ,isEqualTo: idT ).get();
  //  }

   static Future<List<Tache>> getTache(String idT) async {
    QuerySnapshot query;
    
       query = await  FirebaseFirestore.instance.collectionGroup("tache").where('id',isEqualTo: idT).get();
    
    
    
     return query.docs.map((e){
       return Tache.fromQueryDocumentSnapshot(e);
     }).toList();
  }


 static Tache getUserTache2(String uid, String idT) {
     var list;
   list= getTache(idT);

    return list[0];

}
}