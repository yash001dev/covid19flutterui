import 'package:first/constants.dart';
import 'package:first/screens/details_screen.dart';
import 'package:first/widgets/info_card.dart';
import 'package:first/widgets/line_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buidAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.03),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )
            ),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: <Widget>[
                InfoCard(
                  title:"Confirmed Cases",
                  iconColor: Color(0xFFFFBC00),
                  effectedNum: 1062,
                  press: (){},
                ),
                InfoCard(
                  title:"Total Deaths",
                  iconColor: Color(0xFFFF2055),
                  effectedNum: 75,
                  press: (){},
                ),
                InfoCard(
                  title:"Total Recovered",
                  iconColor: Color(0xFF50E3C2),
                  effectedNum: 689,
                  press: (){},
                ),
                InfoCard(
                  title:"New Cases",
                  iconColor: Color(0xFF5856D6),
                  effectedNum: 689,
                  press: (){Navigator.push(context,MaterialPageRoute(
                      builder: (context){return DetailScreen();},
                  ),
                  );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Preventions",
                    style: Theme.of(context).textTheme.title.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20,),
                  buildPreventionRow(),
                  SizedBox(height: 40.0,),
                  buildHelpCard(context)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildPreventionRow() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  PreventionCard(SvgSrc: "assets/icons/hand_wash.svg",
                  title: "Wash Hands",
                  ), PreventionCard(SvgSrc: "assets/icons/use_mask.svg",
                  title: "Use Masks",
                  ), PreventionCard(SvgSrc: "assets/icons/Clean_Disinfect.svg",
                  title: "Clean Disinfect",
                  ),
                ],
              );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
                height: 150,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    Container(
                      padding:EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*.4,
                        top: 20,
                        right: 20,

                      ),
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(gradient: LinearGradient(
                        colors: [Color(0xFF60BE93),
                        Color(0xFF1B8D59),
                        ]
                      ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [TextSpan(
                            text: "Dial 999 for \nMedical Help!\n",
                            style: Theme.of(context).textTheme.title
                              .copyWith(color: Colors.white)
                          ),
                            TextSpan(text: "If any symptoms appear",
                                style:TextStyle(color: Colors.white.
                                withOpacity(0.7),
                                ),
                            ),
                          ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SvgPicture.asset("assets/icons/nurse.svg"),
                    ),
                    Positioned(
                      top: 30,
                      right: 10,

                      child: SvgPicture.asset("assets/icons/virus.svg"),

                    )

                  ],
                ),
              );
  }
  AppBar buidAppBar(){
        return AppBar(
          backgroundColor: kPrimaryColor.withOpacity(.03),
          elevation: 0,
          leading: IconButton(icon: SvgPicture.asset("assets/icons/menu.svg"),
            onPressed: (){},
          ),
          actions: <Widget>[IconButton(icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: (){},
          ),
          ],
        );
      }
  }

class PreventionCard extends StatelessWidget {
  final String SvgSrc;
  final String title;

  const PreventionCard({
    Key key, this.SvgSrc, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(SvgSrc),
      Text(title,
      style:
      Theme.of(context).textTheme.body2.copyWith(color: kPrimaryColor),
      )
      ],
    );
  }
}




