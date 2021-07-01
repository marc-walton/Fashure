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