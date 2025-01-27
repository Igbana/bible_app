import 'package:bible_app/imports.dart';

class FeedbackScreen extends GetView<BibleService> {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Feedback"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.star,
                  size: 36,
                ),
                Icon(
                  Icons.star,
                  size: 36,
                ),
                Icon(
                  Icons.star,
                  size: 36,
                ),
                Icon(
                  Icons.star,
                  size: 36,
                ),
                Icon(
                  Icons.star,
                  size: 36,
                ),
              ],
            ),
            const SizedBox(height: 36),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Write a feedback",
                ),
                maxLines: 6,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () {}, child: Text("Submit Feedback")),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
