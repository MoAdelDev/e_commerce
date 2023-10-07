import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/style/colors.dart';
import '../../../../../core/style/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).contactsTitle,
        ),
      ),
      body: SingleChildScrollView(
        physics: DefaultScrollPhysics.defaultPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  _launchUrl(
                      url: Uri.parse(
                          'https://www.linkedin.com/in/mohammedadel10/'));
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
                        child: SvgPicture.asset('assets/images/linkedin.svg'),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Linkedin',
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
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(url: Uri.parse('https://github.com/MoAdelDev'));
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
                        child: SvgPicture.asset('assets/images/github.svg'),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Github',
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
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () {
                  _launchUrl(url: Uri.parse('http://wa.me/201064902663'));
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
                        child: SvgPicture.asset('assets/images/whatsapp.svg'),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Whats App',
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
              ),
            ],
          ),
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
