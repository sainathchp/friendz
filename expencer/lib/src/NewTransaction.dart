import 'package:flutter/material.dart';
import 'user_transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function func;

  NewTransaction(this.func);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller=TextEditingController();

  final amountcontroller=TextEditingController();

  void func1() {
    final enteredtitle=titlecontroller.text;
    final d=double.parse(amountcontroller.text);
    if (d<=0 || enteredtitle.isEmpty)  {
      return;
  }
    widget.func(titlecontroller.text ,
  double.parse(amountcontroller.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: TextField(
                onSubmitted: (_) => func1(),
                controller: titlecontroller,
                decoration: InputDecoration(labelText: "  Title",border: OutlineInputBorder(gapPadding: 2)) ,
                autocorrect: true,
                cursorColor: Color.fromRGBO(0, 102, 204, 0),
                textCapitalization: TextCapitalization.values[1],),
            ),
            TextField(
              onSubmitted: (_) => func1(),
              controller: amountcontroller,
              decoration: InputDecoration(labelText: "  Amount",border: OutlineInputBorder(gapPadding: 2)) ,
              cursorColor: Color.fromRGBO(0, 102, 204, 0),
              keyboardType: TextInputType.numberWithOptions(decimal: true),),
            FlatButton(
                child: Text("Add Transaction",style: TextStyle(color:Color.fromRGBO(40, 180, 99, 30), ),),
                onPressed: func1),
          ],),
      ),
    );
  }
}
