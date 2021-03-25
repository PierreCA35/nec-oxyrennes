import 'package:flutter/material.dart';
import 'package:new_explorer_challenge/values/values.dart';

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
      ImagePath.homeImage1,
      ImagePath.homeImage2,
      ImagePath.homeImage3,
      ImagePath.homeImage4,
      ImagePath.homeImage5,
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