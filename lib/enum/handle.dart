HandleSubmit() async {
  Fluttertoast.showToast(
      msg: "Please wait:Uploading", timeInSecForIos: 4);

  setState(() {
    isUploading = true;
  });
  Fluttertoast.showToast(
      msg: "Please wait:Uploading", timeInSecForIos: 4);

  await compressImage();
  String shopmediaUrl = await uploadImage(file);
  // await INRUSD();

  if(dropdownValue=='Men'){
    if (currentUser.country == 'India') {
      await createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        // selectedSizes: selectedSizes,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        inrtousd: inrtousd,
        inrtocny: inrtocny,
        inrtogbp: inrtogbp,
        inrtoeur: inrtoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
        fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
        sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
        sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
        eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
        Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
        Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,
        Shoe17:  int.tryParse(Shoe17controller.text) ?? 0,
        Shoe18:  int.tryParse(Shoe18controller.text) ?? 0,
        Shoe19:  int.tryParse(Shoe19controller.text) ?? 0,
        Shoe20:  int.tryParse(Shoe20controller.text) ?? 0,
        Shoe21:  int.tryParse(Shoe21controller.text) ?? 0,




      );
    }
    else if (currentUser.country == 'Europe'){
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        // selectedSizes: selectedSizes,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        eurtoinr:eurtoinr,
        eurtousd:eurtousd,
        eurtocny:eurtocny,
        eurtogbp:eurtogbp,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
        fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
        sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
        sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
        eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
        Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
        Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,
        Shoe17:  int.tryParse(Shoe17controller.text) ?? 0,
        Shoe18:  int.tryParse(Shoe18controller.text) ?? 0,
        Shoe19:  int.tryParse(Shoe19controller.text) ?? 0,
        Shoe20:  int.tryParse(Shoe20controller.text) ?? 0,
        Shoe21:  int.tryParse(Shoe21controller.text) ?? 0,

      );
    }
    else if (currentUser.country == 'UK') {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        // selectedSizes: selectedSizes,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        gbptoinr:gbptoinr,
        gbptocny:gbptocny,
        gbptousd:gbptousd,
        gbptoeur:gbptoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
        fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
        sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
        sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
        eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
        Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
        Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,
        Shoe17:  int.tryParse(Shoe17controller.text) ?? 0,
        Shoe18:  int.tryParse(Shoe18controller.text) ?? 0,
        Shoe19:  int.tryParse(Shoe19controller.text) ?? 0,
        Shoe20:  int.tryParse(Shoe20controller.text) ?? 0,
        Shoe21:  int.tryParse(Shoe21controller.text) ?? 0,


      );
    }
    else if (currentUser.country == 'USA') {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        // selectedSizes: selectedSizes,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        usdtoinr:usdtoinr,
        usdtocny:usdtocny,
        usdtogbp:usdtogbp,
        usdtoeur:usdtoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
        fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
        sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
        sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
        eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
        Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
        Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,
        Shoe17:  int.tryParse(Shoe17controller.text) ?? 0,
        Shoe18:  int.tryParse(Shoe18controller.text) ?? 0,
        Shoe19:  int.tryParse(Shoe19controller.text) ?? 0,
        Shoe20:  int.tryParse(Shoe20controller.text) ?? 0,
        Shoe21:  int.tryParse(Shoe21controller.text) ?? 0,

      );
    }
    else {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        // selectedSizes: selectedSizes,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        usdtoinr:usdtoinr,
        usdtocny:usdtocny,
        usdtogbp:usdtogbp,
        usdtoeur:usdtoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
        fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
        sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
        sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
        eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
        Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
        Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,
        Shoe17:  int.tryParse(Shoe17controller.text) ?? 0,
        Shoe18:  int.tryParse(Shoe18controller.text) ?? 0,
        Shoe19:  int.tryParse(Shoe19controller.text) ?? 0,
        Shoe20:  int.tryParse(Shoe20controller.text) ?? 0,
        Shoe21:  int.tryParse(Shoe21controller.text) ?? 0,


      );
    }
    Navigator.pop(context);
  }
  if(dropdownValue=='Women'){
    if (currentUser.country == 'India') {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        inrtousd: inrtousd,
        inrtocny: inrtocny,
        inrtogbp: inrtogbp,
        inrtoeur: inrtoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
        fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
        sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
        sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
        eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
        Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
        Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,


      );
    }
    else if (currentUser.country == 'Europe')  {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        eurtoinr:eurtoinr,
        eurtousd:eurtousd,
        eurtocny:eurtocny,
        eurtogbp:eurtogbp,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
        fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
        sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
        sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
        eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
        Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
        Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,


      );
    }
    else if (currentUser.country == 'UK')  {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        gbptoinr:gbptoinr,
        gbptocny:gbptocny,
        gbptousd:gbptousd,
        gbptoeur:gbptoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
        fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
        sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
        sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
        eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
        Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
        Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,


      );
    }
    else if (currentUser.country == 'USA')  {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        usdtoinr:usdtoinr,
        usdtocny:usdtocny,
        usdtogbp:usdtogbp,
        usdtoeur:usdtoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
        fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
        sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
        sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
        eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
        Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
        Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,


      );
    }
    else   {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        usdtoinr:usdtoinr,
        usdtocny:usdtocny,
        usdtogbp:usdtogbp,
        usdtoeur:usdtoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,
        fivexlQuantity:  int.tryParse(fivexlcontroller.text) ?? 0,
        sixxlQuantity:  int.tryParse(sixxlcontroller.text) ?? 0,
        sevenxlQuantity:  int.tryParse(sevenxlcontroller.text) ?? 0,
        eightxlQuantity:  int.tryParse(eightxlcontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,
        Shoe15:  int.tryParse(Shoe15controller.text) ?? 0,
        Shoe16:  int.tryParse(Shoe16controller.text) ?? 0,


      );
    }
    Navigator.pop(context);
  }
  if(dropdownValue=='Baby-Boys'||dropdownValue=='Baby-Girls'){
    if (currentUser.country == 'India') {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        inrtousd: inrtousd,
        inrtocny: inrtocny,
        inrtogbp: inrtogbp,
        inrtoeur: inrtoeur,
        color: colorController.text,
        composition: compositionController.text ?? "",
        washandcare: washandcareController.text ?? "",
        sizeandfit: sizeandfitController.text ?? "",
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,
        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,




      );
    }
    else if (currentUser.country == 'Europe') {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        eurtoinr:eurtoinr,
        eurtousd:eurtousd,
        eurtocny:eurtocny,
        eurtogbp:eurtogbp,
        color: colorController.text,
        composition: compositionController.text ?? "",
        washandcare: washandcareController.text ?? "",
        sizeandfit: sizeandfitController.text ?? "",
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,
        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,


      );
    }
    else if (currentUser.country == 'UK')  {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        gbptoinr:gbptoinr,
        gbptocny:gbptocny,
        gbptousd:gbptousd,
        gbptoeur:gbptoeur,
        color: colorController.text,
        composition: compositionController.text ?? "",
        washandcare: washandcareController.text ?? "",
        sizeandfit: sizeandfitController.text ?? "",
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,
        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,

      );
    }
    else if (currentUser.country == 'USA') {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        usdtoinr:usdtoinr,
        usdtocny:usdtocny,
        usdtogbp:usdtogbp,
        usdtoeur:usdtoeur,
        color: colorController.text,
        composition: compositionController.text ?? "",
        washandcare: washandcareController.text ?? "",
        sizeandfit: sizeandfitController.text ?? "",
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,
        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,


      );
    }
    else {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        usdtoinr:usdtoinr,
        usdtocny:usdtocny,
        usdtogbp:usdtogbp,
        usdtoeur:usdtoeur,
        color: colorController.text,
        composition: compositionController.text ?? "",
        washandcare: washandcareController.text ?? "",
        sizeandfit: sizeandfitController.text ?? "",
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,
        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,


      );
    }
    Navigator.pop(context);
  }
  if(dropdownValue=='Kids-Boys'||dropdownValue=='Kids-Girls'){
    if (currentUser.country == 'India') {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        inrtousd: inrtousd,
        inrtocny: inrtocny,
        inrtogbp: inrtogbp,
        inrtoeur: inrtoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,

        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,



      );
    }
    else if (currentUser.country == 'Europe'){
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        eurtoinr:eurtoinr,
        eurtousd:eurtousd,
        eurtocny:eurtocny,
        eurtogbp:eurtogbp,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,

        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,



      );
    }
    else if (currentUser.country == 'UK') {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        gbptoinr:gbptoinr,
        gbptocny:gbptocny,
        gbptousd:gbptousd,
        gbptoeur:gbptoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,

        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,



      );
    }
    else if (currentUser.country == 'USA') {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        usdtoinr:usdtoinr,
        usdtocny:usdtocny,
        usdtogbp:usdtogbp,
        usdtoeur:usdtoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,

        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,



      );
    }
    else{
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        usdtoinr:usdtoinr,
        usdtocny:usdtocny,
        usdtogbp:usdtogbp,
        usdtoeur:usdtoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,


        mQuantity:  int.tryParse(mcontroller.text) ?? 0,
        lQuantity:  int.tryParse(lcontroller.text) ?? 0,
        xlQuantity:  int.tryParse(xlcontroller.text) ?? 0,
        xxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        xxxlQuantity:  int.tryParse(xxlcontroller.text) ?? 0,
        fourxlQuantity:  int.tryParse(fourxlcontroller.text) ?? 0,

        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,
        Shoe5:   int.tryParse(Shoe5controller.text) ?? 0,
        Shoe6:   int.tryParse(Shoe6controller.text) ?? 0,
        Shoe7:   int.tryParse(Shoe7controller.text) ?? 0,
        Shoe8:   int.tryParse(Shoe8controller.text) ?? 0,
        Shoe9:   int.tryParse(Shoe9controller.text) ?? 0,
        Shoe10:   int.tryParse(Shoe10controller.text) ?? 0,
        Shoe11:   int.tryParse(Shoe11controller.text) ?? 0,
        Shoe12:   int.tryParse(Shoe12controller.text) ?? 0,
        Shoe13:   int.tryParse(Shoe13controller.text) ?? 0,
        Shoe14:   int.tryParse(Shoe14controller.text) ?? 0,



      );
    }
    Navigator.pop(context);
  }
  if(dropdownValue=='Teen-Boys'||dropdownValue=='Teen-Girls'){
    if (currentUser.country == 'India') {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        inrtousd: inrtousd,
        inrtocny: inrtocny,
        inrtogbp: inrtogbp,
        inrtoeur: inrtoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,



      );
    }
    else if (currentUser.country == 'Europe')  {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        eurtoinr:eurtoinr,
        eurtousd:eurtousd,
        eurtocny:eurtocny,
        eurtogbp:eurtogbp,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,



      );
    }
    else if (currentUser.country == 'UK')  {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        gbptoinr:gbptoinr,
        gbptocny:gbptocny,
        gbptousd:gbptousd,
        gbptoeur:gbptoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,



      );
    }
    else if (currentUser.country == 'USA')  {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        usdtoinr:usdtoinr,
        usdtocny:usdtocny,
        usdtogbp:usdtogbp,
        usdtoeur:usdtoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity: int.tryParse(freesizecontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,



      );
    }
    else  {
      createProdInFirestore(
        shopmediaUrl: shopmediaUrl,
        Category: value,
        world:worldship,
        ship: shipcontroller.text,          gender: dropdownValue,
        details: detailsController.text,
        productname: productnameController.text,
        price: userprice,
        usdtoinr:usdtoinr,
        usdtocny:usdtocny,
        usdtogbp:usdtogbp,
        usdtoeur:usdtoeur,
        color: colorController.text,
        composition: compositionController.text,
        washandcare: washandcareController.text,
        sizeandfit: sizeandfitController.text,
        xxxsQuantity: int.tryParse(xxxscontroller.text) ?? 0,
        xxsQuantity: int.tryParse(xxscontroller.text) ?? 0,
        xsQuantity:  int.tryParse(xscontroller.text )?? 0,
        sQuantity: int.tryParse(scontroller.text) ?? 0,

        mtoQuantity:  int.tryParse(mtocontroller.text) ?? 0,
        freesizeQuantity:   int.tryParse(freesizecontroller.text) ?? 0,
        Shoe1:   int.tryParse(Shoe1controller.text) ?? 0,
        Shoe2:   int.tryParse(Shoe2controller.text) ?? 0,
        Shoe3:   int.tryParse(Shoe3controller.text) ?? 0,
        Shoe4:   int.tryParse(Shoe4controller.text) ?? 0,




      );
    }
    Navigator.pop(context);
  }

}


createProdInFirestore(
    {List shopmediaUrl,
      String Category,
      var price,
      List selectedSizes,
      String details,
      String productname,

      String color,
      String composition,
      String washandcare,
      String sizeandfit,
      int freesizeQuantity,
      int xxxsQuantity,
      int xxsQuantity,
      int xsQuantity,
      int sQuantity,
      int mQuantity,
      int lQuantity,
      int xlQuantity,
      int xxlQuantity,
      int xxxlQuantity,
      int fourxlQuantity,
      int fivexlQuantity,
      int sixxlQuantity,
      int sevenxlQuantity,
      int eightxlQuantity,
      int Shoe1,
      int Shoe2,
      int Shoe3,
      int Shoe4,
      int Shoe5,
      int Shoe6,
      int Shoe7,
      int Shoe8,
      int Shoe9,
      int Shoe10,
      int Shoe11,
      int Shoe12,
      int Shoe13,
      int Shoe14,
      int Shoe15,
      int Shoe16,
      int Shoe17,
      int Shoe18,
      int Shoe19,
      int Shoe20,
      int Shoe21,
      int mtoQuantity,
      String gender,
      var inrtousd,
      var inrtocny,
      var inrtogbp,
      var inrtoeur,
      var usdtoinr,
      var usdtocny,
      var usdtogbp,
      var usdtoeur,
      var cnytoinr,
      var cnytousd,
      var cnytogbp,
      var cnytoeur,
      var gbptoinr,
      var gbptocny,
      var gbptousd,
      var gbptoeur,
      var eurtoinr,
      var eurtousd,
      var eurtocny,
      var eurtogbp,
      bool world,
      String     ship,
    }) {
  if(dropdownValue=='Men'){
    if (currentUser.country == 'India') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({
        "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": inrtousd.toString(),
        "cny": inrtocny.toString(),
        "gbp": inrtogbp.toString(),
        "eur": inrtoeur.toString(),
        "inr": price.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,
        "5xlQuantity": fivexlQuantity,
        "6xlQuantity": sixxlQuantity,
        "7xlQuantity": sevenxlQuantity,
        "8xlQuantity": eightxlQuantity,
        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,
        "Shoe15":Shoe15,
        "Shoe16":Shoe16,
        "Shoe17":Shoe17,
        "Shoe18":Shoe18,
        "Shoe19":Shoe19,
        "Shoe20":Shoe20,
        "Shoe21":Shoe21,
        "mtoQuantity": mtoQuantity,
        // "selectedSizes": selectedSizes,
        "likes": {},
      });



      setState(() {
        file = null;
        // isUploading = false;
      });
    }
    else if (currentUser.country == 'Europe'){
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": eurtousd.toString(),
        "cny": eurtocny.toString(),
        "gbp": eurtogbp.toString(),
        "eur": price.toString(),
        "inr": eurtoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,
        "5xlQuantity": fivexlQuantity,
        "6xlQuantity": sixxlQuantity,
        "7xlQuantity": sevenxlQuantity,
        "8xlQuantity": eightxlQuantity,
        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,
        "Shoe15":Shoe15,
        "Shoe16":Shoe16,
        "Shoe17":Shoe17,
        "Shoe18":Shoe18,
        "Shoe19":Shoe19,
        "Shoe20":Shoe20,
        "Shoe21":Shoe21,
        "mtoQuantity": mtoQuantity,
        "likes": {},
      });



      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'UK') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": gbptousd.toString(),
        "cny": gbptocny.toString(),
        "gbp": price.toString(),
        "eur": gbptoeur.toString(),
        "inr": gbptoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,
        "5xlQuantity": fivexlQuantity,
        "6xlQuantity": sixxlQuantity,
        "7xlQuantity": sevenxlQuantity,
        "8xlQuantity": eightxlQuantity,
        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,
        "Shoe15":Shoe15,
        "Shoe16":Shoe16,
        "Shoe17":Shoe17,
        "Shoe18":Shoe18,
        "Shoe19":Shoe19,
        "Shoe20":Shoe20,
        "Shoe21":Shoe21,
        "mtoQuantity": mtoQuantity,
        "likes": {},
      });

      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'USA') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "cny": usdtocny.toString(),
        "gbp": usdtogbp.toString(),
        "eur": usdtoeur.toString(),
        "inr": usdtoinr.toString(),
        "usd" :price.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,
        "5xlQuantity": fivexlQuantity,
        "6xlQuantity": sixxlQuantity,
        "7xlQuantity": sevenxlQuantity,
        "8xlQuantity": eightxlQuantity,
        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,
        "Shoe15":Shoe15,
        "Shoe16":Shoe16,
        "Shoe17":Shoe17,
        "Shoe18":Shoe18,
        "Shoe19":Shoe19,
        "Shoe20":Shoe20,
        "Shoe21":Shoe21,
        "mtoQuantity": mtoQuantity,
        "likes": {},
      });


      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "cny": usdtocny.toString(),
        "gbp": usdtogbp.toString(),
        "eur": usdtoeur.toString(),
        "inr": usdtoinr.toString(),
        "usd" :price.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,
        "5xlQuantity": fivexlQuantity,
        "6xlQuantity": sixxlQuantity,
        "7xlQuantity": sevenxlQuantity,
        "8xlQuantity": eightxlQuantity,
        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,
        "Shoe15":Shoe15,
        "Shoe16":Shoe16,
        "Shoe17":Shoe17,
        "Shoe18":Shoe18,
        "Shoe19":Shoe19,
        "Shoe20":Shoe20,
        "Shoe21":Shoe21,
        "mtoQuantity": mtoQuantity,
        "likes": {},
      });


      setState(() {
        file = null;
        isUploading = false;
      });
    }
  }
  else if(dropdownValue=='Women') {
    if (currentUser.country == 'India') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": inrtousd.toString(),
        "cny": inrtocny.toString(),
        "gbp": inrtogbp.toString(),
        "eur": inrtoeur.toString(),
        "inr": price.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,
        "5xlQuantity": fivexlQuantity,
        "6xlQuantity": sixxlQuantity,
        "7xlQuantity": sevenxlQuantity,
        "8xlQuantity": eightxlQuantity,
        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,
        "Shoe15":Shoe15,
        "Shoe16":Shoe16,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });


      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'Europe'){
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": eurtousd.toString(),
        "cny": eurtocny.toString(),
        "gbp": eurtogbp.toString(),
        "eur": price.toString(),
        "inr": eurtoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,
        "5xlQuantity": fivexlQuantity,
        "6xlQuantity": sixxlQuantity,
        "7xlQuantity": sevenxlQuantity,
        "8xlQuantity": eightxlQuantity,
        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,
        "Shoe15":Shoe15,
        "Shoe16":Shoe16,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });


      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'UK') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": gbptousd.toString(),
        "cny": gbptocny.toString(),
        "gbp": price.toString(),
        "eur": gbptoeur.toString(),
        "inr": gbptoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,
        "5xlQuantity": fivexlQuantity,
        "6xlQuantity": sixxlQuantity,
        "7xlQuantity": sevenxlQuantity,
        "8xlQuantity": eightxlQuantity,
        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,
        "Shoe15":Shoe15,
        "Shoe16":Shoe16,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });

      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'USA') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": price.toString(),
        "cny": usdtocny.toString(),
        "gbp": usdtogbp.toString(),
        "eur": usdtoeur.toString(),
        "inr": usdtoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,
        "5xlQuantity": fivexlQuantity,
        "6xlQuantity": sixxlQuantity,
        "7xlQuantity": sevenxlQuantity,
        "8xlQuantity": eightxlQuantity,
        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,
        "Shoe15":Shoe15,
        "Shoe16":Shoe16,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });


      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": price.toString(),
        "cny": usdtocny.toString(),
        "gbp": usdtogbp.toString(),
        "eur": usdtoeur.toString(),
        "inr": usdtoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,
        "5xlQuantity": fivexlQuantity,
        "6xlQuantity": sixxlQuantity,
        "7xlQuantity": sevenxlQuantity,
        "8xlQuantity": eightxlQuantity,
        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,
        "Shoe15":Shoe15,
        "Shoe16":Shoe16,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });


      setState(() {
        file = null;
        isUploading = false;
      });
    }
  }
  else if(dropdownValue=='Baby-Boys'||dropdownValue=='Baby-Girls') {
    if (currentUser.country == 'India') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": inrtousd.toString(),
        "cny": inrtocny.toString(),
        "gbp": inrtogbp.toString(),
        "eur": inrtoeur.toString(),
        "inr": price.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,


        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });



      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'Europe') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": eurtousd.toString(),
        "cny": eurtocny.toString(),
        "gbp": eurtogbp.toString(),
        "eur": price.toString(),
        "inr": eurtoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,


        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });

      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'UK') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": gbptousd.toString(),
        "cny": gbptocny.toString(),
        "gbp": price.toString(),
        "eur": gbptoeur.toString(),
        "inr": gbptoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,


        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });


      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'USA') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": price.toString(),
        "cny": usdtocny.toString(),
        "gbp": usdtogbp.toString(),
        "eur": usdtoeur.toString(),
        "inr": usdtoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,


        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });



      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": price.toString(),
        "cny": usdtocny.toString(),
        "gbp": usdtogbp.toString(),
        "eur": usdtoeur.toString(),
        "inr": usdtoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,


        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });



      setState(() {
        file = null;
        isUploading = false;
      });
    }
  }
  else if(dropdownValue=='Kids-Boys'|| dropdownValue=='Kids-Girls') {
    if (currentUser.country == 'India') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({
        "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": inrtousd.toString(),
        "cny": inrtocny.toString(),
        "gbp": inrtogbp.toString(),
        "eur": inrtoeur.toString(),
        "inr": price.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,

        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });


      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'Europe') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": eurtousd.toString(),
        "cny": eurtocny.toString(),
        "gbp": eurtogbp.toString(),
        "eur": price.toString(),
        "inr": eurtoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,

        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });


      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'UK') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({
        "worldship":world,
        "shipment": ship,
        "indian":indian,

        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": gbptousd.toString(),
        "cny": gbptocny.toString(),
        "gbp": price.toString(),
        "eur": gbptoeur.toString(),
        "inr": gbptoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,

        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });




      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'USA') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": price.toString(),
        "cny": usdtocny.toString(),
        "gbp": usdtogbp.toString(),
        "eur": usdtoeur.toString(),
        "inr": usdtoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,

        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });


      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": price.toString(),
        "cny": usdtocny.toString(),
        "gbp": usdtogbp.toString(),
        "eur": usdtoeur.toString(),
        "inr": usdtoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,
        "mQuantity": mQuantity,
        "lQuantity": lQuantity,
        "xlQuantity": xlQuantity,
        "xxlQuantity": xxlQuantity,
        "xxxlQuantity": xxxlQuantity,
        "4xlQuantity": fourxlQuantity,

        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,
        "Shoe5":Shoe5,
        "Shoe6":Shoe6,
        "Shoe7":Shoe7,
        "Shoe8":Shoe8,
        "Shoe9":Shoe9,
        "Shoe10":Shoe10,
        "Shoe11":Shoe11,
        "Shoe12":Shoe12,
        "Shoe13":Shoe13,
        "Shoe14":Shoe14,

        "mtoQuantity": mtoQuantity,
        "likes": {},
      });


      setState(() {
        file = null;
        isUploading = false;
      });
    }
  }
  else if(dropdownValue=='Teen-Boys'||dropdownValue=='Teen-Girls') {
    if (currentUser.country == 'India') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({
        "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": inrtousd.toString(),
        "cny": inrtocny.toString(),
        "gbp": inrtogbp.toString(),
        "eur": inrtoeur.toString(),
        "inr": price.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,

        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,


        "mtoQuantity": mtoQuantity,
        "likes": {},
      });

      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'Europe'){
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": eurtousd.toString(),
        "cny": eurtocny.toString(),
        "gbp": eurtogbp.toString(),
        "eur": price.toString(),
        "inr": eurtoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,

        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,


        "mtoQuantity": mtoQuantity,
        "likes": {},
      });



      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'UK') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": gbptousd.toString(),
        "cny": gbptocny.toString(),
        "gbp": price.toString(),
        "eur": gbptoeur.toString(),
        "inr": gbptoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,

        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,


        "mtoQuantity": mtoQuantity,
        "likes": {},
      });



      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else if (currentUser.country == 'USA') {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": price.toString(),
        "cny": usdtocny.toString(),
        "gbp": usdtogbp.toString(),
        "eur": usdtoeur.toString(),
        "inr": usdtoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,

        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,


        "mtoQuantity": mtoQuantity,
        "likes": {},
      });




      setState(() {
        file = null;
        isUploading = false;
      });
    }
    else {
      productsRef
          .doc(widget.currentUser.id)
          .collection("userProducts")
          .doc(prodId)
          .set({          "indian":indian,
        "worldship":world,
        "shipment": ship,
        "prodId": prodId,
        "ownerId": widget.currentUser.id,
        "username": widget.currentUser.displayName,
        "photoUrl": widget.currentUser.photoUrl,
        "displayName": widget.currentUser.displayName,
        "shopmediaUrl": shopmediaUrl,
        "Category": Category,
        // "type":type,
        "Gender": gender,
        "details": details,
        "productname": productname,
        "usd": price.toString(),
        "cny": usdtocny.toString(),
        "gbp": usdtogbp.toString(),
        "eur": usdtoeur.toString(),
        "inr": usdtoinr.toString(),
        "color": color,
        "composition": composition,
        "washandcare": washandcare,
        "sizeandfit": sizeandfit,
        "timestamp": timestamp,
        "freesizeQuantity": freesizeQuantity,
        "xxxsQuantity": xxxsQuantity,
        "xxsQuantity": xxsQuantity,
        "xsQuantity": xsQuantity,
        "sQuantity": sQuantity,

        "Shoe1":Shoe1,
        "Shoe2":Shoe2,
        "Shoe3":Shoe3,
        "Shoe4":Shoe4,


        "mtoQuantity": mtoQuantity,
        "likes": {},
      });




      setState(() {
        file = null;
        isUploading = false;
      });
    }
  }


}
Container(child: Tags(
key:_tagStateKey,
textField: TagsTextField(
textStyle: TextStyle(fontSize: 10.0),
constraintSuggestion: true, suggestions: [],
//width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 10),
onSubmitted: (String str) {
// Add item to the data source.
setState(() {
// required
colors.add(str);
});
},
),
itemCount: colors.length, // required
itemBuilder: (int index){
final item = colors[index];

return ItemTags(
// Each ItemTags must contain a Key. Keys allow Flutter to
// uniquely identify widgets.
key: Key(index.toString()),
index: index, // required
title: item.title,
active: item.active,
customData: item.customData,
textStyle: TextStyle( fontSize: 10.0, ),
combine: ItemTagsCombine.withTextBefore,
//  image: ItemTagsImage(
///    image: AssetImage("img.jpg") // OR NetworkImage("https://...image.png")
//), // OR null,
icon: ItemTagsIcon(
icon: Icons.add,
), // OR null,
removeButton: ItemTagsRemoveButton(
onRemoved: (){
// Remove the item from the data source.
setState(() {
// required
colors.removeAt(index);
});
//required
return true;
},
), // OR null,
onPressed: (item) => print(item),
onLongPressed: (item) => print(item),
);

},
), ),
SizedBox(height: 8.0,),


else if(dropdownValue=='Women') {
return
showModalBottomSheet(
context: context,
builder: (BuildContext context) {
return
Column(
children: [
Expanded(
child: Container(
// color: kPrimaryColor,
child: ContainedTabBarView(
tabs: [
Text('Clothing',style:TextStyle(color:Colors.black)),
Text('Made-to-order',style:TextStyle(color:Colors.black)),
Text('Free size',style:TextStyle(color:Colors.black)),
Text('Custom size(upto 10)',style:TextStyle(color:Colors.black)),
Text('Ring(US/Canada)',style:TextStyle(color:Colors.black)),

Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
],
views: [
ListView(


children: [


ExpansionTile(
title: Text('XXXS'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xxxscontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('XXS'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xxscontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('XS'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xscontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('S'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: scontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('M'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: mcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('L'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: lcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('XL'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xlcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('XXL'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xxlcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('XXXL'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xxxlcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kSubtitle)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('4XL'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: fourxlcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kSubtitle)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('5XL'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: fivexlcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kSubtitle)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6XL'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: sixxlcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kSubtitle)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('7XL'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: sevenxlcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kSubtitle)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8XL'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: eightxlcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kSubtitle)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),


],
),
ListView(


children: [


ExpansionTile(
title: Text('Made-to-order'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: mtocontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),


],
),
ListView(


children: [


ExpansionTile(
title: Text('Free size'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: freesizecontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),


],
),
ListView(


children: [


ExpansionTile(
title: Text('Custom size 1'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController1,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController11,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController12,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 2'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController2,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController21,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController22,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 3'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController3,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController31,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController32,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 4'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController4,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController41,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController42,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 5'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController5,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController51,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController52,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 6'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController6,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController61,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController62,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 7'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController7,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController71,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController72,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 8'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController8,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController81,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController82,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 9'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController9,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController91,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController92,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 10'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController10,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController101,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController102,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),



],
),
ListView(
children: [
ExpansionTile(
title: Text('4'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring1controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('4.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring2controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring3controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('5.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring4controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring5controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring6controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('7'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring7controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('7.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring8controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring9controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring10controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring11controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring12controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('10'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring13controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('10.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring14controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('11'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring15controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('11.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring16controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('12'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring17controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('12.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring18controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('13'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring19controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('13.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring20controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('14'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring21controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('14.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring22controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('15'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring23controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),

],
),
ListView(
children: [
ExpansionTile(
title: Text('5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe1controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('5-1/2'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe2controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe3controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6-1/2'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe4controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('7'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe5controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('7-1/2'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe6controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe7controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8-1/2'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe8controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe9controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9-1/2'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe10controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('10'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe11controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('10-1/2'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe12controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('12'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe13controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('13'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe14controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('14'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe15controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('15-1/2'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe16controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),



],
),

],
onChange: (index) => print(index),

),
),
),
],
);
},
);
}
else  if(dropdownValue=='Baby-Boys'||dropdownValue=='Baby-Girls') {
return
showModalBottomSheet(
context: context,
builder: (BuildContext context) {
return
Column(
children: [

Expanded(
child: Container(
// color: kPrimaryColor,
child: ContainedTabBarView(
tabs: [
Text('Clothing',style:TextStyle(color:Colors.black)),
Text('Made-to-order',style:TextStyle(color:Colors.black)),
Text('Free size',style:TextStyle(color:Colors.black)),
Text('Custom size(upto 10)',style:TextStyle(color:Colors.black)),
Text('Ring(US/Canada)',style:TextStyle(color:Colors.black)),

Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
],
views: [
ListView(


children: [


ExpansionTile(
title: Text('0-3 mth'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xxxscontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('3-6 mth'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xxscontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6-9 mth'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xscontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9-12 mth'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: scontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('12-18 mth'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: mcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('18-24 mth'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: lcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),


],
),
ListView(


children: [


ExpansionTile(
title: Text('Made-to-order'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: mtocontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),


],
),
ListView(


children: [


ExpansionTile(
title: Text('Free size'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: freesizecontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),


],
),
ListView(


children: [


ExpansionTile(
title: Text('Custom size 1'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController1,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController11,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController12,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 2'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController2,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController21,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController22,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 3'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController3,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController31,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController32,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 4'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController4,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController41,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController42,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 5'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController5,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController51,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController52,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 6'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController6,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController61,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController62,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 7'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController7,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController71,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController72,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 8'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController8,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController81,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController82,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 9'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController9,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController91,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController92,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 10'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController10,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController101,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController102,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),



],
),
ListView(
children: [
ExpansionTile(
title: Text('4'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring1controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('4.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring2controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring3controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('5.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring4controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring5controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring6controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('7'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring7controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('7.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring8controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring9controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring10controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring11controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring12controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('10'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring13controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('10.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring14controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('11'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring15controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('11.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring16controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('12'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring17controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('12.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring18controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('13'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring19controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('13.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring20controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('14'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring21controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('14.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring22controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('15'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring23controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),

],
),
ListView(
children: [
ExpansionTile(
title: Text('0-3 mth'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe1controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('3-6 mth'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe2controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6 mth'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe3controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9 mth'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe4controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9-12 mth'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe5controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('12-18 mth'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe6controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('18-24 mth'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe7controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),




],
),

],
onChange: (index) => print(index),

),
),
),

],
);

},
);
}

else if(dropdownValue=='Kids-Boys'||dropdownValue=='Kids-Girls') {
return
showModalBottomSheet(
context: context,
builder: (BuildContext context) {
return
Column(
children: [


Expanded(
child: Container(
// color: kPrimaryColor,
child: ContainedTabBarView(
tabs: [
Text('Clothing',style:TextStyle(color:Colors.black)),
Text('Made-to-order',style:TextStyle(color:Colors.black)),
Text('Free size',style:TextStyle(color:Colors.black)),
Text('Custom size(upto 10)',style:TextStyle(color:Colors.black)),
Text('Ring(US/Canada)',style:TextStyle(color:Colors.black)),

Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
],
views: [
ListView(


children: [

ExpansionTile(
title: Text('2'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xxxscontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('3-4'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xxscontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('4-5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xscontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('5-6'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: scontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6-7'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: mcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('7-8'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: lcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8-9'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xlcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9-10'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xxlcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('10-11'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xxxlcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('11-12'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: fourxlcontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),


],
),
ListView(


children: [


ExpansionTile(
title: Text('Made-to-order'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: mtocontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),


],
),
ListView(


children: [


ExpansionTile(
title: Text('Free size'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: freesizecontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),


],
),
ListView(


children: [


ExpansionTile(
title: Text('Custom size 1'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController1,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController11,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController12,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 2'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController2,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController21,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController22,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 3'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController3,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController31,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController32,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 4'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController4,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController41,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController42,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 5'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController5,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController51,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController52,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 6'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController6,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController61,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController62,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 7'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController7,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController71,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController72,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 8'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController8,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController81,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController82,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 9'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController9,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController91,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController92,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 10'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController10,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController101,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController102,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),



],
),
ListView(
children: [
ExpansionTile(
title: Text('4'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring1controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('4.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring2controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring3controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('5.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring4controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring5controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring6controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('7'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring7controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('7.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring8controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring9controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring10controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring11controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring12controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('10'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring13controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('10.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring14controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('11'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring15controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('11.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring16controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('12'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring17controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('12.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring18controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('13'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring19controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('13.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring20controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('14'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring21controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('14.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring22controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('15'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring23controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),

],
),
ListView(
children: [
ExpansionTile(
title: Text('2 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe1controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('2 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe2controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('3 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe3controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('3 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe4controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('4 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe5controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('5 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe6controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe7controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('7 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe8controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe9controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe10controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe11controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('10 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe12controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('11 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe13controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('12 Y'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe14controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),




],
),

],
onChange: (index) => print(index),

),
),
),

],
);

},
);
}

else if(dropdownValue=='Teen-Boys'||dropdownValue=='Teen-Girls') {
return
showModalBottomSheet(
context: context,
builder: (BuildContext context) {
return
Column(
children: [

Expanded(
child: Container(
// color: kPrimaryColor,
child: ContainedTabBarView(
tabs: [
Text('Clothing',style:TextStyle(color:Colors.black)),
Text('Made-to-order',style:TextStyle(color:Colors.black)),
Text('Free size',style:TextStyle(color:Colors.black)),
Text('Custom size(upto 10)',style:TextStyle(color:Colors.black)),
Text('Ring(US/Canada)',style:TextStyle(color:Colors.black)),

Text('Shoes(US/Canada)',style:TextStyle(color:Colors.black))
],
views: [
ListView(


children: [

ExpansionTile(
title: Text('13'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xxxscontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('14'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xxscontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('15'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: xscontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('16'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: scontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),


],
),
ListView(


children: [


ExpansionTile(
title: Text('Made-to-order'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: mtocontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),


],
),
ListView(


children: [


ExpansionTile(
title: Text('Free size'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: freesizecontroller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),


],
),
ListView(


children: [


ExpansionTile(
title: Text('Custom size 1'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController1,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController11,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController12,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 2'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController2,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController21,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController22,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 3'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController3,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController31,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController32,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 4'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController4,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController41,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController42,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 5'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController5,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController51,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController52,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 6'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController6,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController61,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController62,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 7'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController7,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController71,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController72,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 8'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController8,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController81,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController82,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 9'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController9,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController91,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController92,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),
ExpansionTile(
title: Text('Custom size 10'),
maintainState: true,
children: [

Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

maxLines: 1,
controller: customController10,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Title',
hintText: '117 cm'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController101,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Additional price(optional)',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: customController102,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),

],
),



],
),
ListView(
children: [
ExpansionTile(
title: Text('4'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring1controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('4.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring2controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring3controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('5.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring4controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring5controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('6.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring6controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('7'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring7controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('7.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring8controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring9controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('8.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring10controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring11controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('9.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring12controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('10'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring13controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('10.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring14controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('11'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring15controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('11.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring16controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('12'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring17controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('12.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring18controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('13'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring19controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('13.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring20controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('14'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring21controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('14.5'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring22controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('15'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Ring23controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),

],
),
ListView(
children: [
ExpansionTile(
title: Text('13'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe1controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('14'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe2controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('15'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe3controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),
ExpansionTile(
title: Text('16'),
maintainState: true,
children: [
Container(
margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
child: TextField(

keyboardType: TextInputType.number,
maxLines: 1,
controller: Shoe4controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderSide: BorderSide(color: kGrey)),
labelText: 'Quantity in inventory',
hintText: '0'
),
textAlign: TextAlign.center,
),
),
],
),






],
),

],
onChange: (index) => print(index),

),
),
),

],
);

},
);
}
