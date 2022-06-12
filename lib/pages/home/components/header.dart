import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/header_item.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/pages/home/components/education_section.dart';
import 'package:web_portfolio/pages/home/components/footer.dart';
import 'package:web_portfolio/pages/home/components/millionaire_app.dart';
import 'package:web_portfolio/pages/home/components/skill_section.dart';
import 'package:web_portfolio/pages/home/home.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/globals.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

List<HeaderItem> headerItems = [
  HeaderItem(
    title: "Resume",
    onTap: () {
      homeItemScrollController.scrollTo(
          index: homeWidgets.indexWhere((element) => element is CvSection),
          duration: Duration(milliseconds: 500));
    },
  ),
  HeaderItem(
      title: "Projects",
      onTap: () {
        /// scrolls to next app
        homeItemScrollController.scrollTo(
            index:
                homeWidgets.indexWhere((element) => element is MillionaireAd),
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }),
  HeaderItem(
      title: "Education",
      onTap: () {
        /// scrolls to next app
        homeItemScrollController.scrollTo(
            index: homeWidgets
                .indexWhere((element) => element is EducationSection),
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }),
  HeaderItem(
      title: "Skills",
      onTap: () {
        /// scrolls to next app
        homeItemScrollController.scrollTo(
            index: homeWidgets.indexWhere((element) => element is SkillSection),
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }),
  // HeaderItem(title: "PORTFOLIO", onTap: () {}),
  // HeaderItem(title: "TESTIMONIALS", onTap: () {}),
  // HeaderItem(title: "BLOGS", onTap: () {}),
  HeaderItem(
    title: "HIRE ME",
    onTap: () {
      /// scrolls to next app
      homeItemScrollController.scrollTo(
          index: homeWidgets.indexWhere((element) => element is Footer),
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut);
    },
    isButton: true,
  ),
];

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            homeItemScrollController.scrollTo(
                index: homeWidgets.indexWhere((element) => element is Footer),
                duration: Duration(milliseconds: 10000),
                curve: Curves.easeInOut);
          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "A",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: GoogleFonts.oswald(
                    color: kPrimaryColor,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kDangerColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: TextButton(
                          onPressed: item.onTap,
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                          onTap: item.onTap,
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(),
        ),
        // We will make this in a bit
        mobile: buildMobileHeader(),
        tablet: buildHeader(),
      ),
    );
  }

  // mobile header
  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            // Restart server to make icons work
            // Lets make a scaffold key and create a drawer
            GestureDetector(
              onTap: () {
                // Lets open drawer using global key
                Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          HeaderRow(),
        ],
      ),
    );
  }
}
