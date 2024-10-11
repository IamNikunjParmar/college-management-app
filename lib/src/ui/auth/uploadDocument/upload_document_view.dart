import 'package:college_management_app/src/logic/auth/upload%20Document/upload_document_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocumentView extends StatelessWidget {
  static const String routeName = "upload_document_view";
  UploadDocumentView({super.key});

  final _csatDocController = TextEditingController();
  final _studentPhotoController = TextEditingController();
  final _dobDocController = TextEditingController();
  final _diplomaLatestMarkSheetController = TextEditingController();
  final _frontSideController = TextEditingController();
  final _backSideController = TextEditingController();

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadDocumentCubit(
        const UploadDocumentState(),
        context: context,
      ),
      child: UploadDocumentView(),
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    String? userId;

    // this code for Map convert for String Id;
    if (args is Map<String, dynamic> && args.containsKey('_id')) {
      userId = args['_id'].toString();
    } else {
      print('Invalid arguments passed to UploadDocumentView');
      userId = null;
    }
    return BlocBuilder<UploadDocumentCubit, UploadDocumentState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Upload Document"),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Gap(10),
                  // Text(
                  //   userId ?? '',
                  //   style: const TextStyle(
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 14,
                  //   ),
                  // ),
                  TextFormField(
                    controller: _csatDocController,
                    decoration: const InputDecoration(labelText: 'Cast Document'),
                    onTap: () => context.read<UploadDocumentCubit>().pickImage(_csatDocController),
                    readOnly: true,
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: _studentPhotoController,
                    decoration: const InputDecoration(labelText: 'Student Photo'),
                    onTap: () => context.read<UploadDocumentCubit>().pickImage(_studentPhotoController),
                    readOnly: true,
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: _dobDocController,
                    decoration: const InputDecoration(labelText: 'DOB Document'),
                    onTap: () => context.read<UploadDocumentCubit>().pickImage(_dobDocController),
                    readOnly: true,
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: _diplomaLatestMarkSheetController,
                    decoration: const InputDecoration(labelText: 'Diploma Latest MarkSheet'),
                    onTap: () => context.read<UploadDocumentCubit>().pickImage(_diplomaLatestMarkSheetController),
                    readOnly: true,
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: _frontSideController,
                    decoration: const InputDecoration(labelText: 'Front Side'),
                    onTap: () => context.read<UploadDocumentCubit>().pickImage(_frontSideController),
                    readOnly: true,
                  ),
                  const Gap(20),
                  TextFormField(
                    controller: _backSideController,
                    decoration: const InputDecoration(labelText: 'Back Side'),
                    onTap: () => context.read<UploadDocumentCubit>().pickImage(_backSideController),
                    readOnly: true,
                  ),
                  const Gap(50),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<UploadDocumentCubit>().uploadDocumentUser(
                                userId!,
                                _csatDocController.text,
                                _studentPhotoController.text,
                                _dobDocController.text,
                                _diplomaLatestMarkSheetController.text,
                                _frontSideController.text,
                                _backSideController.text,
                              );
                        }
                      },
                      child: const Text('Upload Document'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
