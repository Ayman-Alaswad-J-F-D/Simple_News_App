import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.textEditingController,
    required this.typeInput,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixPressed,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.validate,
    this.hintText,
    this.colorHintText,
    this.fintSizeHintText,
    this.radius = 8.0,
    this.gapPadding = 5.0,
    this.isPassword = false,
    this.filledneed = false,
    this.fillColor = AppColors.white,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final TextInputType typeInput;
  final String label;
  final double radius;
  final double gapPadding;
  final Icon? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixPressed;
  final Function()? onSubmit;
  final Function(String)? onChange;
  final Function()? onTap;
  final String? Function(String?)? validate;
  final bool isPassword;
  final bool filledneed;
  final Color fillColor;
  final String? hintText;
  final Color? colorHintText;
  final double? fintSizeHintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      controller: textEditingController,
      keyboardType: typeInput,
      obscureText: isPassword,
      style: TextStyle(color: Theme.of(context).textTheme.caption?.color),
      decoration: InputDecoration(
        filled: filledneed,
        fillColor: filledneed ? fillColor : AppColors.white,
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: AppFonts.primaty,
          fontSize: 18,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: colorHintText,
          fontSize: fintSizeHintText,
        ),
        // border: OutlineInputBorder(
        //   gapPadding: gapPadding,
        //   borderRadius: BorderRadius.all(Radius.circular(radius)),
        // ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcon,
                  color: Theme.of(context).iconTheme.color,
                ),
              )
            : null,
      ),
    );
  }
}
