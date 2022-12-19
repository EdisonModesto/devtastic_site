import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Typewriter extends StatefulWidget {
  const Typewriter({Key? key, required this.strings}) : super(key: key);

  final List<String> strings;

  @override
  State<Typewriter> createState() => _TypewriterState();
}

class _TypewriterState extends State<Typewriter> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: List.generate(widget.strings.length, (index){
        return TypewriterAnimatedText(
          widget.strings[index],
          speed: const Duration(milliseconds: 70),
          textAlign: TextAlign.center,
          textStyle: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        );
      }),
      totalRepeatCount: 100,
      onTap: () {
        print("Tap Event");
      },
    );
  }
}
