import 'package:flutter/material.dart';
import 'package:sneaker_cart/Screens/MyCart/mycart.dart';
import '../Constants/colors.dart';
import '../Constants/text.dart';

class PaymentContainer extends StatelessWidget {
  final Widget? constructor;
  const PaymentContainer({Key? key, this.constructor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: height * .3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const PriceTextWidget(
            title: 'Subtotal',
            price: '₹1250',
          ),
          const PriceTextWidget(
            title: 'Shipping',
            price: '₹40',
          ),
          const Divider(
            thickness: 2,
          ),
          const PriceTextWidget(
            title: 'Total Cost',
            price: '₹1290',
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    constructor != null
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => constructor!))
                        : showDialog(
                            context: context,
                            builder: ((context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  content: SizedBox(
                                    height: height * .35,
                                    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 20,),
                                          height: 130,
                                          decoration: BoxDecoration(
                                              color: greyColor,
                                              shape: BoxShape.circle),
                                          child: Image.asset(
                                              'assets/images/image 50.png'),
                                        ),
                                        Text(
                                          'Your Payment Is \nSuccessful',
                                          style: mediumText,
                                          textAlign: TextAlign.center,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: mainColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  padding: const EdgeInsets.all(20)),
                                              child:  Text(
                                                  'Back To Shopping',style: normalText,),
                                            )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Checkout',
                    style: mediumText,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
