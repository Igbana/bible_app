import 'package:bible_app/imports.dart';
import 'package:http/http.dart' as http;

class DevotionService extends GetxController {
  RxBool isloading = false.obs;
  final _data = [].obs;
  RxList searchResult = [].obs;
  RxMap devotionData = {}.obs;

  void loadDevotions() async {
    isloading.value = true;
    final response = await http.get(
      Uri.parse("https://cpai.guidetryb.com/api/devotionals?month=January2025"),
    );
    if (response.statusCode == 200) {
      _data.value = await json.decode(response.body);
    }
    isloading.value = false;
  }

  void devotionToday() {
    isloading.value = true;
    String dateToday =
        "${DateTime.now().day}.${DateTime.now().year}.${DateTime.now().year}";
    for (Map devotional in _data) {
      if (devotional["date"] == dateToday) {
        devotionData.value = devotional['updateMap'];
      }
    }
    isloading.value = false;
  }
}
