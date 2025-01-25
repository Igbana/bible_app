import 'package:bible_app/imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.showDevotional});

  final VoidCallback showDevotional;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text(
            "Secret Place",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: const [
            StreakWidget(),
            SizedBox(width: 8),
            CircleAvatar(),
            SizedBox(width: 12),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const GreetingWidget(),
                  const SizedBox(height: 24),
                  VerseOfDayWidget(
                    ref: BibleReference(
                      book: Book.fromName("Galatians"),
                      chapter: 4,
                      startVerse: 6,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () => showDevotional(),
                    child: const DevotionalWidget(),
                  ),
                  const SizedBox(height: 24),
                  const HorizontalScrollWidget(title: "Study Plans"),
                  const SizedBox(height: 24),
                  const HorizontalScrollWidget(title: "Messages"),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class HorizontalScrollWidget extends StatelessWidget {
  const HorizontalScrollWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeHeader(title: title),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return const HomeCard();
            },
          ),
        )
      ],
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class DevotionalWidget extends StatelessWidget {
  const DevotionalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HomeHeader(title: "Today's Devotional"),
          const Text(
            "Adoption as sons",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.only(
              left: 10,
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
            child: Text(
              "The Spirit of God led us out of bondage into sonship. The Holy Spirit is the down pament that assures us of the adoption that we have. It is because we have God's Spirit that we can be sure that we are indeed children of God.",
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const DevotionalCardFooter()
        ],
      ),
    );
  }
}

class DevotionalCardFooter extends StatelessWidget {
  const DevotionalCardFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.bookmark_border_outlined,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
          ),
        ),
      ],
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.ios_share),
        )
      ],
    );
  }
}

class VerseOfDayWidget extends GetView<BibleService> {
  const VerseOfDayWidget({
    super.key,
    required this.ref,
  });

  final BibleReference ref;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const VerseOfDay();
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Hero(
                  tag: "verse_title",
                  child: Text(
                    "Verse of the day",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.ios_share),
                )
              ],
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage("assets/img.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Obx(() {
                  if (controller.isloading.value) {
                    return const VerseSkeleton();
                  } else {
                    Verse verse = controller.getVerse(
                      book: ref.book,
                      chapter: ref.chapter,
                      verse: ref.startVerse,
                    );
                    return Column(
                      children: [
                        Text(
                          verse.text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "${ref.book.name()} ${ref.chapter}:${ref.startVerse}",
                          style: const TextStyle(
                            // color: Colors.black,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerseSkeleton extends StatelessWidget {
  const VerseSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkeletonBar(margin: EdgeInsets.fromLTRB(0, 0, 12, 4)),
        SkeletonBar(margin: EdgeInsets.only(bottom: 4)),
        SkeletonBar(width: 100, margin: EdgeInsets.only(bottom: 4)),
        SizedBox(height: 4),
        SkeletonBar(height: 24, width: 120),
      ],
    );
  }
}

class SkeletonBar extends StatelessWidget {
  const SkeletonBar({
    super.key,
    this.width,
    this.height,
    this.margin,
  });

  final double? width, height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: height,
      margin: margin,
      duration: const Duration(milliseconds: 400),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Good morning,",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "Igbana Israel",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class StreakWidget extends StatelessWidget {
  const StreakWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.topRight,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: Color.fromARGB(255, 190, 190, 190),
          child: CircleAvatar(radius: 13, child: Text("1")),
        ),
        Positioned(
            right: -4,
            top: -4,
            child: Icon(
              Icons.bolt,
              size: 20,
              color: Color.fromARGB(255, 2, 54, 97),
            ))
      ],
    );
  }
}
