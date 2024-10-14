import 'package:bible_app/views/views.dart';
import 'widgets.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.white,
      centerTitle: true,
      floating: true,
      title: const BibleNavigation(),
      leading:
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SearchView(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}
