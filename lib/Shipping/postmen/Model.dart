class PostMen {
  Meta meta;
  Data data;

  PostMen({this.meta, this.data});
  factory PostMen.fromJson(Map<String, dynamic> parsedJson){


    //   List<dynamic>.from(parsedJson["invalid_rates"].map((x) => x))
    return PostMen(
      meta: Meta.fromJson(parsedJson["meta"]),
      data: Data.fromJson(parsedJson["data"]),
      );
  }

}

class Meta {
  int code;
  String message;
  List<dynamic> details;

  Meta({this.code, this.message, this.details});

  factory Meta.fromJson(Map<String, dynamic> parsedJson){
    var invalid = parsedJson["details"] as List;
    List<dynamic> invalidList = invalid.map((i) => i).toList();

    return Meta(
      code: parsedJson['code'],
      message : parsedJson['message'],
      details :invalidList,

    );
  }
}

class Data {
  String createdAt;
  String id;
  String updatedAt;
  String status;
  List<Rates> rates;

  Data({this.createdAt, this.id, this.updatedAt, this.status, this.rates});

  factory Data.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['rates'] as List;
    List<Rates> ratesList = list.map((i) => Rates.fromJson(i)).toList();
    return Data(
      createdAt: parsedJson['createdAt'],
      id : parsedJson['id'],
      updatedAt: parsedJson['updatedAt'],
      status : parsedJson['status'],
      rates:ratesList,
    );
  }

}

class Rates {
  ChargeWeight chargeWeight;
  TotalCharge totalCharge;
  ShipperAccount shipperAccount;
  String serviceType;
  String serviceName;
  String pickupDeadline;
  String bookingCutOff;
  String deliveryDate;
  int transitTime;
  List<DetailedCharges> detailedCharges;
  String errorMessage;
  String infoMessage;

  Rates(
      {this.chargeWeight,
        this.totalCharge,
        this.shipperAccount,
        this.serviceType,
        this.serviceName,
        this.pickupDeadline,
        this.bookingCutOff,
        this.deliveryDate,
        this.transitTime,
        this.detailedCharges,
        this.errorMessage,
        this.infoMessage});
  factory Rates.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['detailed_charges'] as List;
    List<DetailedCharges> ratesList = list.map((i) => DetailedCharges.fromJson(i)).toList();
    return Rates(
      chargeWeight: ChargeWeight.fromJson(parsedJson["charge_weight"]),
      totalCharge: TotalCharge.fromJson(parsedJson["total_charge"]),
     shipperAccount: ShipperAccount.fromJson(parsedJson["shipper_account"]),

      serviceType: parsedJson['service_type'],
      serviceName: parsedJson['service_name'],
      pickupDeadline: parsedJson['pickup_deadline'],
      bookingCutOff: parsedJson['booking_cut_off'],
      deliveryDate: parsedJson['delivery_date'],
      transitTime: parsedJson['transit_time'],
      errorMessage: parsedJson['error_message'],
      infoMessage: parsedJson['info_message'],

      detailedCharges:ratesList,

    );
  }


}

class ChargeWeight {
  double value;
  String unit;

  ChargeWeight({this.value, this.unit});
  factory ChargeWeight.fromJson(Map<String, dynamic> parsedJson){
    return ChargeWeight(
      value: parsedJson['value'],
      unit : parsedJson['unit'],
    );
  }

}

class TotalCharge {
  double amount;
  String currency;

  TotalCharge({this.amount, this.currency});
  factory TotalCharge.fromJson(Map<String, dynamic> parsedJson){
    return TotalCharge(
      amount: parsedJson['amount'],
      currency : parsedJson['currency'],
    );
  }

}

class ShipperAccount {
  String id;
  String slug;
  String description;

  ShipperAccount({this.id, this.slug, this.description});
  factory ShipperAccount.fromJson(Map<String, dynamic> parsedJson){
    return ShipperAccount(
      id: parsedJson['id'],
      slug : parsedJson['slug'],
      description : parsedJson['description'],

    );
  }

}

class DetailedCharges {
  String type;
  TotalCharge charge;

  DetailedCharges({this.type, this.charge});
  factory DetailedCharges.fromJson(Map<String, dynamic> parsedJson){
    return DetailedCharges(
      type: parsedJson['type'],
      charge: TotalCharge.fromJson(parsedJson["charge"]),


    );
  }


}
