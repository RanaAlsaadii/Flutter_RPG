import 'package:flutter/material.dart';
import 'package:flutter_rpg/theme.dart';

class StyledButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  const StyledButton({required this.onPressed, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.primaryAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.circular(5)),
          child: child,
        ));
  }
}
