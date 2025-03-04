import 'package:firebase_auth/firebase_auth.dart';

abstract class UiDataSource {
  Future<bool> logoutUser();
}

// --------------------------------
// Need to be implemented
// --------------------------------
class UiDataSourceImpl implements UiDataSource {
  @override
  Future<bool> logoutUser() async {
    // TODO: implement logoutUser
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
