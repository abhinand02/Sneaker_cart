import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_cart/Application/address/address_bloc.dart';
import 'package:sneaker_cart/Constants/colors.dart';
import 'package:sneaker_cart/Constants/text.dart';
import 'package:sneaker_cart/Services/database.dart';

class AddressListPage extends StatelessWidget {
  const AddressListPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<AddressBloc>(context).add(const GetAddress());
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('My Addresses'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {},
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            child: Text(
              'Add a new Address',
              style: normalText,
            ),
          ),
          Expanded(
            child: BlocBuilder<AddressBloc, AddressState>(
              builder: (context, state) {
                    final length = state.addressList!.docs.length;
                return ListView.builder(
                  itemBuilder: (context, index) {
                     if(state.addressList!.docs.isEmpty) {
                      return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
                    }
                    final data = state.addressList!.docs[index].data() as Map<String, dynamic>;
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data['name']),
                              PopupMenuButton(
                                icon: Icon(Icons.more_vert_rounded),
                                itemBuilder: (_) => <PopupMenuItem<int>>[
                                  PopupMenuItem(
                                    value: 0,
                                    child: SizedBox(
                                      width: 80,
                                      child: Text(
                                        'Edit',
                                        style: normalText,
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 1,
                                    child: SizedBox(
                                      width: 80,
                                      child: Text(
                                        'Delete',
                                        style: normalText,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Text(data['address']+", "+data['pincode']),
                          Text(data['number']),
                          height10,
                        ],
                      ),
                    );
                  },
                  itemCount: length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}