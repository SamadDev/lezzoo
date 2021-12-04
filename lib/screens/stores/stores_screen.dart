import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lezzoo_assignment/components/row_text.dart';
import 'package:lezzoo_assignment/screens/category/category_screen.dart';
import 'package:lezzoo_assignment/servers/store_server.dart';
import 'package:provider/provider.dart';

class StoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<StoreServer>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.7,
        title: Text('دوکانەکان'),
      ),
      body: FutureBuilder(
          future: store.getStores(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? CircularProgressIndicator()
              : SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: store.storeList
                        .map<Widget>((e) => Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CategoryScreen(storeId: e.id,name_store:e.name,)));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: e.imgUrl,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 150,
                                        placeholder: (ctx, snap) =>
                                            Image.asset(
                                                'assets/images/loading.gif'),
                                      ),
                                    ),
                                    RowText(
                                      text1: 'دوکانی: ',
                                      text2: e.name,
                                      icon: Icons.store,
                                    ),
                                    RowText(
                                      text1: 'جۆری دوکان: ',
                                      text2: e.storeType,
                                      icon: Icons.merge_type,
                                    ),
                                    RowText(
                                      text1: 'ناونێشان: ',
                                      text2: e.location,
                                      icon: Icons.add_location,
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                )),
    );
  }
}
