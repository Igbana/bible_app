export 'bible_service.dart';
export 'pref_controller.dart';
import 'package:bible_app/imports.dart';

Future<void> initControllers() async {
  Get.put(BibleService());
  Get.put(PrefController());
  PrefController().initController();
}
