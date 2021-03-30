import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_explorer_challenge/library/widgets/constants.dart';
import 'package:new_explorer_challenge/pages/ajouter_contenu.dart';
import 'package:new_explorer_challenge/pages/log_sign/login_signup_page.dart';
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
          title: Container(
              height: 100,
              width: 100,
              child: Image.asset("assets/logo_NEC_.png")
          ),
          backgroundColor: AppColors.blackLightColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 40,
          width: 40,
          child: FloatingActionButton(
            backgroundColor: AppColors.blackLightColor,
            child: Icon(Icons.add_rounded, color: AppColors.beigeColor, size: 40,),
            onPressed: (){
              if (me == null){
                return Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSignUpPage()));
              }else{
                return Navigator.push(context, MaterialPageRoute(builder: (context) => AjouterContenu()));
              }
            },
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

/*
class HomePage extends StatelessWidget{

  final double heightForSmallImages = 100.0;
  final double heightForBigImages = 200.0;

  @override
  Widget build(BuildContext context) {
    var marginBetweenImages = Sizes.MARGIN_16 * 2;
    var marginAroundEntireScreen = Sizes.MARGIN_16 * 2;
    var widthOfScreen = MediaQuery.of(context).size.width;
    var widthOfSmallImage = (widthOfScreen - (marginAroundEntireScreen + marginBetweenImages)) / 3;
    var widthOfLargeImage = (widthOfSmallImage * 2) + 16;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: Sizes.MARGIN_16, vertical: Sizes.MARGIN_16),
        child: ListView(
          children: <Widget>[
            straightLineImageRow(imageWidth: widthOfSmallImage, context: context),
            SizedBox(height: Sizes.MARGIN_16),
            gridImageRow(
                widthOfSmallImage: widthOfSmallImage,
                widthOfLargeImage: widthOfLargeImage,
                context: context),
            SizedBox(height: Sizes.MARGIN_16),
            straightLineImageRow(imageWidth: widthOfSmallImage, context: context),
            SizedBox(height: Sizes.MARGIN_16),
            fullWidth(width: widthOfScreen, context: context)
          ],
        ),
      ),
    );
  }

  Widget straightLineImageRow({
    @required double imageWidth,
    @required BuildContext context,
  }) {
    return Row(
      children: createImageRow(
        numberOfImages: 3,
        imageWidth: imageWidth,
        context: context,
      ),
    );
  }

  Widget gridImageRow({
    @required double widthOfSmallImage,
    @required double widthOfLargeImage,
    @required BuildContext context,
  }) {
    return Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: null,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                child: Image.asset(
                  ImagePath.homeImage1,
                  width: widthOfSmallImage,
                  height: heightForSmallImages,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(height: Sizes.MARGIN_16),
            InkWell(
              onTap: null,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
                child: Image.asset(
                  ImagePath.homeImage5,
                  width: widthOfSmallImage,
                  height: heightForSmallImages,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: Sizes.MARGIN_16),
        InkWell(
          onTap: null,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
            child: Image.asset(
              ImagePath.homeImage1,
              width: widthOfLargeImage,
              fit: BoxFit.fitHeight,
              height: heightForBigImages + Sizes.MARGIN_16,
            ),
          ),
        )
      ],
    );
  }

  List<Widget> createImageRow(
      {@required numberOfImages,
        @required imageWidth,
        @required BuildContext context}) {
    List<Widget> images = [];
    List<String> imagePaths = [
      ImagePath.random0,
      ImagePath.random1,
      ImagePath.random2,
      ImagePath.random3,

    ];

    List<int> list = List<int>.generate(numberOfImages, (i) => i + 1);

    list.forEach((i) {
      images.add(
        InkWell(
          onTap: null,
          child: Container(
            margin: EdgeInsets.only(
                right: (i != numberOfImages) ? Sizes.MARGIN_16 : 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
              child: Image.asset(
                imagePaths[i - 1],
                width: imageWidth,
                height: heightForSmallImages,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      );
    });
    return images;
  }

  Widget fullWidth(
      {@required width, height = 200.0, @required BuildContext context}) {
    return InkWell(
      onTap: null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
        child: Image.asset(
          ImagePath.homeImage2,
          width: width,
          height: height,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
*/