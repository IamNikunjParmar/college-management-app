import 'package:bloc/bloc.dart';
import 'package:college_management_app/src/package/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'register_page_state.dart';

class RegisterPageCubit extends Cubit<RegisterPageState> {
  RegisterPageCubit() : super(const RegisterPageState(currentStep: 0));

  updateStep(int step) {
    emit(state.copyWith(currentStep: step));
  }

  onStepContinue(int newStep) {
    if (state.currentStep != 1) {
      newStep += 1;
      emit(state.copyWith(currentStep: newStep));
    }
  }

  onStepCancel(int newStep) {
    if (state.currentStep > 0) {
      newStep -= 1;
      emit(state.copyWith(currentStep: newStep));
    }
  }
}
