export 'bible_service.dart';
import 'package:bible_app/imports.dart';

Future<void> initControllers() async {
  Get.put(BibleService());
}
