import 'package:expense_app/transaction.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey[400],
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 35,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    child: Text(
                      'Rs: ${transactions[index].amount}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              title: Text(
                transactions[index].title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transactions[index].date),
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              trailing: IconButton(
                onPressed: () => deleteTx(transactions[index].id),
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          );

          //   Card(
          //   child: Row(
          //     children: [
          //       Container(
          //         margin: EdgeInsets.symmetric(
          //           vertical: 10,
          //           horizontal: 15,
          //         ),
          //         padding: EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(15.00),
          //             border: Border.all(
          //               color: Colors.purple,
          //               width: 2,
          //             )),
          //         child: Text(
          //           'Rs: ${transactions[index].amount.toStringAsFixed(2)}',
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 20,
          //             color: Colors.purple,
          //           ),
          //         ),
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             transactions[index].title,
          //             style: TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           Text(
          //             DateFormat.yMMMd().format(transactions[index].date),
          //             style: TextStyle(
          //               color: Colors.grey,
          //               fontSize: 10,
          //             ),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
