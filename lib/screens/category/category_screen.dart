import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lezzoo_assignment/modules/category_module.dart';
import 'package:lezzoo_assignment/screens/products/product_screen.dart';
import 'package:provider/provider.dart';
import 'package:lezzoo_assignment/components/Theme.dart';
import 'package:lezzoo_assignment/servers/category_server.dart';

class CategoryScreen extends StatelessWidget {
  final storeId;
  final name_store;

  CategoryScreen({this.storeId, this.name_store});

  Widget build(BuildContext context) {
    final category = Provider.of<CategoryServer>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(name_store,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline6),
      ),
      body: FutureBuilder(
        future: category.getCategory(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (ctx, i) =>
                        CategoryWidget(data: category.findCategory(storeId)[i]),
                    itemCount: category.findCategory(storeId).length,
                  ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final CategoryModule data;

  CategoryWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: AppTheme.white,
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => ProductScreen(
                    category_id: data.id,
                    category_name: data.name,
                  )));
        },
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        leading: Container(
          decoration: BoxDecoration(
              color: AppTheme.white2, borderRadius: BorderRadius.circular(15)),
          child: CachedNetworkImage(
            imageUrl:
                'https://firebasestorage.googleapis.com/v0/b/social-school-86116.appspot.com/o/bagr.png?alt=media&token=570b72ad-8620-4079-8604-3917c477b355',
            width: 70,
            height: 70,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          data.name,
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppTheme.primaryColor,
        ),
      ),
    );
  }
}
