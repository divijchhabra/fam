import 'package:fam_assignment/features/contextual_cards/data/enums/design_type.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/network_models/network_models.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';

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
      height: height ?? 0,
      isFullWidth: isFullWidth,
      slug: slug ?? '',
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
      title: title ?? '',
      formattedTitle: formattedTitle?.toPresentation() ??
          const FormattedTextModel(
            text: '',
            align: 'left',
            entities: [],
            color: '#000000',
            fontStyle: 'normal',
            fontFamily: '',
            fontSize: 16,
          ),
      description: description ?? '',
      formattedDescription: formattedDescription?.toPresentation() ??
          const FormattedTextModel(
            text: '',
            align: 'left',
            entities: [],
            color: '#000000',
            fontStyle: 'normal',
            fontFamily: '',
            fontSize: 16,
          ),
      icon: icon?.toPresentation() ??
          const CardImageModel(
            imageType: '',
            assetType: '',
            imageUrl: '',
            aspectRatio: 1.0,
          ),
      bgImage: bgImage?.toPresentation() ??
          const CardImageModel(
            imageType: '',
            assetType: '',
            imageUrl: '',
            aspectRatio: 1.0,
          ),
      bgColor: bgColor ?? '#FFFFFF',
      bgGradient: bgGradient?.toPresentation() ??
          const BgGradientModel(
            angle: 0,
            colors: [],
          ),
      url: url ?? '',
      iconSize: iconSize ?? 16,
      isDisabled: isDisabled,
      cta: cta?.map((e) => e.toPresentation()).toList() ?? [],
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
      color: color ?? '#000000',
      fontStyle: fontStyle ?? 'normal',
      fontFamily: fontFamily ?? '',
      fontSize: fontSize ?? 16,
    );
  }
}

extension EntityMapper on EntityNetworkModel {
  EntityModel toPresentation() {
    return EntityModel(
      text: text ?? '',
      color: color ?? '#000000',
      url: url ?? '',
      fontStyle: fontStyle ?? 'normal',
      fontFamily: fontFamily ?? '',
      fontSize: fontSize ?? 16,
    );
  }
}

extension CardImageMapper on CardImageNetworkModel {
  CardImageModel toPresentation() {
    return CardImageModel(
      imageType: imageType ?? '',
      assetType: assetType ?? '',
      imageUrl: imageUrl ?? '',
      aspectRatio: aspectRatio ?? 1.0,
    );
  }
}

extension BgGradientMapper on BgGradientNetworkModel {
  BgGradientModel toPresentation() {
    return BgGradientModel(
      angle: angle ?? 0,
      colors: colors ?? [],
    );
  }
}

extension CTAMapper on CTANetworkModel {
  CTAModel toPresentation() {
    return CTAModel(
      text: text ?? '',
      type: type ?? '',
      bgColor: bgColor ?? '#FFFFFF',
      textColor: textColor ?? '#000000',
      isCircular: isCircular ?? false,
      isSecondary: isSecondary ?? false,
      strokeWidth: strokeWidth ?? 1,
      url: url ?? '',
    );
  }
}
