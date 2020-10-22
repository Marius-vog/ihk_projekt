import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ihk_projekt/models/imageData.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<ImageData> getImageData(String docId) {
    return firestore
        .collection('ihk')
        .doc(docId)
        .snapshots()
        .map((event) => ImageData.fromMap(event.data()));
  }
}
