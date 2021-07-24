class ResRate{

 // Amount amount;
  List<Rates> rates;

  ResRate({
   // this.amount,
    this.rates});

  factory ResRate.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['rates'] as List;
    List<Rates> rates = list.map((i) => Rates.fromJson(i)).toList();


    return ResRate(

     //   amount: Amount.fromJson(parsedJson['amount']),
        rates: rates

    );
  }
}



class Amount{
  var currency;
  String amount;

  Amount({this.currency,
    this.amount});

  factory Amount.fromJson(Map<String, dynamic> parsedJson){
    return Amount(
      currency: parsedJson['currency'],
      amount : parsedJson['amount'],
    );
  }

}

class Rates{
  var rate_id;
  var rate_type;
   var carrier_id;
  Amount amount;

  //List<Amount> shipping_amount;

  Rates({
    this.rate_id, this.amount,
      this.rate_type, this.carrier_id,

  });

  factory Rates.fromJson(Map<String, dynamic> parsedJson){

  //  var list = parsedJson['images'] as List;
   // List<Image> images = list.map((i) => Image.fromJson(i)).toList();


    return Rates(
        rate_id: parsedJson['rate_id'],
      rate_type: parsedJson['rate_type'],
      carrier_id: parsedJson['carrier_id'],

      amount: Amount.fromJson(parsedJson['shipping_amount']),
    );
  }
}

