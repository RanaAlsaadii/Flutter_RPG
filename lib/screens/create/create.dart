import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_provider.dart';
import 'package:flutter_rpg/shared/style_text.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateCharacter extends StatefulWidget {
  const CreateCharacter({super.key});

  @override
  State<CreateCharacter> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CreateCharacter> {
  final characterNameController = TextEditingController();
  final characterSloganController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    characterNameController.dispose();
    characterSloganController.dispose();
  }

  void submitHandle() {
    if (characterNameController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeadline(text: "Missing Character Name!"),
              content: const StyledText(
                  text: "Every good RPG character needs a great name..."),
              actions: [
                StyledButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const StyledHeadline(text: "Close"))
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });

      return;
    }
    if (characterSloganController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeadline(text: "Missing Slogan!"),
              content:
                  const StyledText(text: "Remember to add a catchy slogan..."),
              actions: [
                StyledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const StyledHeadline(text: "Close"))
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });

      print("slogan must not be empty");
      return;
    }

    // characters.add(Character(
    //     name: characterNameController.text,
    //     slogan: characterSloganController.text,
    //     vocation: selectedVocation,
    //     id: uuid.v4()));

    Provider.of<CharacterProvider>(context, listen: false).addCharacter(
        Character(
            name: characterNameController.text,
            slogan: characterSloganController.text,
            vocation: selectedVocation,
            id: uuid.v4()));
    // Navigator.pop(
    //   context,
    //   MaterialPageRoute(builder: (ctx) => const Home()),
    // );

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Home()));

    // Navigator.popAndPushNamed(context, routeName)
  }

  // handle vocation selection

  Vocation selectedVocation = Vocation.ninja;

  updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });

    print(selectedVocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle(text: "Character Creation"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeadline(text: 'Welcome, new player.'),
              ),
              const Center(
                child: StyledText(
                    text: 'Create a name & slogan for your character.'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: characterNameController,
                style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.bodyMedium),
                decoration: const InputDecoration(
                    label: StyledText(text: "Character name"),
                    prefixIcon: Icon(Icons.person_2)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: characterSloganController,
                style: GoogleFonts.kanit(
                    textStyle: Theme.of(context).textTheme.bodyMedium),
                decoration: const InputDecoration(
                    label: StyledText(text: "Character slogan"),
                    prefixIcon: Icon(Icons.chat)),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeadline(text: 'Choose a vocation.'),
              ),
              const Center(
                child:
                    StyledText(text: 'This determines your available skills.'),
              ),
              const SizedBox(
                height: 30,
              ),
              VocationCard(
                vocation: Vocation.ninja,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.ninja,
              ),
              VocationCard(
                vocation: Vocation.junkie,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.junkie,
              ),
              VocationCard(
                vocation: Vocation.raider,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.raider,
              ),
              VocationCard(
                vocation: Vocation.wizard,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.wizard,
              ),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeadline(text: 'Good luck.'),
              ),
              const Center(
                child: StyledText(text: 'And enjoy the journey...'),
              ),
              const SizedBox(
                height: 30,
              ),
              StyledButton(
                  onPressed: submitHandle,
                  child: const StyledHeadline(text: "Create character"))
            ],
          ),
        ),
      ),
    );
  }
}
