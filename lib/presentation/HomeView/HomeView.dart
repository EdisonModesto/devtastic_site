import 'package:devtastic_site/constants/colors.dart';
import 'package:devtastic_site/data/provider/NPointProvider.dart';
import 'package:devtastic_site/presentation/HomeView/youtube_frame.dart';
import 'package:devtastic_site/widgets/Typewriter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../data/models/CardModel.dart';
import '../../data/provider/TextGroup.dart';
import '../../data/provider/pageProvider.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var navGroupSize = context.watch<TextGroupProvider>().navItems;
    return LayoutBuilder(
      builder: (context, constraints){
        return SizedBox(
          child: Column(
            children: [
              Expanded(
                child: constraints.maxWidth <= 800 ?
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network("https://scontent.fmnl7-1.fna.fbcdn.net/v/t39.30808-6/323214930_2208617925986129_7491237149372083995_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGFjVk9bK-5gFPTnJRDn1h4yPkVGWGve3zI-RUZYa97fKF_dcZNJq24P-I9Vf4aZYEBWVGr56rX44dRyVElq4vd&_nc_ohc=3zzspDHJY7QAX-NulM4&tn=4-9ZvU0my8Dyg2w2&_nc_zt=23&_nc_ht=scontent.fmnl7-1.fna&oh=00_AfBxf3ExQizg_8xvxF1Gej1vUdJU4ldJI_XrQcv-VZqwow&oe=63B80FF9",
                            scale: 9,),
                          SizedBox(height: 20,),
                          Typewriter(
                            strings: context.watch<NPointProvider>().typewriterData as List<String>,
                          ),
                          SizedBox(height: 50,),
                          SizedBox(
                            height: 216,
                            width: 385,
                            child: YoutubeFrame(),
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            width: 550,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "We develop",
                                  style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      color: Colors.black
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " Mobile Apps, Web Apps and Software Solutions",
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    TextSpan(
                                      text: "  for businesses and startups.",
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          color: Colors.black
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          const SizedBox(height: 50,),
                          ElevatedButton(
                            onPressed: ()  {
                              context.read<PageProvider>().setPage(1);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsUI().accent,
                                fixedSize: const Size(300, 70),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                            child: Text(
                              "Learn more about us",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ) :
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.network("https://scontent.fmnl7-1.fna.fbcdn.net/v/t39.30808-6/323214930_2208617925986129_7491237149372083995_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGFjVk9bK-5gFPTnJRDn1h4yPkVGWGve3zI-RUZYa97fKF_dcZNJq24P-I9Vf4aZYEBWVGr56rX44dRyVElq4vd&_nc_ohc=3zzspDHJY7QAX-NulM4&tn=4-9ZvU0my8Dyg2w2&_nc_zt=23&_nc_ht=scontent.fmnl7-1.fna&oh=00_AfBxf3ExQizg_8xvxF1Gej1vUdJU4ldJI_XrQcv-VZqwow&oe=63B80FF9",
                                  scale: 9,),
                                SizedBox(width: 20,),
                                Typewriter(
                                  strings: context.watch<NPointProvider>().typewriterData as List<String>,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            SizedBox(
                              width: 550,
                              child: RichText(
                                text: TextSpan(
                                  text: "We develop",
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    color: Colors.black
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " Mobile Apps, Web Apps and Software Solutions",
                                      style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    TextSpan(
                                      text: "  for businesses and startups.",
                                      style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        color: Colors.black
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                            ),
                            const SizedBox(height: 50,),
                            ElevatedButton(
                              onPressed: ()  {
                                context.read<PageProvider>().setPage(1);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsUI().accent,
                                  fixedSize: const Size(300, 70),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                              child: Text(
                                "Learn more about us",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 382,
                              width: 679,
                              child: YoutubeFrame(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        );
      },
    );
  }
}
