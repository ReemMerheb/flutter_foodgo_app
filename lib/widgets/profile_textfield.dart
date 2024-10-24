import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isEditing;
  final bool isPassword;

  const ProfileTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isEditing = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
         
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey, 
            width: 1.0, 
          ),
           borderRadius: BorderRadius.circular(40)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 243, 33, 33), 
            width: 2.0, 
          ),
          borderRadius: BorderRadius.circular(40)
        ),
      ),
      obscureText: isPassword,
      enabled: isEditing, 
      controller: controller,
    );
  }
}
