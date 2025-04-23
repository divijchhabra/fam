import 'package:equatable/equatable.dart';
import '../../enums/design_type.dart';

class CardGroupModel extends Equatable {
  final int id;
  final String name;
  final DesignType designType;
  final int cardType;
  final List<CardModel> cards;
  final bool isScrollable;
  final int? height;
  final bool isFullWidth;
  final String? slug;
  final int level;

  const CardGroupModel({
    required this.id,
    required this.name,
    required this.designType,
    required this.cardType,
    required this.cards,
    required this.isScrollable,
    this.height,
    required this.isFullWidth,
    this.slug,
    required this.level,
  });

  @override
  List<Object?> get props => [id, name, designType, cardType, cards, isScrollable, height, isFullWidth, slug, level];
}

class CardModel extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String? title;
  final FormattedTextModel? formattedTitle;
  final String? description;
  final FormattedTextModel? formattedDescription;
  final CardImageModel? icon;
  final CardImageModel? bgImage;
  final String? bgColor;
  final BgGradientModel? bgGradient;
  final String? url;
  final int? iconSize;
  final bool isDisabled;
  final List<CTAModel>? cta;
  final bool isShareable;
  final bool isInternal;

  const CardModel({
    required this.id,
    required this.name,
    required this.slug,
    this.title,
    this.formattedTitle,
    this.description,
    this.formattedDescription,
    this.icon,
    this.bgImage,
    this.bgColor,
    this.bgGradient,
    this.url,
    this.iconSize,
    required this.isDisabled,
    this.cta,
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
  final String? color;
  final String? fontStyle;
  final String? fontFamily;
  final int? fontSize;

  const FormattedTextModel({
    required this.text,
    required this.align,
    required this.entities,
    this.color,
    this.fontStyle,
    this.fontFamily,
    this.fontSize,
  });

  @override
  List<Object?> get props => [text, align, entities, color, fontStyle, fontFamily, fontSize];
}

class EntityModel extends Equatable {
  final String? text;
  final String? color;
  final String? url;
  final String? fontStyle;
  final String? fontFamily;
  final int? fontSize;

  const EntityModel({
    this.text,
    this.color,
    this.url,
    this.fontStyle,
    this.fontFamily,
    this.fontSize,
  });

  @override
  List<Object?> get props => [text, color, url, fontStyle, fontFamily, fontSize];
}

class CardImageModel extends Equatable {
  final String? imageType;
  final String? assetType;
  final String? imageUrl;
  final double? aspectRatio;

  const CardImageModel({
    this.imageType,
    this.assetType,
    this.imageUrl,
    this.aspectRatio,
  });

  @override
  List<Object?> get props => [imageType, assetType, imageUrl, aspectRatio];
}

class BgGradientModel extends Equatable {
  final int? angle;
  final List<String>? colors;

  const BgGradientModel({
    this.angle,
    this.colors,
  });

  @override
  List<Object?> get props => [angle, colors];
}

class CTAModel extends Equatable {
  final String? text;
  final String? type;
  final String? bgColor;
  final String? textColor;
  final bool? isCircular;
  final bool? isSecondary;
  final int? strokeWidth;
  final String? url;

  const CTAModel({
    this.text,
    this.type,
    this.bgColor,
    this.textColor,
    this.isCircular,
    this.isSecondary,
    this.strokeWidth,
    this.url,
  });

  @override
  List<Object?> get props => [text, type, bgColor, textColor, isCircular, isSecondary, strokeWidth, url];
} 