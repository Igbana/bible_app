import 'package:bible_app/views/profile/about_us/about_us.dart';
import 'package:bible_app/views/profile/feedback/feedback.dart';
import 'package:bible_app/views/profile/saved_notes/saved_notes.dart';
import 'package:bible_app/views/profile/user_manual/user_manual.dart';

enum PageIndex { home, devotional, bible, profile }

const Map profileItems = {
  'Bookmarked Chapters': SavedNotesScreen(),
  'Bookmarked Devotionals': SavedNotesScreen(),
  'Saved Notes': SavedNotesScreen(),
  'Settings': SavedNotesScreen(),
  'About Us': AboutUsScreen(),
  'Feedback': FeedbackScreen(),
  'User Manual': UserManualScreen(),
};
