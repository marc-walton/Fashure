

class Items {

  final String images;
  final  String inr;
 final  String des;
   final String usd;


  Items({this.inr, this.des, this.usd, this.images,});

  Map<String, dynamic> toJson() => {
    "images": this.images,
    "inr": this.inr,
    "usd": this.usd,
    "des": this.des,


  };
  Items.fromMap(Map<String, dynamic> data)
      : images = data['images'],
        des = data['description'],
        usd = data['usd'],
        inr = data['inr'];

}
