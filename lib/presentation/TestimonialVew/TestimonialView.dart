import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:devtastic_site/data/provider/NPointProvider.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';

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
                            TextRenderer(
                              child: Text(
                                "Testimonials",
                                style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextRenderer(
                              child: Text(
                                "Let's see what previous clients say\nabout us.",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
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
                                child: ImageRenderer(
                                  alt: "Quote",
                                  child: Image.asset(
                                      "assets/images/Quote.png"
                                  ),
                                ),
                              ),
                              CarouselSlider.builder(
                                itemCount: context.read<NPointProvider>().testimonialsData.length,
                                options: CarouselOptions(
                                    height: 175,
                                    autoPlay: true,
                                    autoPlayInterval: const Duration(seconds: 3),
                                    disableCenter: true,
                                    viewportFraction: 1
                                ),
                                itemBuilder: (context, index, realIndex){
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: TextRenderer(
                                          child: AutoSizeText(
                                            context.read<NPointProvider>().testimonialsData[index].review,
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic,
                                            ),
                                            maxFontSize: 16,
                                            minFontSize: 0,
                                            //group: navGroupSize,

                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                              radius: 30,
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(Radius.circular(100)),
                                              child: Image.network(
                                                context.read<NPointProvider>().testimonialsData[index].picUrl
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 40),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextRenderer(
                                                child: Text(
                                                  context.read<NPointProvider>().testimonialsData[index].name,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              TextRenderer(
                                                child: Text(
                                                  context.read<NPointProvider>().testimonialsData[index].position,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  );
                                },
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
                            TextRenderer(
                              child: Text(
                                "Testimonials",
                                style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextRenderer(
                              child: Text(
                                "Let's see what previous clients say\nabout us.",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
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
                                child: ImageRenderer(
                                  alt: "Quote",
                                  child: Image.asset(
                                      "assets/images/Quote.png"
                                  ),
                                ),
                              ),
                              CarouselSlider.builder(
                                itemCount: context.read<NPointProvider>().testimonialsData.length,
                                options: CarouselOptions(
                                  height: 280,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  disableCenter: true,
                                  viewportFraction: 1
                                ),
                                itemBuilder: (context, index, pageIndex){
                                  return Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 550,
                                          height: 140,
                                          child: TextRenderer(
                                            child: AutoSizeText(
                                              context.read<NPointProvider>().testimonialsData[index].review,
                                              style: GoogleFonts.poppins(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontStyle: FontStyle.italic,
                                              ),
                                              //group: navGroupSize,

                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 60,
                                              height: 60,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(30),
                                                child: Image.network(
                                                  context.read<NPointProvider>().testimonialsData[index].picUrl
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 40),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                TextRenderer(
                                                  child: Text(
                                                    context.read<NPointProvider>().testimonialsData[index].name,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                TextRenderer(
                                                  child: Text(
                                                    context.read<NPointProvider>().testimonialsData[index].position,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                },
                              ),
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
