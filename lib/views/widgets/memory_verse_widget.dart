import 'package:bible_app/imports.dart';

class DevotionSubHeaders extends StatelessWidget {
  const DevotionSubHeaders({
    super.key,
    required this.title,
    this.text,
    this.child,
  });

  final String title;
  final String? text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
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
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (text != null)
            Text(
              text!,
              style: TextStyle(
                  color: Colors.grey[700], fontWeight: FontWeight.w500),
            ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
