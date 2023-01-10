class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Get Started' 'with Saanpay',
      image: "assets/images/splash_screen1.png",
      discription: "Get Rewarded on Every Payment"),
  UnbordingContent(
      title: 'Pay Using' 'QR Code',
      image: "assets/images/splash_screen2.png",
      discription: "Payment made easy"
          " with Quick Scan & Pay"),
  UnbordingContent(
      title: 'We Give Best' 'Services',
      image: "assets/images/splash_screen3.png",
      discription:
          "We Do Rechange, Money Transfer," "Bill Payment with 0 Charges"),
];
