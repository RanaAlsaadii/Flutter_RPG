import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/shared/style_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class VocationCard extends StatelessWidget {
  const VocationCard(
      {required this.selected,
      required this.onTap,
      required this.vocation,
      super.key});
  final Vocation vocation;
  final Function(Vocation) onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(vocation);
      },
      child: Card(
        color: selected ? AppColors.secondaryColor : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                "assets/img/vocations/${vocation.image}",
                width: 80,
                colorBlendMode: BlendMode.color,
                color: selected
                    ? Colors.transparent
                    : Colors.black.withOpacity(0.8),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledHeadline(text: vocation.title),
                  StyledText(text: vocation.description)
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
