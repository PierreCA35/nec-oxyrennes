import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/model/responsive.dart';
import 'package:new_explorer_challenge/values/values.dart';
import 'package:new_explorer_challenge/model/responsive.dart';



class SearchPage extends StatefulWidget {
  
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
@override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.blackLightColor,
          centerTitle: true,
          title: Container(
              height: 100,
              width: 100,
              child: Image.asset("assets/logo_NEC_.png")),
      ),
      body: Column(
        children: <Widget>[
          _buildEventsPage(context),
          // _buildItinaryTitle(context),
          // _buildItinaryCard(context)
        ],
      )
    );
  }

  Widget _buildEventsPage(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(50, 50, 50, 20),
          child: Text(
            'Nos Évènements !',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
          child: Card(
            elevation: 10,
            child: Column(
              children: <Widget>[
                Image.asset('assets/mountain.png'),
                Text(
                  'Work floor',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Lorem ipsum dolor amet, consetetur sadipscing elitr, se ipsum dolor ...',
                      ),
                      TextButton(
                        onPressed: null, 
                        child: Text(
                          'Voir plus->',
                        )
                      )
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: FlatButton(
                    child: Text(
                      'Inscription',
                    ),
                    color: Colors.black,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                )
              ],
            )
          )
        )
      ],
    );
  }



}
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         backgroundColor: AppColors.blackLightColor,
//           centerTitle: true,
//           title: Container(
//               height: 100,
//               width: 100,
//               child: Image.asset("assets/logo_NEC_.png")),
//       ),
//       body: Column(
//         children: <Widget>[
//           _buildFormItinary(context),
//           _buildItinaryTitle(context),
//           _buildItinaryCard(context)
//         ],
//       )
//     );
//   }

//   Widget _buildFormItinary(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.fromLTRB(50, 50, 50, 20),
//           child: TextField(
//             decoration: InputDecoration(
//               suffixIcon: new Icon(Icons.location_on),
//               border: OutlineInputBorder(),
//               hintText: 'Position...',
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(50, 20, 50, 30),
//           child: TextField(
//             decoration: InputDecoration(
//               suffixIcon: new Icon(Icons.near_me),
//               border: OutlineInputBorder(),
//               hintText: 'Destination...',
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildItinaryTitle(BuildContext context) {
//     return Container(
//       child: Padding(
//         padding: EdgeInsets.all(30.0),
//         child: Center(
//           child: Text(
//             'Mon trajet Eco-responsable',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold
//             ),
//           ),
//         ),
//       ),
//     );
//   }
  
//   Widget _buildItinaryCard(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             new Icon(
//               Icons.train,
//               size: 60,
//             ),
//             Card(
//               elevation: 10,
//               shadowColor: Colors.black,
//               child: SizedBox(
//                 width: 280,
//                 height: 50,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: <Widget>[
//             new Icon(
//               Icons.bus_alert,
//               size: 60,
//             ),
//             Card(
//               elevation: 10,
//               shadowColor: Colors.black,
//               child: SizedBox(
//                 width: 280,
//                 height: 50,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: <Widget>[
//             new Icon(
//               Icons.pedal_bike,
//               size: 60,
//             ),
//             Card(
//               elevation: 10,
//               shadowColor: Colors.black,
//               child: SizedBox(
//                 width: 280,
//                 height: 50,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ]
//     );
//   }
// }
