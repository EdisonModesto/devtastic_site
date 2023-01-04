import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../data/models/CardModel.dart';

class FeatureView extends StatefulWidget {
  const FeatureView({Key? key}) : super(key: key);

  @override
  _FeatureViewState createState() => _FeatureViewState();
}

class _FeatureViewState extends State<FeatureView> {

  final List<CardModel> cardData =  [
  CardModel(icon: Icon(Icons.fast_forward_outlined, size: 35, color: Colors.white), title: "Fast & Affordable", description: "We provide Fast & Affordable\nservices without compromising\nquality."),
  CardModel(icon: Icon(Icons.handshake_outlined, size: 35, color: Colors.white), title: "Reliable Service", description: "Quality is everything. We can\nensure that all of your\nrequirements will be met."),
  CardModel(icon: Icon(Icons.balance, size: 35, color: Colors.white), title: "Scalable Product", description: "Have a product that scales to\naccording to your future needs."),

  ];

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
                            text: "Why",
                            style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: ColorsUI().accent
                            ),
                            children: [
                              TextSpan(
                                text: " Devtastic?",
                                style: GoogleFonts.poppins(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 700,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "We offer",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff414141)
                              ),
                              children: [
                                TextSpan(
                                  text: " High Quality ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsUI().accent
                                  ),
                                ),
                                TextSpan(
                                  text: "Software Solutions with ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff414141)
                                  ),
                                ),
                                TextSpan(
                                  text: "Speed & Affordability",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsUI().accent
                                  ),
                                ),
                                TextSpan(
                                  text: " in mind. We also focus on developping ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff414141)
                                  ),
                                ),
                                TextSpan(
                                  text: "Scale-able",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsUI().accent
                                  ),
                                ),
                                TextSpan(
                                  text: " products for your business to grow.",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff414141)
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
                                      width: 75,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: ColorsUI().accent, width: 2),
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
                                      border: Border.all(color: Color(0xff4C89A3), width: 2),
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
