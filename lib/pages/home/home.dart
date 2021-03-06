import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:web_portfolio/pages/home/components/carousel.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/pages/home/components/dental_clinic_manager_app.dart';
import 'package:web_portfolio/pages/home/components/education_section.dart';
import 'package:web_portfolio/pages/home/components/footer.dart';
import 'package:web_portfolio/pages/home/components/header.dart';
import 'package:web_portfolio/pages/home/components/millionaire_app.dart';
import 'package:web_portfolio/pages/home/components/portfolio_stats.dart';
import 'package:web_portfolio/pages/home/components/skill_section.dart';
import 'package:web_portfolio/pages/home/components/sleep_timer_app.dart';
import 'package:web_portfolio/pages/home/components/tunable_app.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/globals.dart';

final ItemScrollController homeItemScrollController = ItemScrollController();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: Text(
                          headerItems[index].title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Container(
        child: ScrollablePositionedList.builder(
          itemScrollController: homeItemScrollController,
          itemCount: homeWidgets.length,
          itemBuilder: (BuildContext context, int index) {
            return homeWidgets[index];
          },
        ),
      ),
    );
  }
}

final homeWidgets = [
  Container(
    child: Header(),
  ),
  Carousel(),
  SizedBox(
    height: 20.0,
  ),
  CvSection(),
  MillionaireAd(),
  SizedBox(
    height: 70.0,
  ),
  DentalClinicManagerAd(),
  SizedBox(
    height: 70.0,
  ),
  TunableAd(),
  SizedBox(
    height: 70.0,
  ),
  SleepTimerAd(),
  SizedBox(
    height: 70.0,
  ),
  // WebsiteAd(),
  Padding(
    padding: const EdgeInsets.symmetric(vertical: 28.0),
    child: PortfolioStats(),
  ),
  SizedBox(
    height: 50.0,
  ),
  EducationSection(),
  SizedBox(
    height: 50.0,
  ),
  SkillSection(),
  SizedBox(
    height: 50.0,
  ),
  // Sponsors(),
  // SizedBox(
  //   height: 50.0,
  // ),
  // TestimonialWidget(),
  Footer(
    key: ValueKey('footerKey'),
  ),
];
