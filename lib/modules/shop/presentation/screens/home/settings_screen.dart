import 'package:e_commerce_app/core/style/colors.dart';
import 'package:e_commerce_app/core/style/components/default_material_button.dart';
import 'package:e_commerce_app/core/style/fonts.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/modules/shop/presentation/widgets/settings_widget.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: AppColorLight.primaryColor,
                  child: const Icon(
                    Icons.person,
                    size: 35.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      MyApp.user.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontFamily: AppFonts.boldFont),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      MyApp.user.email,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            DefaultButton(
              onPressed: () {},
              text: 'Edit profile',
              icon: Icons.edit,
            ),
            const SizedBox(height: 20.0,),
            Column(
              children: [
                SettingsItemWidget(onPressed: (){}, icon: Icons.location_history, text: 'My addresses'),
                SettingsItemWidget(onPressed: (){}, icon: Icons.notifications, text: 'Notifications'),
                SettingsItemWidget(onPressed: (){}, icon: Icons.article, text: 'Terms of service'),
                SettingsItemWidget(onPressed: (){}, icon: Icons.contacts, text: 'Contacts'),
                SettingsItemWidget(onPressed: (){}, icon: Icons.language, text: 'Language'),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
