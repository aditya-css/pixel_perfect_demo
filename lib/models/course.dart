import 'package:ppui_demo/values/app_assets.dart';

class Course {
  const Course({
    this.title,
    this.subtitle,
    this.description,
    this.duration,
    this.price,
    this.artwork,
  });

  final String? title;
  final String? subtitle;
  final String? description;
  final Duration? duration;
  final num? price;
  final String? artwork;
}

const courseList = [
  Course(
    title: 'UI',
    subtitle: 'Advanced mobile interface design',
    duration: Duration(hours: 3, minutes: 30),
    price: 50,
    artwork: AppAssets.course1,
  ),
  Course(
    title: 'Swift',
    subtitle: 'Advanced iOS apps',
    duration: Duration(hours: 1, minutes: 20),
    artwork: AppAssets.course2,
  ),
  Course(
    title: 'Scrum',
    subtitle: 'Advanced project organization course',
    duration: Duration(hours: 1, minutes: 20),
    artwork: AppAssets.course1,
  ),
  Course(
    title: 'HTML',
    description: "You can launch a new career in web development today by learning HTML & CSS. You don't need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust.",
    duration: Duration(hours: 1, minutes: 30),
    price: 50,
    artwork: AppAssets.courseDetail,
  ),
];
