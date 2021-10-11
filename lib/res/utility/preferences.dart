import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const UID = "uid";



  adduseruid({String uid = "" }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(UID, uid);
    print("user is saved ${uid}");
  }

  Future<String> getuseruid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(UID) ?? "";
  }

}
