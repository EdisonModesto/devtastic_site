import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../data/models/CardModel.dart';
import '../../data/provider/pageProvider.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  _ServicesViewState createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  final List<CardModel> cardData =  [
    CardModel(icon: Icon(Icons.phone_android_outlined, size: 40, color: ColorsUI().accent), title: "Mobile Apps", description: "We provide Fast & Affordable\nservices without compromising\nquality."),
    CardModel(icon: Icon(Icons.apps_outlined, size: 40, color: ColorsUI().accent), title: "Web Apps", description: "Quality is everything. We can\nensure that all of your\nrequirements will be met."),
    CardModel(icon: Icon(Icons.web, size: 40, color: ColorsUI().accent), title: "Websites", description: "Have a product that scales to\naccording to your future needs."),
    CardModel(icon: Icon(Icons.storefront_outlined, size: 40, color: ColorsUI().accent), title: "E-commerce Stores", description: "Have a product that scales to\naccording to your future needs."),

  ];

  final outerController = ScrollController();
  final innerController = ScrollController();

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
                            text: "What",
                            style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: ColorsUI().accent
                            ),
                            children: [
                              TextSpan(
                                text: " we offer",
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
                              text: "We offer a ",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff414141)
                              ),
                              children: [
                                TextSpan(
                                  text: " wide array of services ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsUI().accent
                                  ),
                                ),
                                TextSpan(
                                  text: "that can help you, and ",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff414141)
                                  ),
                                ),
                                TextSpan(
                                  text: "your business grow",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
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
                  child: Padding(
                    padding: EdgeInsets.only(left: media.width * 0.1, right: media.width * 0.1),
                    child: constraints.maxWidth <= 800 ?
                    ListView.separated(
                      //clipBehavior: Clip.none,
                      shrinkWrap: true,
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
                                  border: Border.all(color: ColorsUI().accent, width: 3),
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
                                    color: Colors.black
                                ),
                                //group: navGroupSize,
                              ),
                              SizedBox(height: 25,),
                              Text(
                                cardData[index].description,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: const Color(0xff414141),
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
                      itemCount: cardData.length,

                    )
                        : MouseRegion(
                          onHover: (event) {
                            context.read<PageProvider>().pause();

                          },
                          onExit: (details){
                            print("exited");
                            context.read<PageProvider>().resume();
                          },

                          child: Listener(
                            onPointerSignal: (event)async {
                              if (event is PointerScrollEvent) {
                                final offset = event.scrollDelta.dy;

                                innerController.jumpTo(innerController.offset + offset);
                                outerController.jumpTo(outerController.offset - offset);
                                await Future.delayed(Duration(seconds: 1));
                              }
                            },
                            onPointerHover: (event) {
                              context.read<PageProvider>().pause();
                            },
                            onPointerCancel: (event) {
                              print("Canceled");
                              //context.read<PageProvider>().resume();
                            },


                            child: SingleChildScrollView(
                              controller: innerController,
                      scrollDirection: Axis.horizontal,
                              child: SizedBox(
                                width: media.width * 0.9,
                                child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(cardData.length, (index){
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
                                          border: Border.all(color: Color(0xff4C89A3), width: 3),
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
                                          color: Colors.black,
                                        ),
                                        //  group: navGroupSize,
                                      ),
                                      Text(
                                        cardData[index].description,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: const Color(0xff414141)
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                      }),
                    ),
                              ),
                            ),
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
