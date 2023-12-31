import '../common/entities/course.dart';

abstract class HomePageEvents {
  const HomePageEvents();
}

class HomePageDots extends HomePageEvents {
  final int index;
  const HomePageDots(this.index) : super();
}

class HomePageCourseItemEvent extends HomePageEvents {
  final List<CourseItem> courseItem;
  const HomePageCourseItemEvent(this.courseItem);
}
