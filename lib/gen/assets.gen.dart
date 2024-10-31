/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $ImagesGen {
  const $ImagesGen();

  /// Directory path: images/assets
  $ImagesAssetsGen get assets => const $ImagesAssetsGen();

  /// File path: images/boy6.jpg
  AssetGenImage get boy6 => const AssetGenImage('images/boy6.jpg');

  /// File path: images/specialoffer.png
  AssetGenImage get specialoffer =>
      const AssetGenImage('images/specialoffer.png');

  /// List of all assets
  List<AssetGenImage> get values => [boy6, specialoffer];
}

class $ImagesAssetsGen {
  const $ImagesAssetsGen();

  /// File path: images/assets/418461847-H-1024x700.jpg
  AssetGenImage get a418461847H1024x700 =>
      const AssetGenImage('images/assets/418461847-H-1024x700.jpg');

  /// File path: images/assets/hero-03-products.jpg
  AssetGenImage get hero03Products =>
      const AssetGenImage('images/assets/hero-03-products.jpg');

  /// File path: images/assets/images_pepsicochips.jpg
  AssetGenImage get imagesPepsicochips =>
      const AssetGenImage('images/assets/images_pepsicochips.jpg');

  /// File path: images/assets/medium_d0f33-SortWise-SW-HS-002-File-Carts-Heavy-Duty-Mobile-Storage-Organizer-3-Tier-Metal-Rolling-Utility-Cart-SortWise-.jpg
  AssetGenImage
      get mediumD0f33SortWiseSWHS002FileCartsHeavyDutyMobileStorageOrganizer3TierMetalRollingUtilityCartSortWise =>
          const AssetGenImage(
              'images/assets/medium_d0f33-SortWise-SW-HS-002-File-Carts-Heavy-Duty-Mobile-Storage-Organizer-3-Tier-Metal-Rolling-Utility-Cart-SortWise-.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        a418461847H1024x700,
        hero03Products,
        imagesPepsicochips,
        mediumD0f33SortWiseSWHS002FileCartsHeavyDutyMobileStorageOrganizer3TierMetalRollingUtilityCartSortWise
      ];
}

class Assets {
  Assets._();

  static const $ImagesGen images = $ImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
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
