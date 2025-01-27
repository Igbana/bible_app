import 'package:bible_app/imports.dart';

class SettingsPage extends GetView<BibleService> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Settings"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 32),
            SettingWidget(title: "Theme", status: "System Default"),
            SizedBox(height: 18),
            SettingWidget(title: "Daily Reminder", status: "06:00am"),
            SizedBox(height: 18),
            SettingWidget(title: "Do not disturb", status: "Off"),
          ],
        ),
      ),
    );
  }
}

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key, required this.title, required this.status});

  final String title, status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            status,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
