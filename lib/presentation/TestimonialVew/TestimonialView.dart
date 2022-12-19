import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../../data/provider/TextGroup.dart';

class TestimonialView extends StatelessWidget {
  const TestimonialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var navGroupSize = context.watch<TextGroupProvider>().navItems;
    return LayoutBuilder(
      builder: (context, constraints){
        return SizedBox(
          child: Center(
              child: SizedBox(
                height: 500,
                child: constraints.maxWidth <= 800 ?
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 40,
                      child: Padding(
                        padding: EdgeInsets.only(left: media.width * 0.1, right: media.width * 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Testimonials",
                              style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Let's see what previous clients say\nabout us.",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 60,
                      child: ColoredBox(
                        color: const Color(0xff414141),
                        child: Padding(
                          padding: EdgeInsets.only(top: 40, bottom: 40, left: media.width * 0.1, right: media.width * 0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                    "assets/images/Quote.png"
                                ),
                              ),
                              SizedBox(
                                child: AutoSizeText(
                                  '"Working with them has been a great experience. We have worked for a couple of months and they didn\'t let us down. They\'re passionate on their works and all i can say that it\'s been a great ride."',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  maxFontSize: 16,
                                  minFontSize: 0,
                                  //group: navGroupSize,

                                ),
                              ),
                              Row(
                                children: [
                                  const CircleAvatar(
                                      radius: 30
                                  ),
                                  const SizedBox(width: 40),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Aziechaelle Cunanan",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Researcher of PharmaGo Mobile",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
                :
                Row(
                  children: [
                    Expanded(
                      flex: 40,
                      child: Padding(
                        padding: EdgeInsets.only(left: media.width * 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Testimonials",
                              style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Let's see what previous clients say\nabout us.",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 60,
                      child: ColoredBox(
                        color: const Color(0xff414141),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: Image.asset(
                                    "assets/images/Quote.png"
                                ),
                              ),
                              SizedBox(
                                width: 550,
                                height: 100,
                                child: AutoSizeText(
                                  '"Working with them has been a great experience. We have worked for a couple of months and they didn\'t let us down. They\'re passionate on their works and all i can say that it\'s been a great ride."',
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  //group: navGroupSize,

                                ),
                              ),
                              Row(
                                children: [
                                  const CircleAvatar(
                                      radius: 30
                                  ),
                                  const SizedBox(width: 40),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Aziechaelle Cunanan",
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Researcher of PharmaGo Mobile",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
        );
      },
    );
  }
}
