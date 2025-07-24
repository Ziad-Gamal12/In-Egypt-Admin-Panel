import 'package:cloud_firestore/cloud_firestore.dart';

class FireStorePaginateResponse {
  final List? listData;
  final Map<String, dynamic>? docData;
  final DocumentSnapshot<Object?>? lastDocumentSnapshot;
  final bool? hasMore;
  FireStorePaginateResponse({
    this.listData,
    this.docData,
    this.lastDocumentSnapshot,
    this.hasMore,
  });
}
