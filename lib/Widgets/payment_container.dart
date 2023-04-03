import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sneaker_cart/Application/Checkout/checkout_bloc.dart';
import 'package:sneaker_cart/Screens/Orders/order_details.dart';
import 'package:sneaker_cart/Services/auth.dart';
import 'package:sneaker_cart/Services/database.dart';
import '../Application/Cart/cart_bloc.dart';
import '../Constants/colors.dart';
import '../Constants/text.dart';
import '../Screens/MyCart/payment_successful.dart';
import 'package:http/http.dart' as http;
import '../Screens/MyCart/widgets/pricetext_widget.dart';

class PaymentContainer extends StatefulWidget {
  final Widget? constructor;
  final String address;
  const PaymentContainer({
    Key? key,
    this.constructor,
    required this.address,
  }) : super(key: key);

  @override
  State<PaymentContainer> createState() => _PaymentContainerState();
}

class _PaymentContainerState extends State<PaymentContainer> {
  final Razorpay _razorpay = Razorpay();
  String mtoken = '';
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    requestPermission();
    getToken();
  }

  initInfo() {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSnitialize = const IOSInitializationSettings();
    var initializationSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSnitialize);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) async {
        try {
          if (payload != null && payload.isNotEmpty) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const OrderDetials(index: 0,);
                },
              ),
            );
          }
        } catch (e) {}
        return;
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // print('onmessage');
      // print(
          // 'onmessage: ${message.notification?.title}/${message.notification?.body}');

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
          message.notification!.body.toString(),
          htmlFormatBigText: true,
          contentTitle: message.notification!.title.toString(),
          htmlFormatContentTitle: true);

      AndroidNotificationDetails androidPlatformChennelSpecifics =
          AndroidNotificationDetails('sneakercart', 'sneakercart', '',
              importance: Importance.high,
              styleInformation: bigTextStyleInformation,
              priority: Priority.high,
              playSound: true);

      NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChennelSpecifics,
      );
      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, platformChannelSpecifics,
          payload: message.data['body']);
    });
  }

  void getToken() async {
    AuthService service = AuthService();
    await service.messaging.getToken().then((token) {
      setState(() {
        mtoken = token!;
        // print('my token is $mtoken');
      });
    });
  }

  void requestPermission() async {
    AuthService service = AuthService();

    NotificationSettings settings = await service.messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // print('user granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      // print('user granted provosional permission');
    } else {
      // print('user declined or has not accepted permission');
    }
  }

  void sendPushMessage(String body, String title) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAArevQLPA:APA91bEiet_uj3QCIDH10NKSNh_qNmAGqtIp_kVPbypzWqEqGblDO4AGjL8z7kxzdVN-Drl4nswiqqjqsNiDFW7RBHqgBqJw8ttNPz85knoUVL6qZyC2D-gWoCZw7FAEmO4p0l724Tjd'
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': body,
              'title': title,
            },
            'notification': <String, dynamic>{
              "title": title,
              'body': body,
              'image':
                  'https://firebasestorage.googleapis.com/v0/b/sneaker-cart.appspot.com/o/Adidas%2FForum%2084%20%2F2022-12-21%2012%3A08%3A56.541613?alt=media&token=ed36ab01-a260-4ae9-a5f3-1e87f0366de7',
              'android_channel_id': 'sneakercart'
            },
            'to': mtoken,
          },
        ),
      );
    } catch (e) {
      // print(e);
    }
  }

  Future<Future<Object?>> _handlePaymentSuccess(
      PaymentSuccessResponse response) async {
    // Do something when payment succeeds
    // BlocProvider.of<CheckoutBloc>(context).add(const Loading(isLoading: false),);
    // print('payment successful');
    initInfo();
    sendPushMessage('Your Order Completed', 'Order Completed');
    return await DatabaseServic().addOrderDetails(address: widget.address).then(
        (value) => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const PaymentSuccessful())));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    BlocProvider.of<CheckoutBloc>(context).add(
      const Loading(isLoading: false),
    );

    // print('payment failed');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<CartBloc>(context).add(const SubTotal());
    });
    double height = MediaQuery.of(context).size.height;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: height * .3,
        child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          final total = int.parse(state.subtotal) + 40;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PriceTextWidget(
                title: 'Subtotal',
                price: '₹${state.subtotal}',
              ),
              const PriceTextWidget(
                title: 'Shipping',
                price: '₹40',
              ),
              const Divider(
                thickness: 2,
              ),
              PriceTextWidget(
                title: 'Total Cost',
                price: "₹$total".toString(),
              ),
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<CheckoutBloc, CheckoutState>(
                        builder: (context, state) {
                      final address = state.selectedAddress;
                      // print(address['number']);
                      return ElevatedButton(
                        onPressed: () {
                          var options;
                          if (state.addressList == null ||
                              state.addressList!.docs.isEmpty) {
                            if (widget.constructor != null) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => widget.constructor!));
                            }
                          } else {
                            BlocProvider.of<CheckoutBloc>(context).add(
                              Loading(
                                  isLoading: widget.constructor != null
                                      ? false
                                      : true),
                            );
                            options = {
                              'key': 'rzp_test_ars40jMvKPCzqT',
                              'amount': total *
                                  100, //in the smallest currency sub-unit.
                              'name': address['name'],
                              // 'order_id':
                              //     'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                              'description': 'Shoes',
                              'timeout': 200, // in seconds
                              'prefill': {
                                'contact': address['number'],
                                'email': state.userEmail
                              }
                            };
                            widget.constructor != null
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => widget.constructor!))
                                : _razorpay.open(options);
                          }
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
                      );
                    }),
                  ),
                ],
              ),
            ],
          );
        }));
  }

  // @override
//   void dispose() {
//     // TODO: implement dispose
//     _razorpay.clear();
//     super.dispose();
//   }
}

// paymentSucessful(context) {
//   double height = MediaQuery.of(context).size.height;
//   showDialog(
//       context: context,
//       builder: ((context) => AlertDialog(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//             content: SizedBox(
//               height: height * .35,
//               // decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(
//                       top: 20,
//                     ),
//                     height: 130,
//                     decoration:
//                         BoxDecoration(color: greyColor, shape: BoxShape.circle),
//                     child: Image.asset('assets/images/image 50.png'),
//                   ),
//                   Text(
//                     'Your Payment Is \nSuccessful',
//                     style: mediumText,
//                     textAlign: TextAlign.center,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                           child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context).pushAndRemoveUntil(
//                               MaterialPageRoute(
//                                   builder: (BuildContext context) {
//                             return BottomNavBar();
//                           }), (route) => false);
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: mainColor,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(25)),
//                             padding: const EdgeInsets.all(20)),
//                         child: Text(
//                           'Back To Shopping',
//                           style: normalText,
//                         ),
//                       )),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           )));
// }
