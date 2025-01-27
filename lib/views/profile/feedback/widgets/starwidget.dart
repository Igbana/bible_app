import 'package:bible_app/imports.dart';

class StarWidget extends StatefulWidget {
  const StarWidget({
    super.key,
    required this.onChanged(value),
  });

  final Function(int) onChanged;

  @override
  State<StarWidget> createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 1; i <= 5; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                value = i;
                widget.onChanged(value);
              });
            },
            child: Icon(
              Icons.star,
              color: i <= value ? Colors.amber : Colors.grey,
              size: 36,
            ),
          ),
      ],
    );
  }
}
