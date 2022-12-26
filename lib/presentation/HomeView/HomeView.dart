import 'package:devtastic_site/data/provider/NPointProvider.dart';
import 'package:devtastic_site/widgets/Typewriter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../data/models/CardModel.dart';
import '../../data/provider/TextGroup.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  
  final List<CardModel> cardData =  [
    CardModel(icon: const Icon(Icons.fast_forward_outlined, size: 40, color: Colors.white), title: "Fast & Affordable", description: "We provide Fast & Affordable\nservices without compromising\nquality."),
    CardModel(icon: const Icon(Icons.handshake_outlined, size: 40, color: Colors.white), title: "Reliable Service", description: "Quality is everything. We can\nensure that all of your\nrequirements will be met."),
    CardModel(icon: const Icon(Icons.balance, size: 40, color: Colors.white), title: "Scalable Product", description: "Have a product that scales to\naccording to your future needs."),

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
                child: Padding(
                  padding: EdgeInsets.only(left: media.width * 0.1, right: media.width * 0.1),
                  child: Center(
                    child: Transform.translate(
                      offset: const Offset(0, -75),
                      child: Typewriter(
                          strings: context.watch<NPointProvider>().typewriterData as List<String>,
                      ),
                    ),
                  ),
                ),
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
                        Transform.translate(
                          offset: const Offset(0, -175),
                          child: SizedBox(
                            height: 240,
                            child: ListView.separated(
                              //clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: 250,
                                  height: 140,
                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffC8C8C8),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                          radius: 40,
                                          backgroundColor: const Color(0xff414141),
                                          child: cardData[index].icon
                                      ),
                                      Text(
                                        cardData[index].title,
                                        style: GoogleFonts.poppins(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        //group: navGroupSize,
                                      ),
                                      Text(
                                        cardData[index].description,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
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
                          ),
                        )
                        : Transform.translate(
                          offset: const Offset(0, -155),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(3, (index){
                              return Container(
                                height: 340,
                                width: 310,
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 35, bottom: 35),
                                decoration: BoxDecoration(
                                  color: const Color(0xffC8C8C8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                        radius: 40,
                                        backgroundColor: const Color(0xff414141),
                                        child: cardData[index].icon
                                    ),
                                    Text(
                                      cardData[index].title,
                                      style: GoogleFonts.poppins(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    //  group: navGroupSize,
                                    ),
                                    Text(
                                      cardData[index].description,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
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
