import 'package:bible_app/imports.dart';
import 'widgets/widgets.dart';

class FeedBackTray extends StatelessWidget {
  const FeedBackTray({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const TrayHeader(),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StarWidget(onChanged: (value) {}),
            const SizedBox(height: 36),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Write a feedback",
                ),
                maxLines: 6,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Submit Feedback"),
            ),
          ],
        ),
      ),
    ]);
  }
}

class TrayHeader extends StatelessWidget {
  const TrayHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
        const Text("Feedback"),
      ],
    );
  }
}
