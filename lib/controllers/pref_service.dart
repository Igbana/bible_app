import 'package:shared_preferences/shared_preferences.dart';

import '../imports.dart';

class PrefService extends GetxController {
  SharedPreferences? _pref;
  RxBool isloading = false.obs;
  Version selectedVersion = versions[0];
  RxBool isChanged = false.obs;
  late BibleReference reference;
  RxList searchResult = [].obs;

  void initPref() async {
    _pref = await SharedPreferences.getInstance();
  }

  void addNote(BibleReference ref, note) {
    if (note != "") {
      _pref?.setString(ref.toText(), note);
    } else {
      if (_pref!.containsKey(ref.toText())) _pref?.remove(ref.toText());
    }
  }

  bool hasNote(BibleReference ref) => _pref?.containsKey(ref.toText()) ?? false;

  String getNote(BibleReference ref) => _pref?.getString(ref.toText()) ?? "";
}
