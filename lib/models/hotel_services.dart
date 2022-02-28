import 'package:cloud_firestore/cloud_firestore.dart';

class HotelServices {

  Stream<QuerySnapshot> hotels = FirebaseFirestore.instance.collection('Hotel').snapshots();

  // Future<DocumentSnapshot> getHotelDetails(sellerUid) async {
  //   DocumentSnapshot snapshot = await hotels.doc(sellerUid).get();
  //   return snapshot;
  // }
}
