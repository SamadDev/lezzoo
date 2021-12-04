import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lezzoo_assignment/components/Theme.dart';
import 'package:lezzoo_assignment/servers/product_server.dart';
import 'package:provider/provider.dart';



class BasketCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.subtitle1;
    final product=Provider.of<ProductServer>(context,listen:false);
    return Scaffold(
      appBar: AppBar(
        title:const Text('سەبەتە'),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ProductServer>(builder: (ctx,data,_)=>ListView.builder(
              itemCount: product.addProduct.length,
              itemBuilder: (ctx, i) => Card(
                margin:const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                color: AppTheme.accentColor,
                elevation: 0.5,

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        product.setCard('delete',product.addProduct[i]);
                      },
                      child:const Icon(
                        Icons.highlight_remove_outlined,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding:const EdgeInsets.symmetric(vertical: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              product.addProduct[i].name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('نرخ: 25000 IQR', style: textStyle),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 110,
                      width: 100,
                      color: AppTheme.grey700.withOpacity(0.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl:product.addProduct[i].imgUrl,
                          fit: BoxFit.cover,
                          placeholder: (ctx, snap) =>
                              Image.asset('assets/images/loading.gif'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Column(
                        children: const [
                           CircleAvatar(
                              radius: 12,
                              backgroundColor: AppTheme.primaryColor,
                              child: Icon(
                                Icons.add,
                                color: AppTheme.white,
                              )),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text("1"),
                          ),
                          CircleAvatar(
                              radius: 12,
                              backgroundColor: AppTheme.primaryColor,
                              child: Icon(
                                Icons.remove,
                                color: AppTheme.white,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),),
          ),
          Container(
            padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: AppTheme.accentColor,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'نرخی گشتی :',
                      style: textStyle,
                    ),
                    Spacer(),
                    Text(
                      '25000 IQR',
                      style: textStyle,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'خاڵی وەرگیراو :',
                      style: textStyle,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Spacer(),
                    Text(
                      '12 خاڵ',
                      style: textStyle,
                    )
                  ],
                ),
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                  margin:const EdgeInsets.only(top: 30, bottom: 10),
                  decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    'داواکردن',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppTheme.white),
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
