part of 'admission_payment_cubit.dart';

class AdmissionPaymentState extends Equatable {
  final String? selectionId;

  const AdmissionPaymentState({this.selectionId});

  AdmissionPaymentState copyWith({String? selectionId}) {
    return AdmissionPaymentState(
      selectionId: selectionId ?? this.selectionId,
    );
  }

  @override
  List<Object?> get props => [selectionId];
}
