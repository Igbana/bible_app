import 'package:bible_app/views/profile/saved_notes/saved_notes.dart';

enum PageIndex { home, devotional, bible, profile }

const Map profileItems = {
  'Bookmarked Chapters': SavedNotes(),
  'Bookmarked Devotionals': SavedNotes(),
  'Saved Notes': SavedNotes(),
  'Settings': SavedNotes(),
  'About Us': SavedNotes(),
  'Feedback': SavedNotes(),
  'User Manual': SavedNotes(),
};
