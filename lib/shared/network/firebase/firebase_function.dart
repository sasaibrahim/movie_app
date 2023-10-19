import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/PopularResponse.dart';

class FireBaseFunctions {
  CollectionReference<PopularResponse> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection('movie')
        .withConverter<PopularResponse>(
            fromFirestore: (snapshot, _) =>
                PopularResponse.fromJson(snapshot.data()!),
            toFirestore: (movie, options) => movie.toJson());
  }

  void addTask(PopularResponse response) {
    var collection = getTasksCollection();
    var docRef = collection.doc();

    response.results = docRef.id as List<Results>?;

    docRef.set(response);
  }
}
