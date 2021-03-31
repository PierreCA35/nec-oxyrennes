import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/library/widgets/card_evenement.dart';
import 'package:new_explorer_challenge/library/widgets/text_titre_bouton.dart';
import 'package:new_explorer_challenge/model/responsive.dart';
import 'package:new_explorer_challenge/values/values.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? new AppBar(
        centerTitle: true,
        title: Container(
            height: 100,
            width: 100,
            child: Image.asset("assets/logo_NEC_.png")
        ),
        backgroundColor: AppColors.blackLightColor,
      )
          : null,
      body: Container(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: TextTitreBouton(
                  'Nos évènements !',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 80, left: 30, right: 30),
                child:
                ResponsiveWidget.isSmallScreen(context) ||ResponsiveWidget.isMediumScreen(context)
                  ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index){
                     return CardEvenement();
                    },
                  )
                  : GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 10
                  ),
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, int){
                    return Container(
                      height: 100,
                      child: CardEvenement()
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartDocked,
      floatingActionButton: Container(
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.greyLightColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackLightColor,
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(1,3)
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: TextButton(
            onPressed: () => _show(context),
            child: Icon(Icons.menu, color: AppColors.blackLightColor,),
          ),
        ),
      ),
    );
  }
  
  void _show(BuildContext context){
    showModalBottomSheet(
      barrierColor: Color.fromRGBO(245, 245, 249, 0.2),
      isScrollControlled: true,
      elevation: 5,
      context: context,
      enableDrag: true,
      builder: (context){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.blackLightColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 15, bottom: 10, left: 60, right: 60),
                decoration: BoxDecoration(
                  color: AppColors.greyLightColor,
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  cursorColor: AppColors.blackLightColor,
                  decoration: InputDecoration(
                    hintText: "Recherche ...",
                    hintStyle: TextStyle(
                      color: AppColors.blackLightColor
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none
                      )
                    )
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 30, left: 10, right: 10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextTitreBouton(
                      "Tags populaires",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Chip(
                          label: TextTitreBouton(
                            "montagne",
                            color: AppColors.greyLightColor,
                            fontSize: 12,
                          ),
                          backgroundColor: AppColors.blackLightColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Chip(
                          label: TextTitreBouton(
                            "paysage",
                            color: AppColors.greyLightColor,
                            fontSize: 12,
                          ),
                          backgroundColor: AppColors.blackLightColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Chip(
                          label: TextTitreBouton(
                            "neige",
                            color: AppColors.greyLightColor,
                            fontSize: 12,
                          ),
                          backgroundColor: AppColors.blackLightColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Chip(
                          label: TextTitreBouton(
                            "soleil",
                            color: AppColors.greyLightColor,
                            fontSize: 12,
                          ),
                          backgroundColor: AppColors.blackLightColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: AppColors.blackLightColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextTitreBouton(
                                  "Mon trajet",
                                  color: AppColors.greyLightColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                ),
                                Icon(
                                  Icons.location_pin,
                                  color: AppColors.greyLightColor,
                                ),
                              ],
                            ),
                            onPressed: null,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: AppColors.blackLightColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextTitreBouton(
                                  "Evènements",
                                  color: AppColors.greyLightColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                ),
                                Icon(
                                  Icons.calendar_today_rounded,
                                  color: AppColors.greyLightColor,
                                ),
                              ],
                            ),
                            onPressed: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}
