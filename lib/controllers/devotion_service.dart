import 'package:bible_app/imports.dart';
import 'package:bible_app/models/devotional.dart';
import 'package:http/http.dart' as http;

class DevotionService extends GetxController {
  RxBool isloading = false.obs;
  final _data = [].obs;
  RxList searchResult = [].obs;
  RxMap devotionData = {}.obs;

  void loadDevotions() async {
    isloading.value = true;
    final response = await http.get(
        Uri.parse(
            "https://cpai.guidetryb.com/api/devotionals?month=January2025"),
        headers: {'Accept': 'application/json; charset=utf-8'});
    if (response.statusCode.toString()[0] == "2") {
      _data.value = await json.decode(response.body);
    } else {
      debugPrint("ERRORRRRRR");
    }
    isloading.value = false;
  }

  Devotional devotionToday() {
    isloading.value = true;
    String date = DateTime.now().toString().split(" ")[0];
    String dateFormatted = date.split("-").reversed.join(".");
    for (Map devotional in _data) {
      if (devotional["date"] == dateFormatted) {
        devotionData.value = devotional['updateMap'];
      }
    }
    isloading.value = false;
    return Devotional.fromJson(devotionData);
  }
}
