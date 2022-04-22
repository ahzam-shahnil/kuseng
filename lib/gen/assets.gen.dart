/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

// Flutter imports:
import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesLoginScreenGen get loginScreen =>
      const $AssetsImagesLoginScreenGen();
  $AssetsImagesOnboard1stGen get onboard1st =>
      const $AssetsImagesOnboard1stGen();
  $AssetsImagesOnboard2ndGen get onboard2nd =>
      const $AssetsImagesOnboard2ndGen();

  /// File path: assets/images/splash_image.png
  AssetGenImage get splashImage =>
      const AssetGenImage('assets/images/splash_image.png');
}

class $AssetsImagesLoginScreenGen {
  const $AssetsImagesLoginScreenGen();

  /// File path: assets/images/login_screen/login_image.png
  AssetGenImage get loginImage =>
      const AssetGenImage('assets/images/login_screen/login_image.png');
}

class $AssetsImagesOnboard1stGen {
  const $AssetsImagesOnboard1stGen();

  /// File path: assets/images/onboard_1st/lives_matter.png
  AssetGenImage get livesMatter =>
      const AssetGenImage('assets/images/onboard_1st/lives_matter.png');

  /// File path: assets/images/onboard_1st/onboard_image_1.png
  AssetGenImage get onboardImage1 =>
      const AssetGenImage('assets/images/onboard_1st/onboard_image_1.png');
}

class $AssetsImagesOnboard2ndGen {
  const $AssetsImagesOnboard2ndGen();

  /// File path: assets/images/onboard_2nd/partying.png
  AssetGenImage get partying =>
      const AssetGenImage('assets/images/onboard_2nd/partying.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
