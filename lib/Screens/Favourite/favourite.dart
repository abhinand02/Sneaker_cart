import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/Home%20Screen/product_details.dart';
import 'package:sneaker_cart/Services/database.dart';
import 'package:sneaker_cart/Widgets/appbar.dart';
import '../../Application/ProductDetails/product_details_bloc.dart';
import '../../Widgets/bottom_nav_bar.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductDetailsBloc>(context).add(const FavProduct());
    });
    return Scaffold(
      appBar: appBar(trailingIcon: Iconsax.heart, title: 'Favourite'),
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state.favProducts == null) {
            return  Center(
              child: Lottie.asset('assets/images/loading.json',width: 100,fit: BoxFit.fill),
            );
          }

          if (state.favProducts!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  "You don't have any favourite product",
                  style: normalText,
                )),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const BottomNavBar(),
                        ),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                  child: Text(
                    'Add Products',
                    style: smallText,
                  ),
                ),
              ],
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 4,
                crossAxisSpacing: 0,
                crossAxisCount: 2,
                childAspectRatio: .9),
            itemBuilder: (context, index) {
              final data =
                  state.favProducts![index].data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<ProductDetailsBloc>(context)
                              .add(IsFav(
                            prodctName: data['product_name'],
                          ));
                          BlocProvider.of<ProductDetailsBloc>(context).add(
                              ChangeImage(
                                  index: 0, productname: data['product_name']));
                          BlocProvider.of<ProductDetailsBloc>(context).add(
                              GetProductDetail(
                                  productname: data['product_name']));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                  category: data['category'])));
                        },
                        child: Container(
                          width: double.infinity / 2,
                          padding: const EdgeInsets.only(left: 12, top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: greyColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: whiteColor),
                                child: IconButton(
                                    onPressed: () {
                                      DatabaseServic()
                                          .addToFav(
                                              prodctName: data['product_name'],
                                              img: data['image'],
                                              price: data['price'],
                                              category: data['category'],
                                              context: context)
                                          .then((value) => BlocProvider.of<
                                                  ProductDetailsBloc>(context)
                                              .add(const FavProduct()));
                                    },
                                    icon: const Icon(
                                      Iconsax.heart,
                                      color: Colors.red,
                                    )),
                              ),
                              Flexible(
                                child: Center(
                                  child: Image.network(
                                    data['image'],
                                  ),
                                ),
                              ),
                              Text(
                                data['product_name'],
                                style: mediumText,
                              ),
                              Text(
                                '₹${data['price']}',
                                style: normalText,
                              ),
                              height10,
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: state.favProducts!.length,
          );
        },
      ),
    );
  }
}
