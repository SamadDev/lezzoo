import 'package:flutter/material.dart';

import 'package:lezzoo_assignment/components/Theme.dart';
import 'package:lezzoo_assignment/components/backet_screen.dart';
import 'package:lezzoo_assignment/servers/product_server.dart';
import 'package:provider/provider.dart';

class BadgeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 45,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>BasketCart()));
            },
            child:const Icon(
              Icons.shopping_cart,
              size: 35,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        Positioned(
          top: 3,
          right: 20,
          child: Container(
            height: 17,
            width: 17,
            decoration: BoxDecoration(
                color: AppTheme.white, borderRadius: BorderRadius.circular(60)),
            child: Center(
                child: Consumer<ProductServer>(builder: (ctx,data,_)=>Text(
                  data.addProduct.length.toString(),
                  style: Theme.of(context).textTheme.subtitle2,
                ),)),
          ),
        )
      ],
    );
  }
}
