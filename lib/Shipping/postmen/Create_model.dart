class CreateModel {
  Meta meta;
  Data data;

  CreateModel({this.meta, this.data});
  factory CreateModel.fromJson(Map<String, dynamic> parsedJson){


    //   List<dynamic>.from(parsedJson["invalid_rates"].map((x) => x))
    return CreateModel(
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
  String id;
  String status;
  List<String> trackingNumbers;
  Files files;
  Rate rate;
  String createdAt;
  String updatedAt;
  String shipDate;

  Data(
      {this.id,
        this.status,
        this.trackingNumbers,
        this.files,
        this.rate,
        this.createdAt,
        this.updatedAt,
        this.shipDate});
  factory Data.fromJson(Map<String, dynamic> parsedJson){
    var invalid = parsedJson["details"] as List;
    List<String> invalidList = invalid.map((i) => i).toList();

    return Data(

      id: parsedJson['id'],
      status: parsedJson['status'],
      trackingNumbers: parsedJson['tracking_numbers'],
    files: Files.fromJson(parsedJson["files"]),
      rate: Rate.fromJson(parsedJson["rate"]),
      createdAt: parsedJson['created_at'],
      updatedAt: parsedJson['updated_at'],
      shipDate: parsedJson['ship_date'],


    );
  }

}

class Files {
  Label label;
  dynamic invoice;
  dynamic customsDeclaration;
  dynamic manifest;

  Files({this.label, this.invoice, this.customsDeclaration, this.manifest});
  factory Files.fromJson(Map<String, dynamic> parsedJson){


    return Files(

      label: Label.fromJson(parsedJson["label"]),
      invoice: parsedJson['invoice'],
      customsDeclaration: parsedJson['customs_declaration'],
      manifest: parsedJson['manifest'],


    );
  }

}

class Label {
  String paperSize;
  String url;
  String fileType;

  Label({this.paperSize, this.url, this.fileType});

  factory Label.fromJson(Map<String, dynamic> parsedJson){

    return Label(

      paperSize: parsedJson['paper_size'],
      url: parsedJson['url'],
      fileType: parsedJson['file_type'],


    );
  }

}

class Rate {
  ChargeWeight chargeWeight;
  TotalCharge totalCharge;
  ShipperAccount shipperAccount;
  String serviceType;
  String serviceName;
  dynamic pickupDeadline;
  dynamic bookingCutOff;
  dynamic deliveryDate;
  dynamic transitTime;
  List<dynamic> detailedCharges;
  dynamic errorMessage;
  dynamic infoMessage;

  Rate(
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
  factory Rate.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['detailed_charges'] as List;
    List<DetailedCharges> ratesList = list.map((i) => DetailedCharges.fromJson(i)).toList();
    return Rate(
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
      unit: parsedJson['unit'],

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
