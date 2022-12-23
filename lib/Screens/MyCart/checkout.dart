import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Screens/MyCart/methods/appbar.dart';
import 'package:sneaker_cart/Widgets/payment_container.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCartAppBar(title: 'Checkout', context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: whiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(
                        'Contact Information',
                        style: mediumText,
                      ),
                      ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: greyColor),
                          child: const Icon(
                            Icons.email_outlined,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              initialValue: 'abhinand@gmail.com',
                            ),
                            Text('Email'),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {}, icon: Icon(Icons.edit)),
                      ),
                      ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: greyColor),
                          child: Icon(
                            Icons.phone,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              initialValue: '8156888469',
                            ),
                            const Text('Phone'),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {}, icon: Icon(Icons.edit)),
                      ),
                      height10,
                      ExpandablePanel(
                        header: Text(
                        'Address',
                        style: mediumText,
                      ),
                        collapsed: 
                        Text(
                          'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
                          style: normalText,
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
                              style: normalText,
                              softWrap: true,
                            ),
                            ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: mainColor), child: const Text('Edit'),),
                          ],
                        ),
                      ),
                      height20
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: const PaymentContainer(),
    );
  }
}
