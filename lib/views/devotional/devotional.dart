import 'package:bible_app/controllers/devotion_service.dart';
import 'package:bible_app/imports.dart';
import 'package:bible_app/models/devotional.dart';
import 'package:bible_app/views/widgets/memory_verse_widget.dart';

class DevotionalView extends StatefulWidget {
  const DevotionalView({super.key, required this.goHome});
  final VoidCallback goHome;

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
        slivers: [
          HeaderView(goHome: widget.goHome),
          const ReaderView(),
        ],
      ),
    );
  }
}

class HeaderView extends StatelessWidget {
  const HeaderView({super.key, required this.goHome});
  final VoidCallback goHome;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.white,
      centerTitle: true,
      floating: true,
      title: const Text("Today's Devotion"),
      leading: IconButton(
        onPressed: goHome,
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

class ReaderView extends GetView<DevotionService> {
  const ReaderView({super.key});

  @override
  Widget build(BuildContext context) {
    Devotional devotionToday = controller.devotionToday();
    print(devotionToday);
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              devotionToday.date,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Obx(() {
              if (controller.isloading.value) {
                return CircularProgressIndicator();
              } else {
                print(devotionToday.title);
                return Text((devotionToday.title));
              }
            }),
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
