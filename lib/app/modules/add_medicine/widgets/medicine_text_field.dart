import 'package:flutter/material.dart';

import '../../../shared/contstant/color_manager.dart';

class MedicineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;

  const MedicineTextField(
      {super.key, required this.controller, required this.label, required this.hint, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: ColorManager.kPrimary,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
