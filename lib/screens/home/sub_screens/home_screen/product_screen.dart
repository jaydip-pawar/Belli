import 'package:belli/screens/home/widgets/products/hotel_details_appbar.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            HotelDetailsAppBar(),
          ];
        },
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Text("Hey")
            // VendorBanner(),
            // VendorCategories(),
            // RecentlyAddedProduct(),
            // FeaturedProducts(),
            // BestSellingProduct(),
          ],
        )
      ),
    );
  }
}
