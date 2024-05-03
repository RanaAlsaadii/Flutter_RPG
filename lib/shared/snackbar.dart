import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/style_text.dart';
import 'package:flutter_rpg/theme.dart';

void showSnackBar(context, content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: StyledText(
      text: content,
    ),
    duration: const Duration(seconds: 1),
    showCloseIcon: true,
    backgroundColor: AppColors.secondaryColor,
  ));
}
