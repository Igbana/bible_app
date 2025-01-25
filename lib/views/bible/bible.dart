import 'widgets/widgets.dart';

class BibleView extends StatefulWidget {
  const BibleView({super.key, required this.goHome});
  final VoidCallback goHome;

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
        slivers: [
          HeaderView(goHome: widget.goHome),
          const ReaderView(),
        ],
      ),
    );
  }
}
