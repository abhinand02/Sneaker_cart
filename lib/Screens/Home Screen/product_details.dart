import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/MyCart/mycart.dart';
import 'package:sneaker_cart/Services/database.dart';
import 'package:sneaker_cart/Widgets/appbar.dart';
import '../../Application/Cart/cart_bloc.dart';
import '../../Application/ProductDetails/product_details_bloc.dart';
import '../../Constants/colors.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.category});
  
  String category;
 
  @override
  Widget build(BuildContext context) {
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
                            Text(
                              result['product_name'],
                              style: bigText,
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
                                    .add(ShowMoreButton(
                                        showMore: !state.showMoreButton!),);
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
                                            productname:
                                                result['product_name'])),
                                child: GalleryImage(
                                  img: result['image'][0],
                                )),
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
                                        .add(ChangeImage(
                                            index: 2,
                                            productname:
                                                result['product_name'])),
                                child: GalleryImage(img: result['image'][2])),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Size',
                              style: mediumText,
                            ),
                            Text(
                              'UK',
                              style: mediumText,
                            ),
                          ],
                        ),
                        height10,
                        Row(
                          children: const [
                            CircleAvatar(
                              child: Text('7'),
                            ),
                          ],
                        ),
                        height10,
                        PriceAndButton(
                          price: result['actualPrice'],
                          productName: result['product_name'],
                          size: '7',
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

class PriceAndButton extends StatelessWidget {
  final String price;
  final String productName, image, size;
  const PriceAndButton({
    Key? key,
    required this.price,
    required this.productName,
    required this.image,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Spacer(),
      Column(
        children: [
          Text(
            'Price',
            style: smallGreyText,
          ),
          Text(
            '₹$price',
            style: mediumText,
          ),
        ],
      ),
      const Spacer(
        flex: 5,
      ),
      ElevatedButton(
        onPressed: () {
          DatabaseServic()
              .addToCart(
                  productName: productName,
                  image: image,
                  size: '8',
                  totalPrice: price,
                  quantity: '1')
              .then((value) {
            BlocProvider.of<CartBloc>(context).add(const CartProduct());
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyCartScreen(
                  context1: context,
                ),
              ),
            );
          });
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          'Add To Cart',
          style: mediumText,
        ),
      ),
      const Spacer(),
    ]);
  }
}

class ImageView extends StatelessWidget {
  final String img;
  const ImageView({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: const Color.fromARGB(12, 0, 0, 0),
      child:
          Image.network(img, loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child:
              //  Lottie.asset('assets/images/simple-lazy-load.json'),
              CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      }, errorBuilder: (context, error, stackTrace) {
        return const Text('failed to load resource');
      }),
    );
  }
}

class GalleryImage extends StatelessWidget {
  final String img;
  const GalleryImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(12, 0, 0, 0),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Image.network(img, errorBuilder: (context, error, stackTrace) {
        return const Text('failed to load resource');
      }),
    );
  }
}
