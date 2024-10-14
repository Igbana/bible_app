import 'package:bible_app/imports.dart';

class ReferenceButton extends StatelessWidget {
  const ReferenceButton({
    super.key,
    required this.reference,
    required this.onPressed,
  });

  final String reference;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(
          reference,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
