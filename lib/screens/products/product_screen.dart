import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lezzoo_assignment/components/backet_icon.dart';
import 'package:lezzoo_assignment/modules/product_module.dart';
import 'package:lezzoo_assignment/servers/product_server.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lezzoo_assignment/components/Theme.dart';

class ProductScreen extends StatelessWidget {
  final category_id;
  final category_name;

  ProductScreen({this.category_id, this.category_name});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductServer>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(category_name),
        actions: [BadgeButton()],
      ),
      body: FutureBuilder(
        future: product.getProducts(),
        builder: (ctx, snap) => GridView.builder(
          itemCount: product.findProduct(category_id).length,
          itemBuilder: (ctx, i) => ProductCart(
            data: product.findProduct(category_id)[i],
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.6,
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2),
        ),
      ),
    );
  }
}

class ProductCart extends StatelessWidget {
  final ProductsModule data;

  ProductCart({required this.data});

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: 170,
      decoration: BoxDecoration(
          border: Border.all(color: colorTheme(context).dividerColor),
          color: AppTheme.accentColor,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5)),
              child: CachedNetworkImage(
                imageUrl: data.imgUrl,
                fit: BoxFit.contain,
                placeholder: (ctx, snap) =>
                    Image.asset('assets/images/loading.gif'),
              ),
            ),
            height: 180,
            width: 170,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "18,000",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(
                              color: AppTheme.black.withOpacity(0.5),
                              decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '10,000 د.ع',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: AppTheme.primaryColor),
                    ),
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppTheme.primaryColor.withOpacity(1)),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<ProductServer>(context,listen:false).setCard('add', data);
                    },
                    child: Row(
                      children: [
                        Text(
                          'زیادکردن بۆ سەبەتە',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color:
                                      AppTheme.white.withOpacity(0.9)),
                        ),
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: AppTheme.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
