import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:seo_renderer/renderers/link_renderer/link_renderer_vm.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/provider/TextGroup.dart';

class ContactView extends StatelessWidget {
  ContactView({Key? key}) : super(key: key);

  final cardIcons = [
    Icons.contact_mail_outlined,
    Icons.access_time_rounded
  ];

  final cardTitle = [
    "Contact",
    "Schedule"
  ];

  final cardInfo = [
    "+63 927 987 2019\ndevtasticofficial@gmail.com",
    "Monday to Friday 10AM - 7PM"
  ];

  void schedule() {
    launchUrl(Uri.parse("https://cal.com/devtastic"));
  }

  void email(){
    var email = Uri.parse('mailto:devtasticofficial@gmail.com?subject=Enter Subject Here&body=Enter Body Here');
    launchUrl(email);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var navGroupSize = context.watch<TextGroupProvider>().navItems;
    return LayoutBuilder(
      builder: (context, constraints){
        return SizedBox(
          child: constraints.maxWidth <= 800 ?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextRenderer(
                              style: TextRendererStyle.header1,
                              child: Text(
                                "Contact Us",
                                style: GoogleFonts.poppins(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  LinkRenderer(
                                    href: "mailto:devtasticofficial@gmail.com?subject=Enter Subject Here&body=Enter Body Here",
                                    text: "Send an Email",
                                    child: ElevatedButton(
                                      onPressed: ()  {
                                        email();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xff414141),
                                          fixedSize: const Size(300, 70),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10)
                                          )
                                      ),
                                      child: TextRenderer(
                                        style: TextRendererStyle.header2,
                                        child: Text(
                                          "Send an Email",
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextRenderer(
                                    style: TextRendererStyle.paragraph,
                                    child: Text(
                                      "or",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  LinkRenderer(
                                    href: "https://cal.com/devtastic",
                                    text: "Schedule a meeting",
                                    child: ElevatedButton(
                                      onPressed: (){
                                        schedule();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xff414141),
                                          fixedSize: const Size(300, 70),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10)
                                          )
                                      ),
                                      child: TextRenderer(
                                        style: TextRendererStyle.paragraph,
                                        child: Text(
                                          "Schedule a meeting",
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(2, (index){
                          return Card(
                              elevation: 0,
                              child: Container(
                                width: 345,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: const Color(0xff414141),
                                      child: Icon(cardIcons[index], color: Colors.white,),
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextRenderer(
                                          style: TextRendererStyle.header2,
                                          child: Text(
                                            cardTitle[index],
                                            style: GoogleFonts.poppins(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold
                                            ),
                                            //group: navGroupSize,
                                          ),
                                        ),
                                        TextRenderer(
                                          style: TextRendererStyle.paragraph,
                                          child: Text(
                                            cardInfo[index],
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )

                                  ],
                                ),
                              )
                          );
                        }),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: TextRenderer(
                          style: TextRendererStyle.paragraph,
                          child: Text(
                            "Let's turn your ideas into reality",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ) :
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: media.width * 0.1),
                          child: Column(
                            children: List.generate(2, (index){
                              return Card(
                                  elevation: 0,
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 50),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor: const Color(0xff414141),
                                          child: Icon(cardIcons[index], color: Colors.white,),
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextRenderer(
                                              style: TextRendererStyle.header2,
                                              child: Text(
                                                cardTitle[index],
                                                style: GoogleFonts.poppins(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold
                                                ),
                                               // group: navGroupSize,
                                              ),
                                            ),
                                            TextRenderer(
                                              style: TextRendererStyle.paragraph,
                                              child: Text(
                                                cardInfo[index],
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )

                                      ],
                                    ),
                                  )
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: media.width * 0.1),
                        child: Column(
                            children: [
                              TextRenderer(
                                style: TextRendererStyle.header2,
                                child: Text(
                                  "Contact Us",
                                  style: GoogleFonts.poppins(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),
                              SizedBox(
                                height: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    LinkRenderer(
                                      href: "mailto:devtasticofficial@gmail.com?subject=Enter Subject Here&body=Enter Body Here",
                                      text: "Send an Email",
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          email();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xff414141),
                                            fixedSize: const Size(300, 70),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10)
                                            )
                                        ),
                                        child: TextRenderer(
                                          style: TextRendererStyle.paragraph,
                                          child: Text(
                                            "Send an Email",
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextRenderer(
                                      style: TextRendererStyle.paragraph,
                                      child: Text(
                                        "or",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    LinkRenderer(
                                      href: "https://cal.com/devtastic",
                                      text: "Schedule a meeting",
                                      child: ElevatedButton(
                                        onPressed: (){
                                          schedule();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xff414141),
                                            fixedSize: const Size(300, 70),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10)
                                            )
                                        ),
                                        child: TextRenderer(
                                          style: TextRendererStyle.paragraph,
                                          child: Text(
                                            "Schedule a meeting",
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]
                        ),
                      ),
                    )
                  ],
                ),
              ),

              constraints.maxWidth <= 800 ? const SizedBox() :

              Expanded(
                child: Center(
                  child: TextRenderer(
                    style: TextRendererStyle.paragraph,
                    child: Text(
                      "Let's turn your ideas into reality",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
