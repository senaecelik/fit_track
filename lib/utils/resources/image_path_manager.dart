class ImagePathManager {
  static final ImagePathManager _instance = ImagePathManager._init();
  static ImagePathManager get instance => _instance;
  ImagePathManager._init();

  final String facebookPath = "assets/images/facebook.png";
  final String googlePath = "assets/images/google.png";
  final String macPath = "assets/images/mac.png";
  final String notFoundPath = "assets/images/notfound.png";


}
