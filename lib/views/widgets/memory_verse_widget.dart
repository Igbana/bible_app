import 'package:bible_app/imports.dart';

class MemoryVerseWidget extends StatelessWidget {
  const MemoryVerseWidget({
    super.key,
    required this.ref,
  });

  final BibleReference ref;

  @override
  Widget build(BuildContext context) {
    // BibleService controller = Get.find();
    return Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 12,
        top: 4,
        bottom: 4,
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
            "${ref.book.name()} ${ref.chapter}:${ref.startVerse}",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "ref.",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style:
                TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
