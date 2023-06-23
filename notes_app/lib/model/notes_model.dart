import 'package:intl/intl.dart';

class NotesModel {
  final String title;
  final String content;
  final String category;
  final String catTitle;
  final DateTime dateTime;

  NotesModel({
    required this.title,
    required this.content,
    required this.category,
    required this.catTitle,
    required this.dateTime,
  });
  String getFormattedDateTime() {
    return DateFormat('yyyy-MM-dd hh:mm a').format(dateTime);
  }
}

List<NotesModel> note = [
  NotesModel(
    title: 'How to be Sucessfull ? ',
    content:
        'Achieving success requires setting clear goals, developing a growth mindset, working hard, and staying persistent. Taking calculated risks, building a strong support network, and practicing discipline and time management are also essential. Embracing resilience, adaptability, and maintaining a positive mindset are crucial for overcoming challenges. Networking, maintaining well-being, and staying true to oneself are also important factors. Success is a personal journey, so define your own version of success and enjoy the process of working towards your goals.',
    category: 'Lifestyle',
    catTitle: 'Goal Setting ',
    dateTime: DateTime.now(),
  ),
];
