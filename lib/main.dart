import 'imports.dart';

void main() {
  initControllers();
  runApp(
    const MaterialApp(
      home: SafeArea(
        child: App(),
      ),
    ),
  );
}
