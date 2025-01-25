import 'package:bible_app/views/home/home.dart';
import 'package:bible_app/views/notes/notes.dart';
import 'package:bible_app/views/profile/profile.dart';

import 'imports.dart';

void main() {
  initControllers();
  runApp(
    const MaterialApp(
      home: SafeArea(
        child: App(),
      ),
    ),
  );
}

class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (_currentIndex) {
        0 => HomeView(showDevotional: () {
            setState(() {
              _currentIndex = 1;
            });
          }),
        1 => DevotionalView(goHome: () {
            setState(() {
              _currentIndex = 0;
            });
          }),
        2 => BibleView(goHome: () {
            setState(() {
              _currentIndex = 0;
            });
          }),
        3 => ProfileView(goHome: () {
            setState(() {
              _currentIndex = 0;
            });
          }),
        _ => null,
      },
      floatingActionButton: _currentIndex == 0
          ? null
          : Hero(
              tag: "noteHero",
              child: FloatingActionButton(
                backgroundColor: _currentIndex == 3
                    ? const Color.fromARGB(255, 94, 14, 8)
                    : null,
                heroTag: null,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => switch (_currentIndex) {
                              1 => NoteView(),
                              2 => SearchView(),
                              _ => NoteView(),
                            }),
                  );
                },
                child: switch (_currentIndex) {
                  2 => const Icon(Icons.search),
                  3 => const Icon(Icons.logout, color: Colors.white),
                  _ => const Icon(Icons.brush),
                },
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) => setState(() => _currentIndex = value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Devotional",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Bible",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
