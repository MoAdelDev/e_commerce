import 'package:e_commerce_app/core/style/colors.dart';
import 'package:e_commerce_app/core/style/fonts.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidget extends StatelessWidget {
  final String imageName;
  final String title;
  final String url;

  const ContactWidget({
    super.key,
    required this.imageName,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _launchUrl(url: Uri.parse(url));
      },
      child: SizedBox(
        height: 50.0,
        child: Row(
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: AppColorLight.primaryColor.shade100,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: SvgPicture.asset('assets/images/$imageName'),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontFamily: AppFonts.boldFont,
                  ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.onBackground,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl({required url}) async {
    try {
      if (!await launchUrl(url)) {
        showToast(
            msg: 'Could not launch url', requestState: RequestState.error);
      }
    } catch (e) {
      showToast(msg: e.toString(), requestState: RequestState.error);
    }
  }
}
