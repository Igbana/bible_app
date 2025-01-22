import 'package:bible_app/imports.dart';

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
