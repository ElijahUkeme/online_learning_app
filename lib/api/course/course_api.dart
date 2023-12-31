import 'package:online_learning_app/common/entities/course.dart';
import 'package:online_learning_app/constants/constants.dart';
import 'package:online_learning_app/utils/network_request_utils.dart';

import '../../common/entities/base.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await NetworkRequestUtil().getData(AppConstants.COURSE_URL);
    print("The response from the get method is $response");
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseDetailResponseEntity> courseDetail(
      {CourseRequestEntity? params}) async {
    var response = await NetworkRequestUtil().post(
        AppConstants.COURSE_DETAIL_URL,
        queryParameters: params?.toJson());
    print("The response from the get method in the api class is $response");
    return CourseDetailResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> coursePay(
      {CourseRequestEntity? params}) async {
    var response = await NetworkRequestUtil()
        .post("api/checkout", queryParameters: params!.toJson());

    return BaseResponseEntity.fromJson(response);
  }
}
