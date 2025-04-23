import 'package:flutter/material.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';
import 'package:url_launcher/url_launcher.dart';

class CTAButton extends StatelessWidget {
  final CTAModel cta;

  const CTAButton({
    super.key,
    required this.cta,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = cta.bgColor != null ? Color(int.parse(cta.bgColor!.replaceAll('#', '0xFF'))) : Colors.blue;
    final textColor = _getTextColor(bgColor);

    return ElevatedButton(
      onPressed: () async {
        if (cta.url != null) {
          final Uri uri = Uri.parse(cta.url!);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cta.isCircular == true ? 20 : 8),
          side: cta.isSecondary == true
              ? BorderSide(
                  color: bgColor,
                  width: cta.strokeWidth?.toDouble() ?? 1,
                )
              : BorderSide.none,
        ),
      ),
      child: Text(cta.text ?? ''),
    );
  }

  Color _getTextColor(Color bgColor) {
    // Calculate the relative luminance of the background color
    final luminance = bgColor.computeLuminance();
    // If the background is dark (luminance < 0.5), use white text, otherwise use black
    return luminance < 0.5 ? Colors.white : Colors.black;
  }
} 