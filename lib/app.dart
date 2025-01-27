import 'imports.dart';

class App extends StatefulWidget {
  const App({super.key});

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
          : FloatingActionButton(
              backgroundColor: _currentIndex == 3
                  ? const Color.fromARGB(255, 94, 14, 8)
                  : null,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => switch (_currentIndex) {
                            1 => const NoteView(),
                            2 => const SearchView(),
                            _ => const NoteView(),
                          }),
                );
              },
              child: switch (_currentIndex) {
                2 => const Icon(Icons.search),
                3 => const Icon(Icons.logout, color: Colors.white),
                _ => const Icon(Icons.brush),
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) => setState(() => _currentIndex = value),
        items: [
          for (String item in tabItems.keys)
            BottomNavigationBarItem(
              icon: Icon(tabItems[item]),
              label: item,
              backgroundColor: Colors.black,
            ),
        ],
      ),
    );
  }
}
