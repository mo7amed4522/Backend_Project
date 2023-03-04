// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class DropMnueItemRegisterWidget extends StatelessWidget {
  String? value;
  void Function(String?)? onChanged;
  List<DropdownMenuItem<String>>? items;
  DropMnueItemRegisterWidget(
      {super.key, this.items, this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: false,
      hint: Text("Select Your Role"),
      value: value,
      onChanged: onChanged,
      items: items,
    );
  }
}
