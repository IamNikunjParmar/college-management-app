import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/data/modal/userDetailsModal/user_details_modal.dart';
import 'package:college_management_app/src/package/data/modal/userModal/user_modal.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'delete_user_account_state.dart';

class DeleteUserAccountCubit extends Cubit<DeleteUserAccountState> {
  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();
  DeleteUserAccountCubit(super.initialState, {required this.context});

  Future<void> deleteUserAccount(UserDetailsModal user) async {
    final response = await dio.delete(
      ApiEndPoints.deleteUserAccount,
      data: {'_id': user.id},
    );

    Log.debug("delete::: $response");
  }
}
