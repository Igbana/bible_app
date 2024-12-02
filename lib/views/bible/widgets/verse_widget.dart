import 'package:bible_app/imports.dart';
import 'widgets.dart';

class VerseWidget extends StatefulWidget {
  const VerseWidget({
    super.key,
    required this.verse,
  });

  final Verse verse;

  @override
  State<VerseWidget> createState() => _VerseWidgetState();
}

class _VerseWidgetState extends State<VerseWidget> {
  @override
  Widget build(BuildContext context) {
    BibleService controller = Get.find();
    PrefService pref = Get.find();
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.verse.highlighted = !widget.verse.highlighted;
        });
      },
      onLongPress: () {
        setState(() {
          if (!widget.verse.highlighted) widget.verse.highlighted = true;
        });
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return VerseNoteTray(verse: widget.verse);
          },
        ).then((_) {
          setState(() {});
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text.rich(
          TextSpan(
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  height: 1.90,
                ),
            children: [
              TextSpan(
                text: "${widget.verse.id}. ",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
              ),
              TextSpan(
                text: widget.verse.text,
                style: widget.verse.highlighted
                    ? const TextStyle(
                        color: Colors.blue,
                        decorationColor: Colors.blue,
                        decoration: TextDecoration.underline,
                      )
                    : null,
              ),
              if (pref.hasNote(
                BibleReference(
                  book: controller.reference.book,
                  chapter: controller.reference.chapter,
                  startVerse: widget.verse.id,
                ),
              ))
                const WidgetSpan(
                  child: Icon(
                    Icons.textsms_outlined,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
