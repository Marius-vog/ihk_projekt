import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadService {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future uploadFile(File image) async {
    // firebaseFirestore
    //     .doc("photos/YkPkOcwF1nZNgCzczN1E")
    //     .get()
    //     .then((value) => print(value.data())
    var docId = DateTime.now().toIso8601String();
    StorageReference storageReference = firebaseStorage.ref().child(docId);
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    print('File Uploaded');
    return docId;
  }
}
