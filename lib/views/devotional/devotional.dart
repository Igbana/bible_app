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

// this.id,
// === required this.date,
// === required this.title,
// === required this.memoryVerse,
// === required this.memoryVersePassage,
// required this.fullPassage,
// required this.fullText,
// required this.bibleInAYear,
// required this.image,
// required this.prayerBurden,
// required this.thoughtOfTheDay,

class ReaderView extends GetView<DevotionService> {
  const ReaderView({super.key});

  @override
  Widget build(BuildContext context) {
    Devotional devotionToday = controller.devotionToday();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              devotionToday.date,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Obx(() {
              if (controller.isloading.value) {
                return const CircularProgressIndicator();
              } else {
                return Text(
                  devotionToday.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                );
              }
            }),
            DevotionSubHeaders(
                title: "Memory Verse",
                text:
                    "${devotionToday.memoryVerse}\n${devotionToday.memoryVersePassage}"),
            const SizedBox(height: 24),
            Obx(() {
              if (controller.isloading.value) {
                return const CircularProgressIndicator();
              } else {
                return Text(devotionToday.fullText);
              }
            }),
            const SizedBox(height: 24),
            const Text(
              "Prayer Burden",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(devotionToday.prayerBurden),
            const SizedBox(height: 24),
            DevotionSubHeaders(
              title: "Thought of the day",
              text: devotionToday.thoughtOfTheDay,
            ),
            const SizedBox(height: 6),
            const SizedBox(height: 24),
            DevotionSubHeaders(
              title: "Bible in a Year",
              text: devotionToday.bibleInAYear
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .replaceAll('"', "")
                  .replaceAll(",", ", "),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
