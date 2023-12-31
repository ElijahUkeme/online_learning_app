import 'package:online_learning_app/common/entities/entities.dart';
import 'package:online_learning_app/constants/constants.dart';
import 'package:online_learning_app/utils/network_request_utils.dart';

class AppApi {
  static login({LoginRequestEntity? loginRequestEntity}) async {
    var response = await NetworkRequestUtil().post(
      AppConstants.LOGIN_URL,
      data: loginRequestEntity!.toJson(),
    );
    print("The response from the api is $response");
    return UserLoginResponseEntity.fromJson(response);
  }
}
