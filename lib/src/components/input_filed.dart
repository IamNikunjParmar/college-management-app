import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        // enabledBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(15),
        //   ),
        // ),
        // focusedBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(15),
        //   ),
        // ),
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
        // enabledBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(15),
        //   ),
        // ),
        // focusedBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(15),
        //   ),
        // ),
      ),
    );
  }
}
