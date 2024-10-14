import 'package:bible_app/imports.dart';
import 'widgets/widgets.dart';

class BibleView extends StatefulWidget {
  const BibleView({
    super.key,
    // this.passage,
  });

  // final BibleReference? passage;

  @override
  State<BibleView> createState() => _BibleViewState();
}

class _BibleViewState extends State<BibleView> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: const [
          HeaderView(),
          ReaderView(),
        ],
      ),
    );
  }
}
