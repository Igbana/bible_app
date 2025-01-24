import 'package:bible_app/imports.dart';
import 'package:bible_app/views/widgets/memory_verse_widget.dart';

class DevotionalView extends StatefulWidget {
  const DevotionalView({super.key});

  @override
  State<DevotionalView> createState() => _DevotionalView();
}

class _DevotionalView extends State<DevotionalView> {
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

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.white,
      centerTitle: true,
      floating: true,
      title: const Text("Today's Devotion"),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.calendar_month,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}

class ReaderView extends StatelessWidget {
  const ReaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Monday, December 2, 2024",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            MemoryVerseWidget(
              ref: BibleReference(
                book: Book(id: 1),
                chapter: 1,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "sjfhjdfhjahdkjad",
            ),
          ],
        ),
      ),
    );
  }
}

