import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:projects3/src/daos/auth.dart';
import 'package:projects3/src/daos/project_dao.dart';
import 'package:projects3/src/daos/user_dao.dart';
import 'package:projects3/src/models/project.dart';
import 'package:projects3/src/models/tache.dart';
import 'package:provider/provider.dart';

class TacheDao extends ChangeNotifier{
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

  static Future<Tache> getUserTache(String uid, String idT) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection(UserDao.colName)
        .doc(uid)
        .collection(ProjectDao.colName)
        .doc("XNLAhDO4qShLX6ZgJFe0")
        .collection(colName)
        .doc(idT)
        .get();
    return Tache.fromDocumentSnapshot(doc);
  }

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
        .doc()
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

  static String get idP {
    return FirebaseFirestore.instance.collection(UserDao.colName).doc(Auth.uid).collection(ProjectDao.colName).id;
  }
}
