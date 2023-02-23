// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CPopupMenuButton extends StatelessWidget {
  final List<PopupMenuItem<int>> items;
  void Function(int)? onSelected;
  final Widget? icon;
  final BoxConstraints? constraints;
  CPopupMenuButton({
    required this.items,
    required this.onSelected,
    this.icon,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: icon,
      constraints: constraints,
      itemBuilder: (BuildContext context) => items,
      onSelected: onSelected,
    );
  }
}
