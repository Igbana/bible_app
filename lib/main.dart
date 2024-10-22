import 'imports.dart';

void main() {
  initControllers();
  Get.find<BibleService>().loadBible();
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(primaryColor: Colors.blue),
      home: const SafeArea(
        child: Scaffold(body: BibleView()),
      ),
    ),
  );
}
