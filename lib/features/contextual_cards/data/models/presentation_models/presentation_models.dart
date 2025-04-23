import 'package:equatable/equatable.dart';
import '../../enums/design_type.dart';

class CardGroupModel extends Equatable {
  final int id;
  final String name;
  final DesignType designType;
  final int cardType;
  final List<CardModel> cards;
  final bool isScrollable;
  final int height;
  final bool isFullWidth;
  final String slug;
  final int level;

  const CardGroupModel({
    required this.id,
    required this.name,
    required this.designType,
    required this.cardType,
    required this.cards,
    required this.isScrollable,
    required this.height,
    required this.isFullWidth,
    required this.slug,
    required this.level,
  });

  CardGroupModel copyWith({
    int? id,
    String? name,
    DesignType? designType,
    int? cardType,
    List<CardModel>? cards,
    bool? isScrollable,
    int? height,
    bool? isFullWidth,
    String? slug,
    int? level,
  }) {
    return CardGroupModel(
      id: id ?? this.id,
      name: name ?? this.name,
      designType: designType ?? this.designType,
      cardType: cardType ?? this.cardType,
      cards: cards ?? this.cards,
      isScrollable: isScrollable ?? this.isScrollable,
      height: height ?? this.height,
      isFullWidth: isFullWidth ?? this.isFullWidth,
      slug: slug ?? this.slug,
      level: level ?? this.level,
    );
  }

  @override
  List<Object?> get props => [id, name, designType, cardType, cards, isScrollable, height, isFullWidth, slug, level];
}

class CardModel extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String title;
  final FormattedTextModel formattedTitle;
  final String description;
  final FormattedTextModel formattedDescription;
  final CardImageModel icon;
  final CardImageModel bgImage;
  final String bgColor;
  final BgGradientModel bgGradient;
  final String url;
  final int iconSize;
  final bool isDisabled;
  final List<CTAModel> cta;
  final bool isShareable;
  final bool isInternal;

  const CardModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.title,
    required this.formattedTitle,
    required this.description,
    required this.formattedDescription,
    required this.icon,
    required this.bgImage,
    required this.bgColor,
    required this.bgGradient,
    required this.url,
    required this.iconSize,
    required this.isDisabled,
    required this.cta,
    required this.isShareable,
    required this.isInternal,
  });

  @override
  List<Object?> get props => [id, name, slug, title, formattedTitle, description, formattedDescription, icon, bgImage, bgColor, bgGradient, url, iconSize, isDisabled, cta, isShareable, isInternal];
}

class FormattedTextModel extends Equatable {
  final String text;
  final String align;
  final List<EntityModel> entities;
  final String color;
  final String fontStyle;
  final String fontFamily;
  final int fontSize;

  const FormattedTextModel({
    required this.text,
    required this.align,
    required this.entities,
    required this.color,
    required this.fontStyle,
    required this.fontFamily,
    required this.fontSize,
  });

  @override
  List<Object?> get props => [text, align, entities, color, fontStyle, fontFamily, fontSize];
}

class EntityModel extends Equatable {
  final String text;
  final String color;
  final String url;
  final String fontStyle;
  final String fontFamily;
  final int fontSize;

  const EntityModel({
    required this.text,
    required this.color,
    required this.url,
    required this.fontStyle,
    required this.fontFamily,
    required this.fontSize,
  });

  @override
  List<Object?> get props => [text, color, url, fontStyle, fontFamily, fontSize];
}

class CardImageModel extends Equatable {
  final String imageType;
  final String assetType;
  final String imageUrl;
  final double aspectRatio;

  const CardImageModel({
    required this.imageType,
    required this.assetType,
    required this.imageUrl,
    required this.aspectRatio,
  });

  @override
  List<Object?> get props => [imageType, assetType, imageUrl, aspectRatio];
}

class BgGradientModel extends Equatable {
  final int angle;
  final List<String> colors;

  const BgGradientModel({
    required this.angle,
    required this.colors,
  });

  @override
  List<Object?> get props => [angle, colors];
}

class CTAModel extends Equatable {
  final String text;
  final String type;
  final String bgColor;
  final String textColor;
  final bool isCircular;
  final bool isSecondary;
  final int strokeWidth;
  final String url;

  const CTAModel({
    required this.text,
    required this.type,
    required this.bgColor,
    required this.textColor,
    required this.isCircular,
    required this.isSecondary,
    required this.strokeWidth,
    required this.url,
  });

  @override
  List<Object?> get props => [text, type, bgColor, textColor, isCircular, isSecondary, strokeWidth, url];
} 