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



// import 'package:dio/dio.dart';
// import 'package:elisha/ref/devotional.dart';
// import 'package:elisha/ref/devotional_plans.dart';
// import 'package:elisha/ref/youTube_video.dart';

// import '../models/note.dart';

// class RemoteAPI {
//   static Future<List<Note>> getUsersNotesFromFirebase() async {
//     var dio = Dio();
//     final response = await dio.get('https://cpai.guidetryb.com/api-secured/users/notes',
//         options: Options(
//           responseType: ResponseType.json,
//           followRedirects: false,
//           validateStatus: (status) => true,
//         ));
//     var json = response.data;
//     return noteFromJson(json);
//   }

//   static Future<List<Devotional>> getDevotionalsForMonth(monthYearName) async {
//     var dio = Dio();
//     final response = await dio.get('https://cpai.guidetryb.com/api/devotionals?month=$monthYearName',
//         options: Options(
//           responseType: ResponseType.json,
//           followRedirects: false,
//           validateStatus: (status) => true,
//         ));
//     var json = response.data;
//     print(json);
//     return devotionsFromJson(json);
//   }

//   static Future<List<YouTubeVideoModel>> getYouTubeVideos() async {
//     var dio1 = Dio();
//     final response1 = await dio1.get('https://cpai.guidetryb.com/api/videos',
//         options: Options(responseType: ResponseType.json, followRedirects: false, validateStatus: (status) => true));

//     var json = response1.data;
//     return youTubeVideoFromJson(json);
//   }

//   static Future<List<DevotionalPlan>> getDevotionalPlans() async {
//     try {
//       var dio2 = Dio();
//       final response2 = await dio2.get('https://cpai.guidetryb.com/api/study-plans',
//           options: Options(responseType: ResponseType.json, followRedirects: false, validateStatus: (status) => true));

//       var json = response2.data;
//       return devotionalPlansFromJson(json);
//     } catch (e) {
//       return [];
//     }
//   }

//   static Future<DevotionalPlan> getDevotionalPlanWithID(studyPlanID) async {
//     var dio3 = Dio();
//     final response3 = await dio3.get('https://cpai.guidetryb.com/api/study-plans/$studyPlanID',
//         options: Options(responseType: ResponseType.json, followRedirects: false, validateStatus: (status) => true));

//     var json = response3.data;
//     return devotionalPlanWithIDFromJson(json);
//   }

//   static Future<bool> deleteNoteWithID(noteID) async {
//     try {
//       var dio2 = Dio();
//       final response = await dio2.delete(
//         'https://cpai.guidetryb.com/api-secured/users/notes/$noteID',
//         options: Options(
//           responseType: ResponseType.json,
//           followRedirects: false,
//           validateStatus: (status) => true,
//         ),
//       );
//       print(response.statusCode);
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
// }
