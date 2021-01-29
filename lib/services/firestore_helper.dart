import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_portfolio/models/BasicDetails.dart';
import 'package:my_portfolio/models/ProjectDetails.dart';

class FirestoreHelper {
  FirestoreHelper._private();
  static FirestoreHelper _instance = FirestoreHelper._private();
  factory FirestoreHelper() {
    return _instance;
  }

  FirebaseFirestore _firebaseFirestore;
  FirebaseFirestore get firestore {
    if (_firebaseFirestore == null) {
      _firebaseFirestore = FirebaseFirestore.instance;
    }
    return _firebaseFirestore;
  }

  // my-data collection
  static const String MY_DATA_COLLECTION_NAME = "my-data";
  static const String DATA_DOC_ID = "basic";
  static const String RESUME_DOC_ID = "resume";

  Future<BasicDetails> getMyBasicData() async {
    final docSnapshot = await firestore
        .collection(MY_DATA_COLLECTION_NAME)
        .doc(DATA_DOC_ID)
        .get();
    return BasicDetails.fromMap(docSnapshot.data());
  }

  // projects collection
  static const String PROJECTS_COLLECTION_NAME = "projects";

  Future<List<ProjectDetails>> getMyProjectsList() async {
    final querySnapshot =
        await firestore.collection(PROJECTS_COLLECTION_NAME).get();
    List<ProjectDetails> projects = [];
    for (final doc in querySnapshot.docs) {
      projects.add(ProjectDetails.fromMap(doc.data()));
    }
    return projects;
  }
}
