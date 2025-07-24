import 'package:cloud_firestore/cloud_firestore.dart';

class FireStorePaginateResponse {
  final List? listData;
  final Map<String, dynamic>? docData;
  final DocumentSnapshot<Object?>? lastDocumentSnapshot;

  FireStorePaginateResponse({
    this.listData,
    this.docData,
    this.lastDocumentSnapshot,
  });
}
