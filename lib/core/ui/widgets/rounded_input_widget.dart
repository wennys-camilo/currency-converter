import '../themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedInputWidget extends StatelessWidget {
  final String? hintText;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final String? labelText;
  final String? prefix;
  final Color? fillColor;
  final TextEditingController? controller;
  const RoundedInputWidget({
    Key? key,
    this.inputFormatters,
    this.onChanged,
    this.labelText,
    this.controller,
    this.fillColor,
    this.hintText,
    this.focusNode,
    this.prefix,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        inputFormatters: inputFormatters,
        autocorrect: false,
        cursorColor: AppColors.primary,
        keyboardType: keyboardType,
        focusNode: focusNode,
        style: TextStyle(color: AppColors.grey, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelText: labelText,
          prefix: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              prefix ?? '',
              style: TextStyle(color: AppColors.grey),
            ),
          ),
          fillColor: fillColor ?? AppColors.white,
          isDense: true,
          filled: true,
          hintText: hintText,
          labelStyle: TextStyle(color: AppColors.grey),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.grey,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
