// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class Banner_view extends StatefulWidget {
  const Banner_view({super.key});

  @override
  State<Banner_view> createState() => _BannerviewState();
}

class _BannerviewState extends State<Banner_view> {
  List<String> images = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, itemIndex, _) => Container(
            height: 125.h,
            // width: MediaQuery.of(context).size.width,
            //width: 360.w,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(images[itemIndex]), fit: BoxFit.fill),
            ),
          ),
          options: CarouselOptions(
            pauseAutoPlayOnTouch: false,
            initialPage: 0,
            reverse: false,
            height: 121.h,
            autoPlayInterval: const Duration(seconds: 5),
            pageSnapping: false,
            disableCenter: true,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        buildIndicator(),
      ],
    );
  }

  Widget buildIndicator() {
    return CarouselIndicator(
      count: images.length,
      index: activeIndex,
      color: darkGrey,
      activeColor: brown,
      width: 17.w,
      height: 2.h,
    );
  }
}
