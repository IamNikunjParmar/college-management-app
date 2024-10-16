import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/interceptor/interceptors.dart';
import 'package:college_management_app/src/package/resorces/appConstance.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:college_management_app/src/ui/auth/registration%20fee%20payment/registration_fee_payment.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toastification/toastification.dart';

part 'upload_document_state.dart';

class UploadDocumentCubit extends Cubit<UploadDocumentState> {
  UploadDocumentCubit(super.initialState, {required this.context}) {}

  final BuildContext context;
  final DioInterceptors dio = DioInterceptors();

  Future<void> uploadDocumentUser(String userId, String csatDoc, String studentPhoto, String dobDoc,
      String diplomaLatestMarkSheet, String frontSide, String backSide) async {
    try {
      final response = await dio.post(
        ApiEndPoints.uploadDocument,
        data: {
          'userId': userId,
          'csatDoc': csatDoc,
          'studentPhoto': studentPhoto,
          'dobDoc': dobDoc,
          'diplomaLatestMarksheet': diplomaLatestMarkSheet,
          'front': frontSide,
          'back': backSide,
        },
      );
      Log.info(response);
      final msg = response.data['message'];
      Log.info(msg);
      if (response.statusCode == 200) {
        Log.success('Document upload successful');
        _showToast(msg, Colors.green, Icons.check_circle);
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            RegistrationFeePayment.routeName,
            arguments: userId,
            (route) => true,
          );
        }
      } else {
        Log.error('Document upload failed: ${response.statusCode}');
        _showToast(msg.toString(), Colors.red, Icons.error);
      }
    } catch (e) {
      Log.error('Error during document upload: $e');
    }
  }

  Future<void> pickImage(TextEditingController controller) async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        final imagePath = pickedImage.path;
        final fileName = imagePath.split('/').last; // String file path create
        emit(state.copyWith(documentPath: imagePath));
        controller.text = fileName;
        Log.info(imagePath);
      } else {
        emit(state.copyWith(msg: 'No image selected'));
        Log.error("PickImageERROR ::: No image selected");
      }
    } catch (e) {
      emit(state.copyWith(msg: 'Error picking image: $e'));
      Log.error("PickImageERROR ::: ${e.toString()}");
    }
  }

  void _showToast(String message, Color backgroundColor, IconData icon) {
    toastification.show(
      autoCloseDuration: const Duration(seconds: 3),
      title: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Colors.white, size: 35),
    );
  }
}
