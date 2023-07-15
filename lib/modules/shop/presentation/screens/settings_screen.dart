import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/components/default_material_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: DefaultButton(onPressed: (){
          CacheHelper.saveData(key: 'token', value: '');
          Navigator.pushNamedAndRemoveUntil(context, loginScreen, (route) => false);
        }, text: 'Log out'),
      ),
    );
  }
}
