import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget{
  final TextEditingController? controller;

  final String? hintText;

  final String? Function(String?)? validator;

  final TextInputType? textInputType;


  CustomTextFormField({Key? key,this.hintText,  this.controller,this.validator,this.textInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      keyboardType: textInputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      style: const TextStyle(color: Colors.grey, fontSize: 16),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
        contentPadding: const EdgeInsets.all(8),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 1)),
      ),
    );
  }


}