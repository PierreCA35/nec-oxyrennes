
import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/pages/evenement_plus.dart';
import 'package:new_explorer_challenge/pages/inscription_evenement.dart';
import 'package:new_explorer_challenge/values/values.dart';

class CardEvenement extends StatefulWidget {
  @override
  _CardEvenementState createState() => _CardEvenementState();
}

class _CardEvenementState extends State<CardEvenement> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 15),
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/mountain.png"),
                    fit: BoxFit.cover
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, bottom: 5.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Work floor',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Lorem ipsum dolor amet, consetetur sadipscing elitr, se ipsum dolor ...',
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          child: Text(
                            'Voir plus ->',
                            style: TextStyle(
                                color: AppColors.beigeColor,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => EvenementPlus())),
                        ),
                      )
                    ],
                  )
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 40,
                  width: 100,
                  margin: EdgeInsets.only(bottom: 10, right: 5.0),
                  child: TextButton(
                    child: Text(
                      'Inscription',
                      style: TextStyle(
                          color: AppColors.greyLightColor
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.blackLightColor)
                    ),
                    onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => InscriptionEvenement())),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
