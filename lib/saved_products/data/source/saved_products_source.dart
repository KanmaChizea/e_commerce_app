import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ISavedProductDataSource {
  Future<void> addToSaved(int id);
  Future<void> deleteFromSaved(int id);
  Future<void> clearAll();
  Stream<List> savedProducts();
}

class SavedProductDataSource implements ISavedProductDataSource {
  final docRef = FirebaseFirestore.instance
      .collection('saved')
      .doc(FirebaseAuth.instance.currentUser?.uid);
  @override
  Future<void> addToSaved(int id) async {
    await docRef.update({
      'saved': FieldValue.arrayUnion([id])
    });
  }

  @override
  Future<void> clearAll() async {
    await docRef.update({'saved': []});
  }

  @override
  Future<void> deleteFromSaved(int id) async {
    await docRef.update({
      'saved': FieldValue.arrayRemove([id])
    });
  }

  @override
  Stream<List> savedProducts() {
    return docRef.snapshots().map((doc) {
      return doc['saved'] as List;
    });
  }
}
