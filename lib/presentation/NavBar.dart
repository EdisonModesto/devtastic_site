import 'package:auto_size_text/auto_size_text.dart';
import 'package:devtastic_site/data/models/NavModels.dart';
import 'package:devtastic_site/data/provider/pageProvider.dart';
import 'package:devtastic_site/presentation/AboutView/AboutView.dart';
import 'package:devtastic_site/presentation/ContactView/ContactView.dart';
import 'package:devtastic_site/presentation/FooterView/footer_view.dart';
import 'package:devtastic_site/presentation/HomeView/HomeView.dart';
import 'package:devtastic_site/presentation/ServicesView/services_view.dart';
import 'package:devtastic_site/presentation/TestimonialVew/TestimonialView.dart';
import 'package:devtastic_site/presentation/featureView/feature_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../data/provider/TextGroup.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<NavModel> navItems = [
    NavModel(text: "Home", page: 0),
    NavModel(text: "Why Us", page: 1),
    NavModel(text: "About Us", page: 2),
    NavModel(text: "Services", page: 3),
    NavModel(text: "Testimonials", page: 4),
    NavModel(text: "Contact Us", page: 5),
  ];
  var page = 0;
  var isUp = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var media = MediaQuery.of(context).size;
    var navGroupSize = context.watch<TextGroupProvider>().navItems;


    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          return Column(
            children: [
              SizedBox(
                height: 100,
                child: Padding(
                  padding: EdgeInsets.only(left: media.width * 0.1, right: media.width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 25,
                        child: Text(
                            "Devtastic",
                            style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              color: Colors.black
                            )
                        ),
                      ),
                      constraints.maxWidth <= 800 ?
                          IconButton(
                            onPressed: (){
                              if(page == 0){
                                setState(() {
                                  isUp = false;
                                });
                              } else if (page == 5){
                                setState(() {
                                  isUp = true;
                                });
                              }
                              if(isUp){
                                context.read<PageProvider>().setPage(page - 1);
                              } else {
                                context.read<PageProvider>().setPage(page + 1);
                              }
                            },
                            icon: Icon(
                              isUp ?
                              Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                              size: 35,
                            ),
                          ) :
                      Expanded(
                        flex: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(navItems.length, (index){
                              page = index;
                              return Expanded(
                                child: TextButton(
                                  onPressed: (){
                                    context.read<PageProvider>().setPage(navItems[index].page);
                                  },
                                  child: Text(
                                    navItems[index].text,
                                    style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      color: Color(0xff414141),
                                    ),
                                    //minFontSize: 0,
                                    maxLines: 1,
                                  //  group: navGroupSize,
                                  ),
                                ),
                              );
                            })
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: context.watch<PageProvider>().pageController,
                  physics: context.watch<PageProvider>().isPaused ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  onPageChanged: (index){
                    setState(() {
                      page = index;
                      if(page == 0){
                        setState(() {
                          isUp = false;
                        });
                      } else if (page == 5){
                        setState(() {
                          isUp = true;
                        });
                      }
                    });
                    print(page);
                  },
                  children: [
                    HomeView(),
                    FeatureView(),
                    const AboutView(),
                    ServicesView(),
                    const TestimonialView(),
                    ContactView(),
                    FooterView()
                  ],
                ),
              )
            ],
          );
        },
      )
    );
  }
}
