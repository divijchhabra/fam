import '../models/network_models/network_models.dart';
import '../models/presentation_models/presentation_models.dart';
import '../enums/design_type.dart';

extension ContextualCardResponseMapper on ContextualCardResponseNetworkModel {
  List<CardGroupModel> toPresentation() {
    return cardGroups.map((e) => e.toPresentation()).toList();
  }
}

extension CardGroupMapper on CardGroupNetworkModel {
  CardGroupModel toPresentation() {
    return CardGroupModel(
      id: id,
      name: name,
      designType: DesignType.fromString(designType),
      cardType: cardType,
      cards: cards.map((e) => e.toPresentation()).toList(),
      isScrollable: isScrollable,
      height: height,
      isFullWidth: isFullWidth,
      slug: slug,
      level: level,
    );
  }
}

extension CardDetailsMapper on CardDetailsNetworkModel {
  CardModel toPresentation() {
    return CardModel(
      id: id,
      name: name,
      slug: slug,
      title: title,
      formattedTitle: formattedTitle?.toPresentation(),
      description: description,
      formattedDescription: formattedDescription?.toPresentation(),
      icon: icon?.toPresentation(),
      bgImage: bgImage?.toPresentation(),
      bgColor: bgColor,
      bgGradient: bgGradient?.toPresentation(),
      url: url,
      iconSize: iconSize,
      isDisabled: isDisabled,
      cta: cta?.map((e) => e.toPresentation()).toList(),
      isShareable: isShareable,
      isInternal: isInternal,
    );
  }
}

extension FormattedTextMapper on FormattedTextNetworkModel {
  FormattedTextModel toPresentation() {
    return FormattedTextModel(
      text: text,
      align: align,
      entities: entities.map((e) => e.toPresentation()).toList(),
    );
  }
}

extension EntityMapper on EntityNetworkModel {
  EntityModel toPresentation() {
    return EntityModel(
      text: text,
      color: color,
      url: url,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      fontSize: fontSize,
    );
  }
}

extension CardImageMapper on CardImageNetworkModel {
  CardImageModel toPresentation() {
    return CardImageModel(
      imageType: imageType,
      assetType: assetType,
      imageUrl: imageUrl,
      aspectRatio: aspectRatio,
    );
  }
}

extension BgGradientMapper on BgGradientNetworkModel {
  BgGradientModel toPresentation() {
    return BgGradientModel(
      angle: angle,
      colors: colors,
    );
  }
}

extension CTAMapper on CTANetworkModel {
  CTAModel toPresentation() {
    return CTAModel(
      text: text,
      type: type,
      bgColor: bgColor,
      textColor: textColor,
      isCircular: isCircular,
      isSecondary: isSecondary,
      strokeWidth: strokeWidth,
      url: url,
    );
  }
} 