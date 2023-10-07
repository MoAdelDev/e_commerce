import 'package:e_commerce_app/core/style/components/default_scroll_physics.dart';
import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/modules/home/presentation/widgets/contacts/contact_widget.dart';
import 'package:flutter/material.dart';
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
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              ContactWidget(
                  imageName: 'linkedin.svg',
                  title: 'Linkedin',
                  url: 'https://www.linkedin.com/in/mohammedadel10/'),
              SizedBox(
                height: 20.0,
              ),
              ContactWidget(
                  imageName: 'github.svg',
                  title: 'Github',
                  url: 'https://github.com/MoAdelDev'),
              SizedBox(
                height: 20.0,
              ),
              ContactWidget(
                imageName: 'whatsapp.svg',
                title: 'Whats App',
                url: 'http://wa.me/201064902663',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
