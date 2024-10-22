import 'package:bible_app/imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefController extends GetxController {
  late SharedPreferences pref;
  RxString note = "".obs;

  void initController() async {
    pref = await SharedPreferences.getInstance();
  }

  void addNote({required BibleReference ref, required String note}) async {
    await pref.setString(
      "${ref.book.id}, ${ref.chapter}, ${ref.startVerse}",
      note,
    );
  }

  void getNote({required BibleReference ref}) async {
    note.value = pref.getString(
          "${ref.book.id}, ${ref.chapter}, ${ref.startVerse}",
        ) ??
        "";
  }

}
