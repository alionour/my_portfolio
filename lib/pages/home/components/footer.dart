import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_portfolio/models/footer_item.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<FooterItem> footerItems = [
  FooterItem(iconPath: "assets/mappin.png", title: "ADDRESS", clickables: [
    ClickableText(
      "Bani-Eish Qesm Gerga",
      onTap: () {},
    ),
    ClickableText(
      "Suhaj, Egypt",
      onTap: () {},
    ),
  ]),
  FooterItem(
    iconPath: "assets/phone.png",
    title: "PHONE",
    clickables: [
      ClickableText(
        "+2 011-4215-4162",
        onTap: () async {
          final uri = Uri(
            scheme: 'tel',
            path: '+201142154162',
          );
          if (await canLaunchUrl(uri)) {
            launchUrl(uri);
          }
        },
      ),
    ],
  ),
  FooterItem(
    iconPath: "assets/email.png",
    title: "EMAIL",
    clickables: [
      ClickableText(
        "alionour22@gmail.com",
        onTap: () async {
          final uri = Uri.parse(
            'mailto:alionour22@gmail.com?subject=Subject&body=Body',
          );
          if (await canLaunchUrl(uri)) {
            launchUrl(uri);
          }
        },
      ),
    ],
  ),
  FooterItem(
    iconPath: "assets/whatsapp.png",
    title: "WHATSAPP",
    clickables: [
      ClickableText(
        "+2 011-4215-4162",
        onTap: () async {
          final uri = Uri.parse(
            'https://wa.me/+201142154162',
          );
          if (await canLaunchUrl(uri)) {
            launchUrl(uri);
          }
        },
      ),
    ],
  )
];

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => Container(
                          height: 120.0,
                          width: ScreenHelper.isMobile(context)
                              ? constraints.maxWidth / 2.0 - 20.0
                              : constraints.maxWidth / 4.0 - 20.0,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      footerItem.iconPath,
                                      width: 25.0,
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      footerItem.title,
                                      style: GoogleFonts.oswald(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Column(
                                  children: [...footerItem.clickables],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              // Flex(
              //   direction: ScreenHelper.isMobile(context)
              //       ? Axis.vertical
              //       : Axis.horizontal,
              //   mainAxisAlignment: ScreenHelper.isMobile(context)
              //       ? MainAxisAlignment.center
              //       : MainAxisAlignment.spaceBetween,
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(bottom: 8.0),
              //       child: Text(
              //         "Copyright (c) 2021 Michele Harrington. All rights Reserved",
              //         style: TextStyle(
              //           color: kCaptionColor,
              //         ),
              //       ),
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         GestureDetector(
              //           onTap: () {},
              //           child: MouseRegion(
              //             cursor: SystemMouseCursors.click,
              //             child: Text(
              //               "Privacy Policy",
              //               style: TextStyle(
              //                 color: kCaptionColor,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           padding: EdgeInsets.symmetric(horizontal: 8.0),
              //           child: Text(
              //             "|",
              //             style: TextStyle(
              //               color: kCaptionColor,
              //             ),
              //           ),
              //         ),
              //         GestureDetector(
              //           onTap: () {},
              //           child: MouseRegion(
              //             cursor: SystemMouseCursors.click,
              //             child: Text(
              //               "Terms & Conditions",
              //               style: TextStyle(
              //                 color: kCaptionColor,
              //               ),
              //             ),
              //           ),
              //         )
              //       ],
              //     )
              //   ],
              // )
            ],
          );
        },
      ),
    ),
  );
}
