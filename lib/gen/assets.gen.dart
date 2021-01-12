/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get articlePlaceholder =>
      const AssetGenImage('assets/images/article_placeholder.webp');
  AssetGenImage get bgHeader =>
      const AssetGenImage('assets/images/bg_header.png');
  AssetGenImage get iconPlaceholder =>
      const AssetGenImage('assets/images/icon_placeholder.jpg');
  AssetGenImage get iconSelected =>
      const AssetGenImage('assets/images/icon_selected.png');
  AssetGenImage get jyetj => const AssetGenImage('assets/images/jyetj.png');
  AssetGenImage get sjzs => const AssetGenImage('assets/images/sjzs.png');
  AssetGenImage get sptj => const AssetGenImage('assets/images/sptj.png');
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  SvgGenImage get bgHeader => const SvgGenImage('assets/svgs/bg_header.svg');
  SvgGenImage get calendar => const SvgGenImage('assets/svgs/calendar.svg');
  SvgGenImage get chart => const SvgGenImage('assets/svgs/chart.svg');
  SvgGenImage get filter => const SvgGenImage('assets/svgs/filter.svg');
  SvgGenImage get icHomeIn => const SvgGenImage('assets/svgs/ic_home_in.svg');
  SvgGenImage get icHomeOut => const SvgGenImage('assets/svgs/ic_home_out.svg');
  SvgGenImage get icList => const SvgGenImage('assets/svgs/ic_list.svg');
  SvgGenImage get icScanner => const SvgGenImage('assets/svgs/ic_scanner.svg');
  SvgGenImage get image => const SvgGenImage('assets/svgs/image.svg');
  SvgGenImage get menu => const SvgGenImage('assets/svgs/menu.svg');
  SvgGenImage get scan => const SvgGenImage('assets/svgs/scan.svg');
  SvgGenImage get search => const SvgGenImage('assets/svgs/search.svg');
  SvgGenImage get setting => const SvgGenImage('assets/svgs/setting.svg');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName)
      : _assetName = assetName,
        super(assetName);
  final String _assetName;

  Image image({
    Key key,
    ImageFrameBuilder frameBuilder,
    ImageLoadingBuilder loadingBuilder,
    ImageErrorWidgetBuilder errorBuilder,
    String semanticLabel,
    bool excludeFromSemantics = false,
    double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect centerSlice,
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

  String get path => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key key,
    bool matchTextDirection = false,
    AssetBundle bundle,
    String package,
    double width,
    double height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder placeholderBuilder,
    Color color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
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
    );
  }

  String get path => _assetName;
}
