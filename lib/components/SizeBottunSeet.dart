import 'package:flutter/material.dart';
import 'package:lezzoo_assignment/components/Theme.dart';

void sizeBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 280,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          color: AppTheme.white,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'کراسی کوران',
                    style: textTheme(context).subtitle1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'نرخ: 25000 IQR',
                    style: textTheme(context).subtitle1,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'سایزی بەردەست:',
                    style: textTheme(context).subtitle1,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (ctx, i) => Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppTheme.black)),
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              child: Center(
                                  child: Text(
                                'XL',
                                style: textTheme(context).subtitle1,
                              )),
                              height: 20,
                              width: 35,
                            )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppTheme.primaryColor.withOpacity(1)),
                    child: GestureDetector(
                      onTap: () {
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'زیادکردن بۆ سەبەتە',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: AppTheme.white.withOpacity(0.9)),
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
              Align(
                alignment: Alignment.topLeft,
                child: CloseButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: AppTheme.black,
                ),
              )
            ],
          ),
        );
      });
}
