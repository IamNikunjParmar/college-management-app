import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../package/data/modal/userDetailsModal/user_details_modal.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.autofocus = false,
    this.validator,
    this.autofillHints,
    this.textInputAction,
    this.onSubmitted,
    this.hintText,
    this.labelText,
    this.isReadOnly = false,
    this.suffix,
    this.onChanged,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final FormFieldValidator<String>? validator;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final ValueChanged? onSubmitted;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? labelText;
  final bool isReadOnly;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      readOnly: isReadOnly,
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: {...?autofillHints, AutofillHints.email},
      validator: validator,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      textInputAction: textInputAction,
      keyboardType: TextInputType.emailAddress,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        // prefixIcon: const Icon(Icons.email),
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffix,
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.autofocus = false,
    this.validator,
    this.autofillHints,
    this.onSubmitted,
    this.textInputAction,
    this.hintText,
    this.labelText,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final FormFieldValidator<String>? validator;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? labelText;
  final ValueChanged? onSubmitted;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      obscureText: !_isPasswordVisible,
      obscuringCharacter: "•",
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: widget.autofillHints,
      validator: widget.validator,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onSubmitted,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        errorMaxLines: 5,
        labelText: widget.labelText,
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
          icon: Icon(
            _isPasswordVisible ? Icons.remove_red_eye : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.validator,
    this.autofillHints,
    this.textInputAction,
    this.onSubmitted,
    this.hintText,
    this.labelText,
    this.isReadOnly = false,
    this.suffix,
    this.onChanged,
    this.keyBoardType,
    this.initialValue,
    this.enabled,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final FormFieldValidator<String>? validator;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final ValueChanged? onSubmitted;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? labelText;
  final bool isReadOnly;
  final Widget? suffix;
  final TextInputType? keyBoardType;
  final String? initialValue;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      readOnly: isReadOnly,
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: {...?autofillHints, AutofillHints.email},
      validator: validator,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      textInputAction: textInputAction,
      keyboardType: TextInputType.emailAddress,
      onFieldSubmitted: onSubmitted,
      initialValue: initialValue,
      enabled: enabled,
      decoration: InputDecoration(
        // prefixIcon: const Icon(Icons.email),
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffix,
      ),
    );
  }
}

class CustomPersonalDataWidget extends StatelessWidget {
  const CustomPersonalDataWidget({super.key, required this.userData});

  final UserDetailsModal? userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        CustomRowWidget(
          userData: userData,
          title: 'Date of Birth',
          subtitle: userData?.dateOfBirth ?? 'Loading...',
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Gender',
          subtitle: userData?.gender ?? 'Loading...',
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Mobile Number',
          subtitle: userData?.phoneNo.toString() ?? 'Loading...',
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Cast',
          subtitle: userData?.cast ?? 'Loading...',
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Father Name',
          subtitle: userData?.fatherName ?? 'Loading...',
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Mother Name',
          subtitle: userData?.motherName ?? 'Loading...',
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Country',
          subtitle: userData?.country ?? 'Loading...',
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'Address',
          subtitle: userData?.address ?? 'Loading...',
        ),
        const Gap(10),
        CustomRowWidget(
          userData: userData,
          title: 'PinCode',
          subtitle: userData?.pinCode.toString() ?? 'Loading...',
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

  final UserDetailsModal? userData;

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
