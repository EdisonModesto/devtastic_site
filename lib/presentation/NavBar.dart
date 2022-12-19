import 'package:auto_size_text/auto_size_text.dart';
import 'package:devtastic_site/data/models/NavModels.dart';
import 'package:devtastic_site/presentation/AboutView/AboutView.dart';
import 'package:devtastic_site/presentation/ContactView/ContactView.dart';
import 'package:devtastic_site/presentation/HomeView/HomeView.dart';
import 'package:devtastic_site/presentation/TestimonialVew/TestimonialView.dart';
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
  PageController _pageController = PageController();

  List<NavModel> navItems = [
    NavModel(text: "Home", page: 0),
    NavModel(text: "About Us", page: 1),
    NavModel(text: "Testimonials", page: 2),
    NavModel(text: "Contact Us", page: 3),
  ];

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
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                      constraints.maxWidth <= 800 ?
                          IconButton(
                            onPressed: (){},
                            icon: Icon(
                              Icons.menu,
                              size: 35,
                            ),
                          ) :
                      Expanded(
                        flex: 35,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(navItems.length, (index){
                              return Expanded(
                                child: TextButton(
                                  onPressed: (){
                                    _pageController.animateToPage(navItems[index].page, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut); //.animateTo(navItems[index].page, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                                  },
                                  child: AutoSizeText(
                                    navItems[index].text,
                                    style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      color: Colors.black,
                                    ),
                                    minFontSize: 0,
                                    maxLines: 1,
                                    group: navGroupSize,
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
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  children: [
                    HomeView(),
                    const AboutView(),
                    const TestimonialView(),
                    ContactView()
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
