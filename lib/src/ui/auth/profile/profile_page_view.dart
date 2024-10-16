import 'package:college_management_app/src/package/data/modal/userModal/user_modal.dart';
import 'package:college_management_app/src/package/utils/images_utils.dart';
import 'package:college_management_app/src/ui/auth/edit%20profile/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../logic/auth/profile/profile_page_cubit.dart';

class ProfilePageView extends StatelessWidget {
  static const String routeName = "profile_page_view";
  ProfilePageView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilePageCubit(),
      child: ProfilePageView(),
    );
  }

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    UserModal? userData = ModalRoute.of(context)!.settings.arguments as UserModal?;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: const Offset(-15, 50),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                  ),
                ),
              ),
              Column(
                children: [
                  Center(
                    child: SafeArea(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        child: Image.asset(ImagePath.profilePic),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Text(
                    userData?.studentName ?? 'userName not found',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    userData?.courseName ?? 'userName not found',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Text(
                    userData?.email ?? 'userName not found',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userData?.city ?? 'not found',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Text(
                        ',',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Text(
                        userData?.country ?? 'not found',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  SizedBox(
                    height: 40, // Set the desired height
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(EditProfileView.routeName, (route) => true);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: const Text("Edit Profile"),
                    ),
                  ),
                ],
              ),
              const Gap(15),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.9),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Personal Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              CustomPersonalDataWidget(userData: userData),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPersonalDataWidget extends StatelessWidget {
  const CustomPersonalDataWidget({
    super.key,
    required this.userData,
  });

  final UserModal? userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        CustomRowWidget(
          userData: userData,
          title: 'Date of Birth',
          subtitle: userData?.dateOfBirth,
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Gender',
          subtitle: userData?.gender,
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Mobile Number',
          subtitle: userData?.phoneNo.toString(),
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Cast',
          subtitle: userData?.cast,
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Father Name',
          subtitle: userData?.fatherName,
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Mother Name',
          subtitle: userData?.motherName,
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Country',
          subtitle: userData?.country,
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Address',
          subtitle: userData?.address,
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'PinCode',
          subtitle: userData?.pinCode.toString(),
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'physicallyHandicapped',
          subtitle: userData?.physicallyHandicapped,
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Annual Income',
          subtitle: userData?.familyAnnualIncome,
        ),
      ],
    );
  }
}

class CustomRowWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const CustomRowWidget({
    super.key,
    required this.userData,
    this.title,
    this.subtitle,
  });

  final UserModal? userData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title : ',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
        ),
        Text(
          subtitle ?? ' not found',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
