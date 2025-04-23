// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contextual_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContextualCardResponseNetworkModel _$ContextualCardResponseNetworkModelFromJson(
        Map<String, dynamic> json) =>
    ContextualCardResponseNetworkModel(
      cardGroups: (json['cardGroups'] as List<dynamic>)
          .map((e) => CardGroupNetworkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContextualCardResponseNetworkModelToJson(
        ContextualCardResponseNetworkModel instance) =>
    <String, dynamic>{
      'cardGroups': instance.cardGroups,
    };

CardGroupNetworkModel _$CardGroupNetworkModelFromJson(
        Map<String, dynamic> json) =>
    CardGroupNetworkModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      designType: json['design_type'] as String,
      cardType: (json['card_type'] as num).toInt(),
      cards: (json['cards'] as List<dynamic>)
          .map((e) =>
              CardDetailsNetworkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isScrollable: json['is_scrollable'] as bool,
      height: (json['height'] as num?)?.toInt(),
      isFullWidth: json['is_full_width'] as bool,
      slug: json['slug'] as String?,
      level: (json['level'] as num).toInt(),
    );

Map<String, dynamic> _$CardGroupNetworkModelToJson(
        CardGroupNetworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'design_type': instance.designType,
      'card_type': instance.cardType,
      'cards': instance.cards,
      'is_scrollable': instance.isScrollable,
      'height': instance.height,
      'is_full_width': instance.isFullWidth,
      'slug': instance.slug,
      'level': instance.level,
    };

CardDetailsNetworkModel _$CardDetailsNetworkModelFromJson(
        Map<String, dynamic> json) =>
    CardDetailsNetworkModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      title: json['title'] as String?,
      formattedTitle: json['formatted_title'] == null
          ? null
          : FormattedTextNetworkModel.fromJson(
              json['formatted_title'] as Map<String, dynamic>),
      description: json['description'] as String?,
      formattedDescription: json['formatted_description'] == null
          ? null
          : FormattedTextNetworkModel.fromJson(
              json['formatted_description'] as Map<String, dynamic>),
      icon: json['icon'] == null
          ? null
          : CardImageNetworkModel.fromJson(
              json['icon'] as Map<String, dynamic>),
      bgImage: json['bg_image'] == null
          ? null
          : CardImageNetworkModel.fromJson(
              json['bg_image'] as Map<String, dynamic>),
      bgColor: json['bg_color'] as String?,
      bgGradient: json['bg_gradient'] == null
          ? null
          : BgGradientNetworkModel.fromJson(
              json['bg_gradient'] as Map<String, dynamic>),
      url: json['url'] as String?,
      iconSize: (json['icon_size'] as num?)?.toInt(),
      isDisabled: json['is_disabled'] as bool,
      cta: (json['cta'] as List<dynamic>?)
          ?.map((e) => CTANetworkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isShareable: json['is_shareable'] as bool,
      isInternal: json['is_internal'] as bool,
    );

Map<String, dynamic> _$CardDetailsNetworkModelToJson(
        CardDetailsNetworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'title': instance.title,
      'formatted_title': instance.formattedTitle,
      'description': instance.description,
      'formatted_description': instance.formattedDescription,
      'icon': instance.icon,
      'bg_image': instance.bgImage,
      'bg_color': instance.bgColor,
      'bg_gradient': instance.bgGradient,
      'url': instance.url,
      'icon_size': instance.iconSize,
      'is_disabled': instance.isDisabled,
      'cta': instance.cta,
      'is_shareable': instance.isShareable,
      'is_internal': instance.isInternal,
    };

FormattedTextNetworkModel _$FormattedTextNetworkModelFromJson(
        Map<String, dynamic> json) =>
    FormattedTextNetworkModel(
      text: json['text'] as String,
      align: json['align'] as String,
      entities: (json['entities'] as List<dynamic>)
          .map((e) => EntityNetworkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FormattedTextNetworkModelToJson(
        FormattedTextNetworkModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'align': instance.align,
      'entities': instance.entities,
    };

EntityNetworkModel _$EntityNetworkModelFromJson(Map<String, dynamic> json) =>
    EntityNetworkModel(
      text: json['text'] as String?,
      color: json['color'] as String?,
      url: json['url'] as String?,
      fontStyle: json['font_style'] as String?,
      fontFamily: json['font_family'] as String?,
      fontSize: (json['font_size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EntityNetworkModelToJson(EntityNetworkModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'color': instance.color,
      'url': instance.url,
      'font_style': instance.fontStyle,
      'font_family': instance.fontFamily,
      'font_size': instance.fontSize,
    };

CardImageNetworkModel _$CardImageNetworkModelFromJson(
        Map<String, dynamic> json) =>
    CardImageNetworkModel(
      imageType: json['image_type'] as String?,
      assetType: json['asset_type'] as String?,
      imageUrl: json['image_url'] as String?,
      aspectRatio: (json['aspect_ratio'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CardImageNetworkModelToJson(
        CardImageNetworkModel instance) =>
    <String, dynamic>{
      'image_type': instance.imageType,
      'asset_type': instance.assetType,
      'image_url': instance.imageUrl,
      'aspect_ratio': instance.aspectRatio,
    };

BgGradientNetworkModel _$BgGradientNetworkModelFromJson(
        Map<String, dynamic> json) =>
    BgGradientNetworkModel(
      angle: (json['angle'] as num?)?.toInt(),
      colors:
          (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BgGradientNetworkModelToJson(
        BgGradientNetworkModel instance) =>
    <String, dynamic>{
      'angle': instance.angle,
      'colors': instance.colors,
    };

CTANetworkModel _$CTANetworkModelFromJson(Map<String, dynamic> json) =>
    CTANetworkModel(
      text: json['text'] as String?,
      type: json['type'] as String?,
      bgColor: json['bg_color'] as String?,
      textColor: json['text_color'] as String?,
      isCircular: json['is_circular'] as bool?,
      isSecondary: json['is_secondary'] as bool?,
      strokeWidth: (json['stroke_width'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CTANetworkModelToJson(CTANetworkModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'type': instance.type,
      'bg_color': instance.bgColor,
      'text_color': instance.textColor,
      'is_circular': instance.isCircular,
      'is_secondary': instance.isSecondary,
      'stroke_width': instance.strokeWidth,
      'url': instance.url,
    };
