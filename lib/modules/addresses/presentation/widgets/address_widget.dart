import 'package:e_commerce_app/modules/addresses/domain/entities/address.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';

class AddressWidget extends StatelessWidget {
  final Address address;
  const AddressWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            address.name,
            style:
            Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 1.0,
          ),
          Text(
            address.details,
            style:
            Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 1.0,
          ),
          Text(
            address.city,
            style:
            Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 1.0,
          ),
          Text(
            address.region,
            style:
            Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 7.0,
          ),
          Row(
            children: [
              Text(
                MyApp.user?.phone ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall,
              ),
              const Spacer(),
              InkWell(
                onTap: (){},
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context)
                      .colorScheme
                      .primary,
                ),
              ),
              const SizedBox(width: 20.0,),
              InkWell(
                onTap: (){},
                child: Icon(
                  Icons.edit,
                  color: Theme.of(context)
                      .colorScheme
                      .primary,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
