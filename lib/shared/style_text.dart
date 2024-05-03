import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  final String text;
  const StyledText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          GoogleFonts.kanit(textStyle: Theme.of(context).textTheme.bodyMedium),
    );
  }
}

class StyledHeadline extends StatelessWidget {
  final String text;
  const StyledHeadline({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.kanit(
          textStyle: Theme.of(context).textTheme.headlineMedium),
    );
  }
}

class StyledTitle extends StatelessWidget {
  final String text;
  const StyledTitle({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style:
          GoogleFonts.kanit(textStyle: Theme.of(context).textTheme.titleMedium),
    );
  }
}
