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
