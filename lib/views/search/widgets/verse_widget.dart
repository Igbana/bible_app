import 'package:bible_app/models/models.dart';
import 'widgets.dart';

class VerseWidget extends StatelessWidget {
  const VerseWidget({
    super.key,
    required this.ref,
  });

  final BibleReference ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 4,
            color: Colors.blue,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "${ref.book.name()} ${ref.chapter}:${ref.verses[0].id}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(ref.verses[0].text),
        ],
      ),
    );
  }
}
