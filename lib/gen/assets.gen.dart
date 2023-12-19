/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $EnvGen {
  const $EnvGen();

  /// File path: env/.env.dev
  String get env => 'env/.env.dev';

  /// List of all assets
  List<String> get values => [env];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/android-bg.png
  AssetGenImage get androidBg =>
      const AssetGenImage('assets/images/android-bg.png');

  /// File path: assets/images/fitness-record-android.png
  AssetGenImage get fitnessRecordAndroid =>
      const AssetGenImage('assets/images/fitness-record-android.png');

  /// File path: assets/images/fitness-record-icon.png
  AssetGenImage get fitnessRecordIcon =>
      const AssetGenImage('assets/images/fitness-record-icon.png');

  /// File path: assets/images/fitness-record.png
  AssetGenImage get fitnessRecord =>
      const AssetGenImage('assets/images/fitness-record.png');

  /// File path: assets/images/gym-background.png
  AssetGenImage get gymBackground =>
      const AssetGenImage('assets/images/gym-background.png');

  /// File path: assets/images/home-icon-active.png
  AssetGenImage get homeIconActive =>
      const AssetGenImage('assets/images/home-icon-active.png');

  /// File path: assets/images/home-icon.png
  AssetGenImage get homeIcon =>
      const AssetGenImage('assets/images/home-icon.png');

  /// File path: assets/images/list_choice_tooltip.png
  AssetGenImage get listChoiceTooltip =>
      const AssetGenImage('assets/images/list_choice_tooltip.png');

  /// File path: assets/images/loading-lipple.gif
  AssetGenImage get loadingLipple =>
      const AssetGenImage('assets/images/loading-lipple.gif');

  /// File path: assets/images/my-video-icon.png
  AssetGenImage get myVideoIcon =>
      const AssetGenImage('assets/images/my-video-icon.png');

  /// File path: assets/images/record-fitness.png
  AssetGenImage get recordFitness =>
      const AssetGenImage('assets/images/record-fitness.png');

  /// File path: assets/images/setting-icon-active.png
  AssetGenImage get settingIconActive =>
      const AssetGenImage('assets/images/setting-icon-active.png');

  /// File path: assets/images/setting-icon.png
  AssetGenImage get settingIcon =>
      const AssetGenImage('assets/images/setting-icon.png');

  /// File path: assets/images/tips-con.png
  AssetGenImage get tipsCon =>
      const AssetGenImage('assets/images/tips-con.png');

  /// File path: assets/images/tips-icon-active.png
  AssetGenImage get tipsIconActive =>
      const AssetGenImage('assets/images/tips-icon-active.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        androidBg,
        fitnessRecordAndroid,
        fitnessRecordIcon,
        fitnessRecord,
        gymBackground,
        homeIconActive,
        homeIcon,
        listChoiceTooltip,
        loadingLipple,
        myVideoIcon,
        recordFitness,
        settingIconActive,
        settingIcon,
        tipsCon,
        tipsIconActive
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $EnvGen env = $EnvGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
