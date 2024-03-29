/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesLoginScreenGen get loginScreen =>
      const $AssetsImagesLoginScreenGen();

  /// File path: assets/images/maps.png
  AssetGenImage get maps => const AssetGenImage('assets/images/maps.png');

  $AssetsImagesOnboard1stGen get onboard1st =>
      const $AssetsImagesOnboard1stGen();
  $AssetsImagesOnboard2ndGen get onboard2nd =>
      const $AssetsImagesOnboard2ndGen();
  $AssetsImagesSignUpGen get signUp => const $AssetsImagesSignUpGen();

  /// File path: assets/images/splash_image.png
  AssetGenImage get splashImage =>
      const AssetGenImage('assets/images/splash_image.png');

  $AssetsImagesSvgsGen get svgs => const $AssetsImagesSvgsGen();
}

class $AssetsTfliteGen {
  const $AssetsTfliteGen();

  /// File path: assets/tflite/labels.txt
  String get labels => 'assets/tflite/labels.txt';

  /// File path: assets/tflite/model.tflite
  String get model => 'assets/tflite/model.tflite';
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

class $AssetsImagesSignUpGen {
  const $AssetsImagesSignUpGen();

  /// File path: assets/images/sign_up/placeholder.svg
  SvgGenImage get placeholder =>
      const SvgGenImage('assets/images/sign_up/placeholder.svg');
}

class $AssetsImagesSvgsGen {
  const $AssetsImagesSvgsGen();

  /// File path: assets/images/svgs/maps.svg
  SvgGenImage get maps => const SvgGenImage('assets/images/svgs/maps.svg');

  /// File path: assets/images/svgs/selfie.svg
  SvgGenImage get selfie => const SvgGenImage('assets/images/svgs/selfie.svg');

  /// File path: assets/images/svgs/survey.svg
  SvgGenImage get survey => const SvgGenImage('assets/images/svgs/survey.svg');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTfliteGen tflite = $AssetsTfliteGen();
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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
