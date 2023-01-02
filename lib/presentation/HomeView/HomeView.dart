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

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  
  final List<CardModel> cardData =  [
    CardModel(icon: const Icon(Icons.fast_forward_outlined, size: 35, color: Colors.white), title: "Fast & Affordable", description: "We provide Fast & Affordable\nservices without compromising\nquality."),
    CardModel(icon: const Icon(Icons.handshake_outlined, size: 35, color: Colors.white), title: "Reliable Service", description: "Quality is everything. We can\nensure that all of your\nrequirements will be met."),
    CardModel(icon: const Icon(Icons.balance, size: 35, color: Colors.white), title: "Scalable Product", description: "Have a product that scales to\naccording to your future needs."),

  ];
  
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
                flex: 15,
                child: constraints.maxWidth <= 800 ?
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 216,
                        width: 385,
                        child: YoutubeFrame(),
                      ),
                      Column(
                        children: [
                          Image.network("https://scontent.fmnl7-1.fna.fbcdn.net/v/t39.30808-6/323214930_2208617925986129_7491237149372083995_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGFjVk9bK-5gFPTnJRDn1h4yPkVGWGve3zI-RUZYa97fKF_dcZNJq24P-I9Vf4aZYEBWVGr56rX44dRyVElq4vd&_nc_ohc=3zzspDHJY7QAX-NulM4&tn=4-9ZvU0my8Dyg2w2&_nc_zt=23&_nc_ht=scontent.fmnl7-1.fna&oh=00_AfBxf3ExQizg_8xvxF1Gej1vUdJU4ldJI_XrQcv-VZqwow&oe=63B80FF9", scale: 13,),
                          SizedBox(height: 5,),
                          Text(
                            "Let's make your ideas real.",
                            style: GoogleFonts.poppins(
                              fontSize: 22
                            ),
                          )
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
                        child: Row(
                          children: [
                            Image.network("https://scontent.fmnl7-1.fna.fbcdn.net/v/t39.30808-6/323214930_2208617925986129_7491237149372083995_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGFjVk9bK-5gFPTnJRDn1h4yPkVGWGve3zI-RUZYa97fKF_dcZNJq24P-I9Vf4aZYEBWVGr56rX44dRyVElq4vd&_nc_ohc=3zzspDHJY7QAX-NulM4&tn=4-9ZvU0my8Dyg2w2&_nc_zt=23&_nc_ht=scontent.fmnl7-1.fna&oh=00_AfBxf3ExQizg_8xvxF1Gej1vUdJU4ldJI_XrQcv-VZqwow&oe=63B80FF9", scale: 5,),
                            SizedBox(width: 40,),
                            Typewriter(
                              strings: context.watch<NPointProvider>().typewriterData as List<String>,
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

                /*Padding(
                  padding: EdgeInsets.only(left: media.width * 0.1, right: media.width * 0.1),
                  child: Center(
                    child: Transform.translate(
                      offset: const Offset(0, -75),
                      child: Typewriter(
                          strings: context.watch<NPointProvider>().typewriterData as List<String>,
                      ),
                    ),
                  ),
                ),*/
              ),
              Expanded(
                flex: 10,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ColoredBox(
                      color: const Color(0xff414141),
                      child: Padding(
                        padding: EdgeInsets.only(left: media.width * 0.1, right: media.width * 0.1),
                        child: constraints.maxWidth <= 800 ?
                        SizedBox(
                          height: 240,
                          child: ListView.separated(
                            //clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: 250,
                                height: 100,
                                padding: const EdgeInsets.only(top: 15, bottom: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white, width: 2),
                                        borderRadius: BorderRadius.circular(1000),
                                      ),
                                      child: Center(
                                        child: cardData[index].icon,
                                      ),
                                    ),
                                    SizedBox(height: 25,),
                                    Text(
                                      cardData[index].title,
                                      style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),
                                      //group: navGroupSize,
                                    ),
                                    SizedBox(height: 25,),
                                    Text(
                                      cardData[index].description,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        color: const Color(0xffc7c7c7),
                                      ),
                                      maxLines: 3,
                                    //  minFontSize: 0,
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(width: 20,);
                            },
                            itemCount: 3,

                          ),
                        )
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(3, (index){
                            return Container(
                              height: 340,
                              width: 310,
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 35, bottom: 35),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(1000),
                                    ),
                                    child: Center(
                                      child: cardData[index].icon,
                                    ),
                                  ),
                                  Text(
                                    cardData[index].title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  //  group: navGroupSize,
                                  ),
                                  Text(
                                    cardData[index].description,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: const Color(0xffc7c7c7)
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
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
