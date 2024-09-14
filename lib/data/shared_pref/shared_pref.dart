import 'package:absensi/data/repository/shared_pref_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference implements SharedPrefRepository {
  @override
  Future<List<String>?> getDataLogin() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getStringList("dataLogin");
  }

  @override
  Future<void> removeDataLogin() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    await sharedPref.remove("dataLogin");
  }

  @override
  Future<bool> saveDataLogin(List<String> user) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setStringList("dataLogin", user);
    return true;
  }
}
