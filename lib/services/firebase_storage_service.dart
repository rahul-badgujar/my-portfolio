import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  FirebaseStorageService._privateConstructor();
  static FirebaseStorageService _instance =
      FirebaseStorageService._privateConstructor();
  factory FirebaseStorageService() {
    return _instance;
  }

  Future<String> getDisplayPic() async {
    const filepath = "profile_img/dp.jpg";
    final Reference firestorageRef = FirebaseStorage.instance.ref();
    final url = await firestorageRef.child(filepath).getDownloadURL();
    return url;
  }
}
