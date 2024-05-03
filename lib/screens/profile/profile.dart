import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/heart.dart';
import 'package:flutter_rpg/screens/profile/skill_list.dart';
import 'package:flutter_rpg/screens/profile/stats_table.dart';
import 'package:flutter_rpg/services/character_provider.dart';
import 'package:flutter_rpg/shared/snackbar.dart';
import 'package:flutter_rpg/shared/style_text.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({required this.character, super.key});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeadline(text: character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.secondaryColor.withOpacity(0.3),
                  child: Row(
                    children: [
                      Hero(
                        tag: character.id.toString(),
                        child: Image.asset(
                          "assets/img/vocations/${character.vocation.image}",
                          width: 140,
                          height: 140,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyledHeadline(text: character.vocation.title),
                            StyledText(text: character.vocation.description)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 10, right: 10, child: Heart(character: character))
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            Center(
              child: Icon(
                Icons.code,
                color: AppColors.primaryAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeadline(text: "Slogan"),
                    StyledText(text: character.slogan),
                    const SizedBox(
                      height: 10,
                    ),
                    const StyledHeadline(text: "Weapon of Choice"),
                    StyledText(text: character.vocation.weapon),
                    const SizedBox(
                      height: 10,
                    ),
                    const StyledHeadline(text: "Unique Ability"),
                    StyledText(text: character.vocation.ability),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),

            // stats and skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [StatsTable(character), SkillList(character)],
              ),
            ),

            StyledButton(
                onPressed: () {
                  Provider.of<CharacterProvider>(context, listen: false)
                      .saveCharacter(character);
                  showSnackBar(context, "Character was Saved.");
                },
                child: const StyledHeadline(text: "Save character")),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
