import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Services/database.dart';
import 'package:sneaker_cart/Widgets/appbar.dart';
import '../../Application/ProductDetails/product_details_bloc.dart';
import 'Widgets/image_gallery_widget.dart';
import 'Widgets/image_view_widget.dart';
import 'Widgets/price_button_widget.dart';
import 'Widgets/sizechart_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.category});

  String category;
  int sizeChartlength = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(
          context: context,
          trailingIcon: Iconsax.bag_24,
          title: "$category Shoes"),
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          final result = state.productdetails;
          if (result == null) {
            return Center(
              child: Lottie.asset('assets/images/loading.json',
                  width: 100, fit: BoxFit.fill),
            );
          }
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
                      builder: (context, state) {
                    return ImageView(
                      img: state.img!,
                    );
                  }),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width - 100,
                              child: Text(
                                result['product_name'],
                                style: ProductTitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                DatabaseServic()
                                    .addToFav(
                                        context: context,
                                        prodctName: result['product_name'],
                                        img: result['image'][0],
                                        price: result['actualPrice'],
                                        category: result['category'])
                                    .then(
                                      (value) =>
                                          BlocProvider.of<ProductDetailsBloc>(
                                                  context)
                                              .add(
                                        IsFav(
                                          prodctName: result['product_name'],
                                        ),
                                      ),
                                    );
                              },
                              icon: Icon(
                                Iconsax.heart,
                                color: state.isFavorited
                                    ? Colors.black
                                    : Colors.red,
                              ),
                              splashRadius: 25,
                            )
                          ],
                        ),
                        height10,
                        Text('₹${result['actualPrice']}', style: mediumText),
                        height10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            BlocBuilder<ProductDetailsBloc,
                                ProductDetailsState>(builder: (context, state) {
                              // showMoreDiscription = state.showMoreButton!;
                              // print(sizeChart);
                              return Text(
                                result['description'], 
                                style: smallGreyText,
                                maxLines: state.showMoreButton! ? 7 : 2,
                                overflow: state.showMoreButton!
                                    ? TextOverflow.visible
                                    : TextOverflow.ellipsis,
                              );
                            }),
                            TextButton(
                              onPressed: () {
                                BlocProvider.of<ProductDetailsBloc>(context)
                                    .add(
                                  ShowMoreButton(
                                      showMore: !state.showMoreButton!),
                                );
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              child: Text(state.showMoreButton!
                                  ? 'Show Less'
                                  : 'Show More'),
                            )
                          ],
                        ),
                        height20,
                        Text(
                          'Gallery',
                          style: mediumText,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  BlocProvider.of<ProductDetailsBloc>(context)
                                      .add(ChangeImage(
                                          index: 0,
                                          productname: result['product_name'])),
                              child: GalleryImage(
                                img: result['image'][0],
                              ),
                            ),
                            GestureDetector(
                                onTap: () =>
                                    BlocProvider.of<ProductDetailsBloc>(context)
                                        .add(ChangeImage(
                                            index: 1,
                                            productname:
                                                result['product_name'])),
                                child: GalleryImage(img: result['image'][1])),
                            GestureDetector(
                                onTap: () =>
                                    BlocProvider.of<ProductDetailsBloc>(context)
                                        .add(
                                      ChangeImage(
                                          index: 2,
                                          productname: result['product_name']),
                                    ),
                                child: GalleryImage(img: result['image'][2])),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Size Chart',
                              style: mediumText,
                            ),
                            Text(
                              'UK',
                              style: mediumText,
                            ),
                          ],
                        ),
                        height10,
                        Wrap(
                          children: List.generate(
                            6,
                            (index) => BlocBuilder<ProductDetailsBloc,
                                ProductDetailsState>(builder: (context, state) {
                              if (state.index == null) {
                                return SizeChartWidget(
                                    selectedIndex: -1, index: index);
                              }
                              return SizeChartWidget(
                                selectedIndex: state.index!,
                                index: index,
                              );
                            }),
                          ),
                        ),
                        height10,
                        PriceAndButton(
                          price: result['actualPrice'],
                          productName: result['product_name'],
                          image: result['image'][0],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
