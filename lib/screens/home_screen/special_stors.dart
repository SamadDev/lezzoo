import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lezzoo_assignment/components/Theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:lezzoo_assignment/servers/store_server.dart';

class SpecialStore extends StatelessWidget {
  Widget build(BuildContext context) {
    final store = Provider.of<StoreServer>(context, listen: false);
    final currentIndex = Provider.of<StoreServer>(context);
    return FutureBuilder(
        future: store.getSpecialStores(),
        builder: (ctx, snap) => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  store.getCurrentIndex(index);
                },
              ),
              items: store.specialStoreList
                  .map(
                    (e) => ClipRRect(
                     borderRadius: BorderRadius.circular(3),
                      child: CachedNetworkImage(
                        imageUrl: e.imgUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 150,
                        placeholder: (ctx, snap) =>
                            Image.asset("assets/images/loading.gif"),
                      ),
                    ),
              )
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: store.specialStoreList.map((image) {
                int index = store.specialStoreList.indexOf(image);
                return Container(
                  height: currentIndex.currentIndex == index ? 15 : 12,
                  width: currentIndex.currentIndex == index ? 15 : 12,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex.currentIndex == index
                        ? AppTheme.primaryColor
                        : AppTheme.white2,
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}


