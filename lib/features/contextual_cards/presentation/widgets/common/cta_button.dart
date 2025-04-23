import 'package:fam_assignment/core/utils/url_launcher.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/contextual_card_presentation_model.dart';
import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  final CTAModel cta;

  const CTAButton({
    super.key,
    required this.cta,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await UrlLauncher.launch(cta.url);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(int.parse(cta.bgColor.replaceAll('#', '0xFF'))),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: cta.isSecondary
              ? BorderSide(
                  color: Color(int.parse(cta.bgColor.replaceAll('#', '0xFF'))),
                  width: 1,
                )
              : BorderSide.none,
        ),
      ),
      child: Text(
        cta.text,
        style: TextStyle(
          color: Color(int.parse(cta.textColor.replaceAll('#', '0xFF'))),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
