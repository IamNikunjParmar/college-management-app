part of 'upload_document_cubit.dart';

class UploadDocumentState extends Equatable {
  final String documentPath;
  final String msg;
  final File? selectedImage;

  const UploadDocumentState({this.documentPath = '', this.msg = '', this.selectedImage});

  UploadDocumentState copyWith({String? documentPath, String? msg, File? selectedImage}) {
    return UploadDocumentState(
      documentPath: documentPath ?? this.documentPath,
      msg: msg ?? this.msg,
      selectedImage: selectedImage ?? this.selectedImage,
    );
  }

  @override
  List<Object?> get props => [
        documentPath,
        msg,
        selectedImage,
      ];
}
