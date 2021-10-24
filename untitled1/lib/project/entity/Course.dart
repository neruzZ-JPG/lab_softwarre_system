import 'package:untitled1/project/common/HttpUtil.dart';
import 'package:untitled1/project/entity/Major.dart';
import 'package:untitled1/project/utils/Request.dart';

class Course{
  int course_id;
  int major_id;
  Major major;
  String course_name;
  String course_term;
  int course_hour;
  int course_class_hold;
  int course_hold;

  Course({
   this.course_class_hold,
   this.course_hold,
    this.course_hour,
    this.course_id,
    this.course_name,
    this.course_term,
    this.major_id,
});


  factory Course.fromJson(Map<String, dynamic> parsedJson){
    return new Course(
      course_class_hold: parsedJson["course_class_hold"],
      course_hold: parsedJson["course_hold"],
      course_hour: parsedJson["course_hour"],
      course_id: parsedJson["course_id"],
      course_name: parsedJson["course_name"],
      course_term: parsedJson["course_term"],
      major_id: parsedJson["major_id"],
    );;
  }
}