import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/colors.dart';
import '../../data/models/CardModel.dart';

class FooterView extends StatefulWidget {
  const FooterView({Key? key}) : super(key: key);

  @override
  _FooterViewState createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints){
        return SizedBox(
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(left: media.width * 0.1, right: media.width * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Here at Devtastic,",
                            style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 700,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "Let's turn your",
                              style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff414141)
                              ),
                              children: [
                                TextSpan(
                                  text: " Ideas ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsUI().accent
                                  ),
                                ),
                                TextSpan(
                                  text: "into ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff414141)
                                  ),
                                ),
                                TextSpan(
                                  text: "Reality",
                                  style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsUI().accent
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ColoredBox(
                      color: const Color(0xff414141),
                      child: Padding(
                        padding: EdgeInsets.only(left: media.width * 0.1, right: media.width * 0.1, top: 50, bottom: 50),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.white, width: 2),
                                                    borderRadius: BorderRadius.circular(1000),
                                                  ),
                                                  child: Image.asset("assets/images/devLogo.png"),
                                                ),
                                                const SizedBox(width: 25,),
                                                Text(
                                                  "Devtastic",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 28,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 30),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: (){
                                                    launchUrl(Uri.parse("https://web.facebook.com/DevtasticOfficial"));
                                                  },
                                                  child: const CircleAvatar(
                                                    radius : 20,
                                                    backgroundColor: Colors.white,
                                                    child: Icon(
                                                      Icons.facebook, size: 30,
                                                      color: Color(0xff4267B2),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                InkWell(
                                                  onTap: (){
                                                    launchUrl(Uri.parse("https://www.instagram.com/devtasticph/"));
                                                  },
                                                  child: const CircleAvatar(
                                                    radius : 20,
                                                    backgroundColor: Colors.white,
                                                    child: Icon(
                                                      LineIcons.instagram, size: 30,
                                                      color: Color(0xffE1306C),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                InkWell(
                                                  onTap: (){
                                                    launchUrl(Uri.parse("https://www.linkedin.com/company/devtastic/"));
                                                  },
                                                  child: const CircleAvatar(
                                                    radius : 20,
                                                    backgroundColor: Colors.white,
                                                    child: Icon(
                                                      LineIcons.linkedinIn, size: 30,
                                                      color: Color(0xff4267B2),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: (){},
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Color(0xff414141)),
                                              fixedSize: MaterialStateProperty.all(Size(275, 50)),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(18.0),
                                                  side: BorderSide(color: ColorsUI().accent, width: 2),
                                                ),
                                              ),
                                            ),
                                          child: const Text("Subscribe to our Newsletter"),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "© 2022 Devtastic. All rights reserved.",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ],
                        )
                      )
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
