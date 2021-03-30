import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_explorer_challenge/values/values.dart';

/*List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 3),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 3),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 3),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 1),
];*/
 const String random0 = 'https://picsum.photos/207/300/?random';
 const String random1 = 'https://picsum.photos/207/300/?random';
 const String random2 = 'https://picsum.photos/207/300/?random';
 const String random3 = 'https://picsum.photos/207/300/?random';
 const String random4 = 'https://picsum.photos/207/300/?random';
class HomePage extends StatelessWidget {
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
        floatingActionButton: Container(
          height: 30,
          width: 30,
          child: FloatingActionButton(
            child: Icon(Icons.add_rounded, color: AppColors.blackLightColor,),
            onPressed: null,
          ),
        ),
        body: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemCount: 15,
          itemBuilder: (context, index){
            return _ImageTile(random0);
          },
          staggeredTileBuilder: (index){
            return new StaggeredTile.count(
              2,
              index.isEven ? 2 : 1,
            );
          },
        ),
    );
  }
}



class _ImageTile extends StatelessWidget{
  const _ImageTile(this.gridCard);
  final gridCard;
  @override
  Widget build(BuildContext context) {
    return new Card(
      color: const Color(0x00000000),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
      ),
      elevation: 3.0,
      child: new GestureDetector(
        onTap: () {},
        child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(gridCard),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
            )
        ),
      ),
    );
  }
}