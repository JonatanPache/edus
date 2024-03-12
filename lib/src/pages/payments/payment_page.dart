import 'package:edus/src/models/card_credit.dart';
import 'package:edus/src/pages/payments/card_credits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  Future<List<CardCreditModel>>? list;
  @override
  void initState() {
    super.initState();
    list = [
      CardCreditModel(id: '1', cardNumber: '4000056655665556', nameOwner: 'Yonatan Jeremias', dvv: '546', valid: true, idUser: '1', expMonth: '08', expYear: '25', idPaymentMethod: '1')
    ] as Future<List<CardCreditModel>>?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Metodo de Pago",
          style: TextStyle(color: Colors.black87),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    barrierColor: Colors.black,
                    pageBuilder: (BuildContext context, _, __) {
                      return const CreateCardCredit();
                    },
                  ),
                );
                setState(() {

                });
              },
              child: const Icon(Icons.add)
          )
        ],
      ),
      body: FutureBuilder(
          future: list,
          builder: (context, AsyncSnapshot<List<CardCreditModel>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                return GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 0.2, mainAxisExtent: 220),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (_, index) {
                      return _builder(snapshot.data![index]);
                    });
              } else {
                return Container();
              }
            } else {
              return Container();
            }
          }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(onPressed: () async {
        },
          child: const Text('CONFIRMAR PAGO'),),
      ),
    );
  }

  _builder(CardCreditModel index) {
    return CardCredit(item: index);
  }
}

class CardCredit extends ConsumerStatefulWidget {
  final CardCreditModel item;

  const CardCredit({super.key, required this.item});

  @override
  ConsumerState<CardCredit> createState() => _CardCreditState();
}

class _CardCreditState extends ConsumerState<CardCredit> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      },
      child: Container(
        width: 300,
        height: 300,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'AMERICAN \nEXPRESS',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.item.cardNumber,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.item.nameOwner,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/visa-icon-11671.png',
                  height: 60,
                  width: 60,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
