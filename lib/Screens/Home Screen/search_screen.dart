import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneaker_cart/Application/Home/home_bloc.dart';

import '../../Constants/colors.dart';
import '../../Constants/text.dart';
import '../../Services/database.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,),),
        backgroundColor: greyColor,
        title: Text('Search', style: normalBlackText,),
        centerTitle: true,
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // height20,
              const SearchBar(),
              BlocBuilder<HomeBloc,HomeState>(
                builder: (context,state) {
                  if (state.searchResult == null) {
                    return const Center(child: Text(''),);
                  }
      
                  if (state.searchResult!.docs.isEmpty) {
                   return const Center(child: Text('No Search Result'),) ;
                  }
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 0,
                          crossAxisCount: 2,
                          childAspectRatio: .9),
                      itemBuilder: (context, index) {
                        final data =
                            state.searchResult!.docs[index].data() as Map<String, dynamic>;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(
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
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.circular(25),
                                      //       color: whiteColor),
                                      //   child: IconButton(
                                      //       onPressed: () {
                                      //         DatabaseServic()
                                      //             .addToFav(
                                      //                 prodctName: data['product_name'],
                                      //                 img: data['image'],
                                      //                 price: data['price'],
                                      //                 context: context)
                                      //             .then((value) {
                                      //                 // BlocProvider.of<ProductDetailsBloc>(
                                      //                 //         context)
                                      //                 //     .add(const FavProduct())
                                      //       });
                                      //       },
                                      //       icon: const Icon(
                                      //         Icons.favorite_border_rounded,
                                      //         color: Colors.red,
                                      //       )),
                                      // ),
                                      Flexible(
                                        child: Center(
                                          child: Image.network(
                                            data['image'][0],
                                          ),
                                        ),
                                      ),
                                      Text(
                                        data['product_name'],
                                        style: mediumText,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        '₹${data['actualPrice']}',
                                        style: normalText,
                                      ),
                                      height10,
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: state.searchResult!.docs.length,
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){
        BlocProvider.of<HomeBloc>(context).add(searchResult(searchKey: value),);
      },
      decoration: InputDecoration(
        fillColor: whiteColor,
        filled: true,
        prefixIcon: Icon(
          Iconsax.search_normal,
          color: Colors.grey.shade600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        hintText: 'Looking for shoes',
        hintStyle: smallGreyText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: whiteColor),
        ),
      ),
    );
  }
}