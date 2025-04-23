import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contextual_cards_network_model.g.dart';

@JsonSerializable()
class ContextualCardResponseNetworkModel extends Equatable {
  final List<CardGroupNetworkModel> cardGroups;

  const ContextualCardResponseNetworkModel({required this.cardGroups});

  factory ContextualCardResponseNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$ContextualCardResponseNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContextualCardResponseNetworkModelToJson(this);

  @override
  List<Object?> get props => [cardGroups];
}

@JsonSerializable()
class CardGroupNetworkModel extends Equatable {
  final int id;
  final String name;
  @JsonKey(name: 'design_type')
  final String designType;
  @JsonKey(name: 'card_type')
  final int cardType;
  final List<CardDetailsNetworkModel> cards;
  @JsonKey(name: 'is_scrollable')
  final bool isScrollable;
  final int? height;
  @JsonKey(name: 'is_full_width')
  final bool isFullWidth;
  final String? slug;
  final int level;

  const CardGroupNetworkModel({
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

  factory CardGroupNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$CardGroupNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardGroupNetworkModelToJson(this);

  @override
  List<Object?> get props => [id, name, designType, cardType, cards, isScrollable, height, isFullWidth, slug, level];
}

@JsonSerializable()
class CardDetailsNetworkModel extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String? title;
  @JsonKey(name: 'formatted_title')
  final FormattedTextNetworkModel? formattedTitle;
  final String? description;
  @JsonKey(name: 'formatted_description')
  final FormattedTextNetworkModel? formattedDescription;
  final CardImageNetworkModel? icon;
  @JsonKey(name: 'bg_image')
  final CardImageNetworkModel? bgImage;
  @JsonKey(name: 'bg_color')
  final String? bgColor;
  @JsonKey(name: 'bg_gradient')
  final BgGradientNetworkModel? bgGradient;
  final String? url;
  @JsonKey(name: 'icon_size')
  final int? iconSize;
  @JsonKey(name: 'is_disabled')
  final bool isDisabled;
  final List<CTANetworkModel>? cta;
  @JsonKey(name: 'is_shareable')
  final bool isShareable;
  @JsonKey(name: 'is_internal')
  final bool isInternal;

  const CardDetailsNetworkModel({
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

  factory CardDetailsNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$CardDetailsNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardDetailsNetworkModelToJson(this);

  @override
  List<Object?> get props => [id, name, slug, title, formattedTitle, description, formattedDescription, icon, bgImage, bgColor, bgGradient, url, iconSize, isDisabled, cta, isShareable, isInternal];
}

@JsonSerializable()
class FormattedTextNetworkModel extends Equatable {
  final String text;
  final String align;
  final List<EntityNetworkModel> entities;
  @JsonKey(name: 'color')
  final String? color;
  @JsonKey(name: 'font_style')
  final String? fontStyle;
  @JsonKey(name: 'font_family')
  final String? fontFamily;
  @JsonKey(name: 'font_size')
  final int? fontSize;

  const FormattedTextNetworkModel({
    required this.text,
    required this.align,
    required this.entities,
    this.color,
    this.fontStyle,
    this.fontFamily,
    this.fontSize,
  });

  factory FormattedTextNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$FormattedTextNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$FormattedTextNetworkModelToJson(this);

  @override
  List<Object?> get props => [text, align, entities, color, fontStyle, fontFamily, fontSize];
}

@JsonSerializable()
class EntityNetworkModel extends Equatable {
  final String? text;
  final String? color;
  final String? url;
  @JsonKey(name: 'font_style')
  final String? fontStyle;
  @JsonKey(name: 'font_family')
  final String? fontFamily;
  @JsonKey(name: 'font_size')
  final int? fontSize;

  const EntityNetworkModel({
    this.text,
    this.color,
    this.url,
    this.fontStyle,
    this.fontFamily,
    this.fontSize,
  });

  factory EntityNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$EntityNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$EntityNetworkModelToJson(this);

  @override
  List<Object?> get props => [text, color, url, fontStyle, fontFamily, fontSize];
}

@JsonSerializable()
class CardImageNetworkModel extends Equatable {
  @JsonKey(name: 'image_type')
  final String? imageType;
  @JsonKey(name: 'asset_type')
  final String? assetType;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'aspect_ratio')
  final double? aspectRatio;

  const CardImageNetworkModel({
    this.imageType,
    this.assetType,
    this.imageUrl,
    this.aspectRatio,
  });

  factory CardImageNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$CardImageNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardImageNetworkModelToJson(this);

  @override
  List<Object?> get props => [imageType, assetType, imageUrl, aspectRatio];
}

@JsonSerializable()
class BgGradientNetworkModel extends Equatable {
  final int? angle;
  final List<String>? colors;

  const BgGradientNetworkModel({
    this.angle,
    this.colors,
  });

  factory BgGradientNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$BgGradientNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$BgGradientNetworkModelToJson(this);

  @override
  List<Object?> get props => [angle, colors];
}

@JsonSerializable()
class CTANetworkModel extends Equatable {
  final String? text;
  final String? type;
  @JsonKey(name: 'bg_color')
  final String? bgColor;
  @JsonKey(name: 'text_color')
  final String? textColor;
  @JsonKey(name: 'is_circular')
  final bool? isCircular;
  @JsonKey(name: 'is_secondary')
  final bool? isSecondary;
  @JsonKey(name: 'stroke_width')
  final int? strokeWidth;
  final String? url;

  const CTANetworkModel({
    this.text,
    this.type,
    this.bgColor,
    this.textColor,
    this.isCircular,
    this.isSecondary,
    this.strokeWidth,
    this.url,
  });

  factory CTANetworkModel.fromJson(Map<String, dynamic> json) =>
      _$CTANetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$CTANetworkModelToJson(this);

  @override
  List<Object?> get props => [text, type, bgColor, textColor, isCircular, isSecondary, strokeWidth, url];
} 