import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:equatable/equatable.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(LoginPageState());

  final DioInterceptors dio = DioInterceptors();

  Future<void> loginUser(String email, String password) async {
    try {
      emit(state.copyWith(verifyEmail: true));
      final response = await dio.post(ApiEndPoints.loginUser, data: {
        'email': email,
        'password': password,
      });
      Log.info(response);
      if (response.statusCode == 200) {
        Log.success("Login successfully");
      } else {
        Log.error("Invalid email or password");
      }
    } catch (e) {
      Log.error("Error during login: $e");
      Log.info(e.toString());
    }
  }
}
