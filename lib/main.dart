import 'imports.dart';

void main() {
  initControllers();
  // Get.find<BibleService>().loadBible();
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
        0 => const BibleView(),
        1 => const DevotionalView(),
        _ => null,
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Scaffold(body: const DevotionalView()),
            ),
          );
        },
        child: const Icon(Icons.brush),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) => setState(() => _currentIndex = value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Devotional",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Bible",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
