import 'package:flutter/material.dart';

import 'package:flutter_rpg/screens/create/create.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/services/character_provider.dart';
import 'package:flutter_rpg/shared/style_text.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<CharacterProvider>(context, listen: false)
        .fetchCharactersOnce();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle(text: "Your Character"),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Consumer<CharacterProvider>(
                    builder: (context, value, child) {
                  return ListView.builder(
                    itemBuilder: (_, index) {
                      return Dismissible(
                          key: ValueKey(value.characters[index].id),
                          onDismissed: (direction) {
                            Provider.of<CharacterProvider>(context,
                                    listen: false)
                                .removeCharacter(value.characters[index]);
                          },
                          child: CharacterCard(
                              character: value.characters[index]));
                    },
                    itemCount: value.characters.length,
                  );
                }),
              ),
              const SizedBox(
                height: 30,
              ),
              StyledButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const CreateCharacter()));
                  },
                  child: const StyledHeadline(text: "Create New"))
            ],
          )),
    );
  }
}
