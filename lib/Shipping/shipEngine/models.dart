class ResRate{

  String shipmentId;
  String status;
  DateTime createdAt;
  List<dynamic> invalidRates;
  dynamic errors;
  List<Rates> rates;

  ResRate({
    this.shipmentId,
    this.status,
    this.createdAt,
    this.rates,
    this.invalidRates,
    this.errors,
    });

  factory ResRate.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson["rate_response"]['rates'] as List;
    List<Rates> ratesList = list.map((i) => Rates.fromJson(i)).toList();
 var invalid = parsedJson["invalid_rates"] as List;
    List<dynamic> invalidList = invalid.map((i) => i).toList();

 //   List<dynamic>.from(parsedJson["invalid_rates"].map((x) => x))
    return ResRate(

        shipmentId: parsedJson["shipment_id"],
        status: parsedJson["status"],
        createdAt: DateTime.parse(parsedJson["created_at"]),
        invalidRates: invalidList,
        errors: parsedJson["errors"],
        rates: ratesList

    );
  }
}



class Amount{
  var currency;
  var amount;

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
  String rateId;
  String rateType;
  String carrierId;
  Amount shippingAmount;
  Amount insuranceAmount;
  Amount confirmationAmount;
  Amount otherAmount;
  int deliveryDays;
  bool guaranteedService;
  DateTime deliveryDate;
  String carrierDeliveryDays;
  String shipDate;
  bool negotiatedRate;
  String serviceType;
  String serviceCode;
  bool trackable;
  String validationStatus;
  List<dynamic> warningMessages;
  List<dynamic> errorMessages;
  String carrierCode;
  String carrierNickname;
  String carrierFriendlyName;
  //List<Amount> shipping_amount;

  Rates({
    this.rateId,
    this.rateType,
    this.carrierId,
    this.shippingAmount,
    this.insuranceAmount,
    this.confirmationAmount,
    this.otherAmount,
    this.deliveryDays,
    this.guaranteedService,
    this.deliveryDate,
    this.carrierDeliveryDays,
    this.shipDate,
    this.negotiatedRate,
    this.serviceType,
    this.serviceCode,
    this.trackable,
    this.validationStatus,
    this.warningMessages,
    this.errorMessages,
    this.carrierCode,
    this.carrierNickname,
    this.carrierFriendlyName,
  });

  factory Rates.fromJson(Map<String, dynamic> parsedJson){

  //  var list = parsedJson['images'] as List;
   // List<Image> images = list.map((i) => Image.fromJson(i)).toList();


    return Rates(

      rateId: parsedJson['rate_id'],
      rateType: parsedJson['rate_type'],
      carrierId: parsedJson['carrier_id'],
      shippingAmount: Amount.fromJson(parsedJson["shipping_amount"]),
      insuranceAmount: Amount.fromJson(parsedJson["insurance_amount"]),
      confirmationAmount: Amount.fromJson(parsedJson["confirmation_amount"]),
      otherAmount: Amount.fromJson(parsedJson["other_amount"]),
      deliveryDays: parsedJson["delivery_days"],
      guaranteedService: parsedJson["guaranteed_service"],
      deliveryDate: DateTime.parse(parsedJson["delivery_date"]),
      carrierDeliveryDays: parsedJson["carrier_delivery_days"],
      shipDate: parsedJson["ship_date"],
      negotiatedRate: parsedJson["negotiated_rate"],
      serviceType: parsedJson["service_type"],
      serviceCode: parsedJson["service_code"],
      trackable: parsedJson["trackable"],
      validationStatus: parsedJson["validation_status"],
      warningMessages: List<dynamic>.from(parsedJson["warning_messages"].map((x) => x)),
      errorMessages: List<dynamic>.from(parsedJson["error_messages"].map((x) => x)),
      carrierCode: parsedJson["carrier_code"],
      carrierNickname: parsedJson["carrier_nickname"],
      carrierFriendlyName: parsedJson["carrier_friendly_name"],
    );
  }
}

