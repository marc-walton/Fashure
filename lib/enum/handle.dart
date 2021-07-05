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

else  if (currentUser.country == 'UK'){
productsRef
    .doc(widget.currentUser.id)
    .collection("userProducts")
    .doc(prodId)
    .set({

"indian":indian,
"worldship":worldship,
"freeworldship":freeworldship,
"freeship":freeship,
"shipment": shipcontroller.text,
"prodId": prodId,
"ownerId": widget.currentUser.id,
"username": widget.currentUser.displayName,
"photoUrl": widget.currentUser.photoUrl,
"displayName": widget.currentUser.displayName,
"shopmediaUrl": imageUrls,
"Category": value,
// "type":type,
"Gender": dropdownValue,
"details": detailsController.text,
"productname": productnameController.text,
"usd": gbptousd.toString(),
"gbp": userprice.toString(),
"eur": gbptoeur.toString(),
"inr": gbptoinr.toString(),

"timestamp": timestamp,
"color": Color,
"composition": compositionController.text,
"washandcare": washandcareController.text,
"sizeandfit": sizeandfitController.text,
"xxxsQuantity": int.tryParse(xxxscontroller.text) ?? 0,
"xxsQuantity": int.tryParse(xxscontroller.text) ?? 0,
"xsQuantity":  int.tryParse(xscontroller.text )?? 0,
"sQuantity": int.tryParse(scontroller.text) ?? 0,

"mtoQuantity":  int.tryParse(mtocontroller.text) ?? 0,
"freesizeQuantity":   int.tryParse(freesizecontroller.text) ?? 0,


"mQuantity":  int.tryParse(mcontroller.text) ?? 0,
"lQuantity":  int.tryParse(lcontroller.text) ?? 0,
"xlQuantity":  int.tryParse(xlcontroller.text) ?? 0,
"xxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"xxxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"fourxlQuantity":  int.tryParse(fourxlcontroller.text) ?? 0,
"fivexlQuantity":  int.tryParse(fivexlcontroller.text) ?? 0,
"sixxlQuantity":  int.tryParse(sixxlcontroller.text) ?? 0,
"sevenxlQuantity":  int.tryParse(sevenxlcontroller.text) ?? 0,
"eightxlQuantity":  int.tryParse(eightxlcontroller.text) ?? 0,
"Shoe1":   int.tryParse(Shoe1controller.text) ?? 0,
"Shoe2":   int.tryParse(Shoe2controller.text) ?? 0,
"Shoe3":   int.tryParse(Shoe3controller.text) ?? 0,
"Shoe4":   int.tryParse(Shoe4controller.text) ?? 0,
"Shoe5":   int.tryParse(Shoe5controller.text) ?? 0,
"Shoe6":   int.tryParse(Shoe6controller.text) ?? 0,
"Shoe7":   int.tryParse(Shoe7controller.text) ?? 0,
"Shoe8":   int.tryParse(Shoe8controller.text) ?? 0,
"Shoe9":   int.tryParse(Shoe9controller.text) ?? 0,
"Shoe10":   int.tryParse(Shoe10controller.text) ?? 0,
"Shoe11":   int.tryParse(Shoe11controller.text) ?? 0,
"Shoe12":   int.tryParse(Shoe12controller.text) ?? 0,
"Shoe13":   int.tryParse(Shoe13controller.text) ?? 0,
"Shoe14":   int.tryParse(Shoe14controller.text) ?? 0,
"Shoe15":  int.tryParse(Shoe15controller.text) ?? 0,
"Shoe16":  int.tryParse(Shoe16controller.text) ?? 0,
"Shoe17":  int.tryParse(Shoe17controller.text) ?? 0,
"Shoe18":  int.tryParse(Shoe18controller.text) ?? 0,
"Shoe19":  int.tryParse(Shoe19controller.text) ?? 0,
"Shoe20":  int.tryParse(Shoe20controller.text) ?? 0,
"Shoe21":  int.tryParse(Shoe21controller.text) ?? 0,
"Ring1":   int.tryParse(Ring1controller.text) ?? 0,
"Ring2":   int.tryParse(Ring2controller.text) ?? 0,
"Ring3":   int.tryParse(Ring3controller.text) ?? 0,
"Ring4":   int.tryParse(Ring4controller.text) ?? 0,
"Ring5":   int.tryParse(Ring5controller.text) ?? 0,
"Ring6":   int.tryParse(Ring6controller.text) ?? 0,
"Ring7":   int.tryParse(Ring7controller.text) ?? 0,
"Ring8":   int.tryParse(Ring8controller.text) ?? 0,
"Ring9":   int.tryParse(Ring9controller.text) ?? 0,
"Ring10":   int.tryParse(Ring10controller.text) ?? 0,
"Ring11":   int.tryParse(Ring11controller.text) ?? 0,
"Ring12":   int.tryParse(Ring12controller.text) ?? 0,
"Ring13":   int.tryParse(Ring13controller.text) ?? 0,
"Ring14":   int.tryParse(Ring14controller.text) ?? 0,
"Ring15":  int.tryParse(Ring15controller.text) ?? 0,
"Ring16":  int.tryParse(Ring16controller.text) ?? 0,
"Ring17":  int.tryParse(Ring17controller.text) ?? 0,
"Ring18":  int.tryParse(Ring18controller.text) ?? 0,
"Ring19":  int.tryParse(Ring19controller.text) ?? 0,
"Ring20":  int.tryParse(Ring20controller.text) ?? 0,
"Ring21":  int.tryParse(Ring21controller.text) ?? 0,
"Ring22":  int.tryParse(Ring22controller.text) ?? 0,
"Ring23":  int.tryParse(Ring23controller.text) ?? 0,
"custom1":  customController1.text ?? "",
"custom2":  customController2.text ?? "",
"custom3":  customController3.text ?? "",
"custom4":  customController4.text ?? "",
"custom5":  customController5.text ?? "",
"custom6":  customController6.text ?? "",
"custom7":  customController7.text ?? "",
"custom8":  customController8.text ?? "",
"custom9":  customController9.text ?? "",
"custom10":  customController10.text ?? "",
"custom12":  int.tryParse(customController12.text) ?? 0,
"custom22":  int.tryParse(customController22.text) ?? 0,
"custom32":  int.tryParse(customController32.text) ?? 0,
"custom42":  int.tryParse(customController42.text) ?? 0,
"custom52":  int.tryParse(customController52.text) ?? 0,
"custom62":  int.tryParse(customController62.text) ?? 0,
"custom72":  int.tryParse(customController72.text) ?? 0,
"custom82":  int.tryParse(customController82.text) ?? 0,
"custom92":  int.tryParse(customController92.text) ?? 0,
"custom102":  int.tryParse(customController102.text) ??0,
"custom11usd": gbptousd1.toString() ?? "0.0",
"custom11gbp":userprice1.toString() ?? "0.0",
"custom11eur": gbptoeur1.toString() ?? "0.0",
"custom11inr": gbptoinr1.toString() ?? "0.0",
"custom21usd": gbptousd2.toString() ?? "0.0",
"custom21gbp": userprice2.toString() ?? "0.0",
"custom21eur":gbptoeur2.toString() ?? "0.0",
"custom21inr": gbptoinr2.toString() ?? "0.0",
"custom31usd": gbptousd3.toString() ?? "0.0",
"custom31gbp": userprice3.toString() ?? "0.0",
"custom31eur": gbptoeur3.toString() ?? "0.0",
"custom31inr": gbptoinr3.toString() ?? "0.0",
"custom41usd": gbptousd4.toString() ?? "0.0",
"custom41gbp": userprice4.toString() ?? "0.0",
"custom41eur": gbptoeur4.toString() ?? "0.0",
"custom41inr": gbptoinr4.toString() ?? "0.0",
"custom51usd": gbptousd5.toString() ?? "0.0",
"custom51gbp": userprice5.toString() ?? "0.0",
"custom51eur": gbptoeur5.toString() ?? "0.0",
"custom51inr": gbptoinr5.toString() ?? "0.0",
"custom61usd": gbptousd6.toString() ?? "0.0",
"custom61gbp": userprice6.toString() ?? "0.0",
"custom61eur": gbptoeur6.toString() ?? "0.0",
"custom61inr": gbptoinr6.toString() ?? "0.0",
"custom71usd": gbptousd7.toString() ?? "0.0",
"custom71gbp": userprice7.toString() ?? "0.0",
"custom71eur": gbptoeur7.toString() ?? "0.0",
"custom71inr": gbptoinr7.toString() ?? "0.0",
"custom81usd": gbptousd8.toString() ?? "0.0",
"custom81gbp": userprice8.toString() ?? "0.0",
"custom81eur": gbptoeur8.toString() ?? "0.0",
"custom81inr": gbptoinr8.toString() ?? "0.0",
"custom91usd": gbptousd9.toString() ?? "0.0",
"custom91gbp": userprice9.toString() ?? "0.0",
"custom91eur": gbptoeur9.toString() ?? "0.0",
"custom91inr": gbptoinr9.toString() ?? "0.0",
"custom101usd": gbptousd10.toString() ?? "0.0",
"custom101gbp": userprice10.toString() ?? "0.0",
"custom101eur": gbptoeur10.toString() ?? "0.0",
"custom101inr": gbptoinr10.toString() ?? "0.0",
"shipcostusd": gbptousd11.toString() ?? "0.0",
"shipcostgbp": userprice11.toString() ?? "0.0",
"shipcosteur": gbptoeur11.toString() ?? "0.0",
"shipcostinr": gbptoinr11.toString() ?? "0.0",
"shipcostinternusd": gbptousd12.toString() ?? "0.0",
"shipcostinterngbp": userprice12.toString() ?? "0.0",
"shipcostinterneur": gbptoeur12.toString() ?? "0.0",
"shipcostinterninr": gbptoinr12.toString() ?? "0.0",

"processfrom":  int.tryParse(durationfromp.text) ?? 0,
"processto":  int.tryParse(durationto.text) ?? 0,
"shipfrom":  int.tryParse(durationfrom.text) ?? 0,
"shipto":  int.tryParse(durationto.text) ?? 0,
"shipinterfrom":  int.tryParse(durationfromw.text) ?? 0,
"shipinterto":  int.tryParse(durationtow.text) ?? 0,

"likes": {},
});



setState(() {
file = null;
isUploading = false;
});
}

else if (currentUser.country == 'USA'){
productsRef
    .doc(widget.currentUser.id)
    .collection("userProducts")
    .doc(prodId)
    .set({

"indian":indian,
"worldship":worldship,
"freeworldship":freeworldship,
"freeship":freeship,
"shipment": shipcontroller.text,
"prodId": prodId,
"ownerId": widget.currentUser.id,
"username": widget.currentUser.displayName,
"photoUrl": widget.currentUser.photoUrl,
"displayName": widget.currentUser.displayName,
"shopmediaUrl": imageUrls,
"Category": value,
// "type":type,
"Gender": dropdownValue,
"details": detailsController.text,
"productname": productnameController.text,
"usd":userprice.toString(),
"gbp": usdtogbp.toString(),
"eur": usdtoeur.toString(),
"inr": usdtoinr.toString(),

"timestamp": timestamp,
"color": Color,
"composition": compositionController.text,
"washandcare": washandcareController.text,
"sizeandfit": sizeandfitController.text,
"xxxsQuantity": int.tryParse(xxxscontroller.text) ?? 0,
"xxsQuantity": int.tryParse(xxscontroller.text) ?? 0,
"xsQuantity":  int.tryParse(xscontroller.text )?? 0,
"sQuantity": int.tryParse(scontroller.text) ?? 0,

"mtoQuantity":  int.tryParse(mtocontroller.text) ?? 0,
"freesizeQuantity":   int.tryParse(freesizecontroller.text) ?? 0,


"mQuantity":  int.tryParse(mcontroller.text) ?? 0,
"lQuantity":  int.tryParse(lcontroller.text) ?? 0,
"xlQuantity":  int.tryParse(xlcontroller.text) ?? 0,
"xxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"xxxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"fourxlQuantity":  int.tryParse(fourxlcontroller.text) ?? 0,
"fivexlQuantity":  int.tryParse(fivexlcontroller.text) ?? 0,
"sixxlQuantity":  int.tryParse(sixxlcontroller.text) ?? 0,
"sevenxlQuantity":  int.tryParse(sevenxlcontroller.text) ?? 0,
"eightxlQuantity":  int.tryParse(eightxlcontroller.text) ?? 0,
"Shoe1":   int.tryParse(Shoe1controller.text) ?? 0,
"Shoe2":   int.tryParse(Shoe2controller.text) ?? 0,
"Shoe3":   int.tryParse(Shoe3controller.text) ?? 0,
"Shoe4":   int.tryParse(Shoe4controller.text) ?? 0,
"Shoe5":   int.tryParse(Shoe5controller.text) ?? 0,
"Shoe6":   int.tryParse(Shoe6controller.text) ?? 0,
"Shoe7":   int.tryParse(Shoe7controller.text) ?? 0,
"Shoe8":   int.tryParse(Shoe8controller.text) ?? 0,
"Shoe9":   int.tryParse(Shoe9controller.text) ?? 0,
"Shoe10":   int.tryParse(Shoe10controller.text) ?? 0,
"Shoe11":   int.tryParse(Shoe11controller.text) ?? 0,
"Shoe12":   int.tryParse(Shoe12controller.text) ?? 0,
"Shoe13":   int.tryParse(Shoe13controller.text) ?? 0,
"Shoe14":   int.tryParse(Shoe14controller.text) ?? 0,
"Shoe15":  int.tryParse(Shoe15controller.text) ?? 0,
"Shoe16":  int.tryParse(Shoe16controller.text) ?? 0,
"Shoe17":  int.tryParse(Shoe17controller.text) ?? 0,
"Shoe18":  int.tryParse(Shoe18controller.text) ?? 0,
"Shoe19":  int.tryParse(Shoe19controller.text) ?? 0,
"Shoe20":  int.tryParse(Shoe20controller.text) ?? 0,
"Shoe21":  int.tryParse(Shoe21controller.text) ?? 0,
"Ring1":   int.tryParse(Ring1controller.text) ?? 0,
"Ring2":   int.tryParse(Ring2controller.text) ?? 0,
"Ring3":   int.tryParse(Ring3controller.text) ?? 0,
"Ring4":   int.tryParse(Ring4controller.text) ?? 0,
"Ring5":   int.tryParse(Ring5controller.text) ?? 0,
"Ring6":   int.tryParse(Ring6controller.text) ?? 0,
"Ring7":   int.tryParse(Ring7controller.text) ?? 0,
"Ring8":   int.tryParse(Ring8controller.text) ?? 0,
"Ring9":   int.tryParse(Ring9controller.text) ?? 0,
"Ring10":   int.tryParse(Ring10controller.text) ?? 0,
"Ring11":   int.tryParse(Ring11controller.text) ?? 0,
"Ring12":   int.tryParse(Ring12controller.text) ?? 0,
"Ring13":   int.tryParse(Ring13controller.text) ?? 0,
"Ring14":   int.tryParse(Ring14controller.text) ?? 0,
"Ring15":  int.tryParse(Ring15controller.text) ?? 0,
"Ring16":  int.tryParse(Ring16controller.text) ?? 0,
"Ring17":  int.tryParse(Ring17controller.text) ?? 0,
"Ring18":  int.tryParse(Ring18controller.text) ?? 0,
"Ring19":  int.tryParse(Ring19controller.text) ?? 0,
"Ring20":  int.tryParse(Ring20controller.text) ?? 0,
"Ring21":  int.tryParse(Ring21controller.text) ?? 0,
"Ring22":  int.tryParse(Ring22controller.text) ?? 0,
"Ring23":  int.tryParse(Ring23controller.text) ?? 0,
"custom1":  customController1.text ?? "",
"custom2":  customController2.text ?? "",
"custom3":  customController3.text ?? "",
"custom4":  customController4.text ?? "",
"custom5":  customController5.text ?? "",
"custom6":  customController6.text ?? "",
"custom7":  customController7.text ?? "",
"custom8":  customController8.text ?? "",
"custom9":  customController9.text ?? "",
"custom10":  customController10.text ?? "",
"custom12":  int.tryParse(customController12.text) ?? 0,
"custom22":  int.tryParse(customController22.text) ?? 0,
"custom32":  int.tryParse(customController32.text) ?? 0,
"custom42":  int.tryParse(customController42.text) ?? 0,
"custom52":  int.tryParse(customController52.text) ?? 0,
"custom62":  int.tryParse(customController62.text) ?? 0,
"custom72":  int.tryParse(customController72.text) ?? 0,
"custom82":  int.tryParse(customController82.text) ?? 0,
"custom92":  int.tryParse(customController92.text) ?? 0,
"custom102":  int.tryParse(customController102.text) ??0,
"custom11usd":userprice1.toString() ?? "0.0",
"custom11gbp": usdtogbp1.toString() ?? "0.0",
"custom11eur": usdtoeur1.toString() ?? "0.0",
"custom11inr": usdtoinr1.toString() ?? "0.0",
"custom21usd":userprice2.toString() ?? "0.0",
"custom21gbp": usdtogbp2.toString() ?? "0.0",
"custom21eur": usdtoeur2.toString() ?? "0.0",
"custom21inr": usdtoinr2.toString() ?? "0.0",
"custom31usd":userprice3.toString() ?? "0.0",
"custom31gbp": usdtogbp3.toString() ?? "0.0",
"custom31eur": usdtoeur3.toString() ?? "0.0",
"custom31inr": usdtoinr3.toString() ?? "0.0",
"custom41usd":userprice4.toString() ?? "0.0",
"custom41gbp": usdtogbp4.toString() ?? "0.0",
"custom41eur": usdtoeur4.toString() ?? "0.0",
"custom41inr": usdtoinr4.toString() ?? "0.0",
"custom51usd":userprice5.toString() ?? "0.0",
"custom51gbp": usdtogbp5.toString() ?? "0.0",
"custom51eur": usdtoeur5.toString() ?? "0.0",
"custom51inr": usdtoinr5.toString() ?? "0.0",
"custom61usd":userprice6.toString() ?? "0.0",
"custom61gbp": usdtogbp6.toString() ?? "0.0",
"custom61eur": usdtoeur6.toString() ?? "0.0",
"custom61inr": usdtoinr6.toString() ?? "0.0",
"custom71usd":userprice7.toString() ?? "0.0",
"custom71gbp": usdtogbp7.toString() ?? "0.0",
"custom71eur": usdtoeur7.toString() ?? "0.0",
"custom71inr": usdtoinr7.toString() ?? "0.0",
"custom81usd":userprice8.toString() ?? "0.0",
"custom81gbp": usdtogbp8.toString() ?? "0.0",
"custom81eur": usdtoeur8.toString() ?? "0.0",
"custom81inr": usdtoinr8.toString() ?? "0.0",
"custom91usd":userprice9.toString() ?? "0.0",
"custom91gbp": usdtogbp9.toString() ?? "0.0",
"custom91eur": usdtoeur9.toString() ?? "0.0",
"custom91inr": usdtoinr9.toString() ?? "0.0",
"custom101usd":userprice10.toString() ?? "0.0",
"custom101gbp": usdtogbp10.toString() ?? "0.0",
"custom101eur": usdtoeur10.toString() ?? "0.0",
"custom101inr": usdtoinr10.toString() ?? "0.0",
"shipcostusd":userprice11.toString() ?? "0.0",
"shipcostgbp": usdtogbp11.toString() ?? "0.0",
"shipcosteur": usdtoeur11.toString() ?? "0.0",
"shipcostinr": usdtoinr11.toString() ?? "0.0",
"shipcostinternusd":userprice12.toString() ?? "0.0",
"shipcostinterngbp": usdtogbp12.toString() ?? "0.0",
"shipcostinterneur": usdtoeur12.toString() ?? "0.0",
"shipcostinterninr": usdtoinr12.toString() ?? "0.0",

"processfrom":  int.tryParse(durationfromp.text) ?? 0,
"processto":  int.tryParse(durationto.text) ?? 0,
"shipfrom":  int.tryParse(durationfrom.text) ?? 0,
"shipto":  int.tryParse(durationto.text) ?? 0,
"shipinterfrom":  int.tryParse(durationfromw.text) ?? 0,
"shipinterto":  int.tryParse(durationtow.text) ?? 0,

"likes": {},
});



setState(() {
file = null;
isUploading = false;
});
}

else if (currentUser.country == 'India'){
productsRef
    .doc(widget.currentUser.id)
    .collection("userProducts")
    .doc(prodId)
    .set({

"indian":indian,
"worldship":worldship,
"freeworldship":freeworldship,
"freeship":freeship,
"shipment": shipcontroller.text,
"prodId": prodId,
"ownerId": widget.currentUser.id,
"username": widget.currentUser.displayName,
"photoUrl": widget.currentUser.photoUrl,
"displayName": widget.currentUser.displayName,
"shopmediaUrl": imageUrls,
"Category": value,
// "type":type,
"Gender": dropdownValue,
"details": detailsController.text,
"productname": productnameController.text,
"usd": inrtousd.toString(),
"gbp": inrtogbp.toString(),
"eur": inrtoeur.toString(),
"inr": userprice.toString(),

"timestamp": timestamp,
"color": Color,
"composition": compositionController.text,
"washandcare": washandcareController.text,
"sizeandfit": sizeandfitController.text,
"xxxsQuantity": int.tryParse(xxxscontroller.text) ?? 0,
"xxsQuantity": int.tryParse(xxscontroller.text) ?? 0,
"xsQuantity":  int.tryParse(xscontroller.text )?? 0,
"sQuantity": int.tryParse(scontroller.text) ?? 0,

"mtoQuantity":  int.tryParse(mtocontroller.text) ?? 0,
"freesizeQuantity":   int.tryParse(freesizecontroller.text) ?? 0,


"mQuantity":  int.tryParse(mcontroller.text) ?? 0,
"lQuantity":  int.tryParse(lcontroller.text) ?? 0,
"xlQuantity":  int.tryParse(xlcontroller.text) ?? 0,
"xxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"xxxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"fourxlQuantity":  int.tryParse(fourxlcontroller.text) ?? 0,
"fivexlQuantity":  int.tryParse(fivexlcontroller.text) ?? 0,
"sixxlQuantity":  int.tryParse(sixxlcontroller.text) ?? 0,
"sevenxlQuantity":  int.tryParse(sevenxlcontroller.text) ?? 0,
"eightxlQuantity":  int.tryParse(eightxlcontroller.text) ?? 0,
"Shoe1":   int.tryParse(Shoe1controller.text) ?? 0,
"Shoe2":   int.tryParse(Shoe2controller.text) ?? 0,
"Shoe3":   int.tryParse(Shoe3controller.text) ?? 0,
"Shoe4":   int.tryParse(Shoe4controller.text) ?? 0,
"Shoe5":   int.tryParse(Shoe5controller.text) ?? 0,
"Shoe6":   int.tryParse(Shoe6controller.text) ?? 0,
"Shoe7":   int.tryParse(Shoe7controller.text) ?? 0,
"Shoe8":   int.tryParse(Shoe8controller.text) ?? 0,
"Shoe9":   int.tryParse(Shoe9controller.text) ?? 0,
"Shoe10":   int.tryParse(Shoe10controller.text) ?? 0,
"Shoe11":   int.tryParse(Shoe11controller.text) ?? 0,
"Shoe12":   int.tryParse(Shoe12controller.text) ?? 0,
"Shoe13":   int.tryParse(Shoe13controller.text) ?? 0,
"Shoe14":   int.tryParse(Shoe14controller.text) ?? 0,
"Shoe15":  int.tryParse(Shoe15controller.text) ?? 0,
"Shoe16":  int.tryParse(Shoe16controller.text) ?? 0,
"Shoe17":  int.tryParse(Shoe17controller.text) ?? 0,
"Shoe18":  int.tryParse(Shoe18controller.text) ?? 0,
"Shoe19":  int.tryParse(Shoe19controller.text) ?? 0,
"Shoe20":  int.tryParse(Shoe20controller.text) ?? 0,
"Shoe21":  int.tryParse(Shoe21controller.text) ?? 0,
"Ring1":   int.tryParse(Ring1controller.text) ?? 0,
"Ring2":   int.tryParse(Ring2controller.text) ?? 0,
"Ring3":   int.tryParse(Ring3controller.text) ?? 0,
"Ring4":   int.tryParse(Ring4controller.text) ?? 0,
"Ring5":   int.tryParse(Ring5controller.text) ?? 0,
"Ring6":   int.tryParse(Ring6controller.text) ?? 0,
"Ring7":   int.tryParse(Ring7controller.text) ?? 0,
"Ring8":   int.tryParse(Ring8controller.text) ?? 0,
"Ring9":   int.tryParse(Ring9controller.text) ?? 0,
"Ring10":   int.tryParse(Ring10controller.text) ?? 0,
"Ring11":   int.tryParse(Ring11controller.text) ?? 0,
"Ring12":   int.tryParse(Ring12controller.text) ?? 0,
"Ring13":   int.tryParse(Ring13controller.text) ?? 0,
"Ring14":   int.tryParse(Ring14controller.text) ?? 0,
"Ring15":  int.tryParse(Ring15controller.text) ?? 0,
"Ring16":  int.tryParse(Ring16controller.text) ?? 0,
"Ring17":  int.tryParse(Ring17controller.text) ?? 0,
"Ring18":  int.tryParse(Ring18controller.text) ?? 0,
"Ring19":  int.tryParse(Ring19controller.text) ?? 0,
"Ring20":  int.tryParse(Ring20controller.text) ?? 0,
"Ring21":  int.tryParse(Ring21controller.text) ?? 0,
"Ring22":  int.tryParse(Ring22controller.text) ?? 0,
"Ring23":  int.tryParse(Ring23controller.text) ?? 0,
"custom1":  customController1.text ?? "",
"custom2":  customController2.text ?? "",
"custom3":  customController3.text ?? "",
"custom4":  customController4.text ?? "",
"custom5":  customController5.text ?? "",
"custom6":  customController6.text ?? "",
"custom7":  customController7.text ?? "",
"custom8":  customController8.text ?? "",
"custom9":  customController9.text ?? "",
"custom10":  customController10.text ?? "",
"custom12":  int.tryParse(customController12.text) ?? 0,
"custom22":  int.tryParse(customController22.text) ?? 0,
"custom32":  int.tryParse(customController32.text) ?? 0,
"custom42":  int.tryParse(customController42.text) ?? 0,
"custom52":  int.tryParse(customController52.text) ?? 0,
"custom62":  int.tryParse(customController62.text) ?? 0,
"custom72":  int.tryParse(customController72.text) ?? 0,
"custom82":  int.tryParse(customController82.text) ?? 0,
"custom92":  int.tryParse(customController92.text) ?? 0,
"custom102":  int.tryParse(customController102.text) ??0,
"custom11usd": inrtousd1.toString() ?? "0.0",
"custom11gbp": inrtogbp1.toString() ?? "0.0",
"custom11eur": inrtoeur1.toString() ?? "0.0",
"custom11inr": userprice1.toString() ?? "0.0",
"custom21usd": inrtousd2.toString() ?? "0.0",
"custom21gbp": inrtogbp2.toString() ?? "0.0",
"custom21eur": inrtoeur2.toString() ?? "0.0",
"custom21inr": userprice2.toString() ?? "0.0",
"custom31usd": inrtousd3.toString() ?? "0.0",
"custom31gbp": inrtogbp3.toString() ?? "0.0",
"custom31eur": inrtoeur3.toString() ?? "0.0",
"custom31inr": userprice3.toString() ?? "0.0",
"custom41usd": inrtousd4.toString() ?? "0.0",
"custom41gbp": inrtogbp4.toString() ?? "0.0",
"custom41eur": inrtoeur4.toString() ?? "0.0",
"custom41inr": userprice4.toString() ?? "0.0",
"custom51usd": inrtousd5.toString() ?? "0.0",
"custom51gbp": inrtogbp5.toString() ?? "0.0",
"custom51eur": inrtoeur5.toString() ?? "0.0",
"custom51inr": userprice5.toString() ?? "0.0",
"custom61usd": inrtousd6.toString() ?? "0.0",
"custom61gbp": inrtogbp6.toString() ?? "0.0",
"custom61eur": inrtoeur6.toString() ?? "0.0",
"custom61inr": userprice6.toString() ?? "0.0",
"custom71usd": inrtousd7.toString() ?? "0.0",
"custom71gbp": inrtogbp7.toString() ?? "0.0",
"custom71eur": inrtoeur7.toString() ?? "0.0",
"custom71inr": userprice7.toString() ?? "0.0",
"custom81usd": inrtousd8.toString() ?? "0.0",
"custom81gbp": inrtogbp8.toString() ?? "0.0",
"custom81eur": inrtoeur8.toString() ?? "0.0",
"custom81inr": userprice8.toString() ?? "0.0",
"custom91usd": inrtousd9.toString() ?? "0.0",
"custom91gbp": inrtogbp9.toString() ?? "0.0",
"custom91eur": inrtoeur9.toString() ?? "0.0",
"custom91inr": userprice9.toString() ?? "0.0",
"custom101usd": inrtousd10.toString() ?? "0.0",
"custom101gbp": inrtogbp10.toString() ?? "0.0",
"custom101eur": inrtoeur10.toString() ?? "0.0",
"custom101inr": userprice10.toString() ?? "0.0",
"shipcostusd": inrtousd11.toString() ?? "0.0",
"shipcostgbp": inrtogbp11.toString() ?? "0.0",
"shipcosteur": inrtoeur11.toString() ?? "0.0",
"shipcostinr": userprice11.toString() ?? "0.0",
"shipcostinternusd": inrtousd12.toString() ?? "0.0",
"shipcostinterngbp": inrtogbp12.toString() ?? "0.0",
"shipcostinterneur": inrtoeur12.toString() ?? "0.0",
"shipcostinterninr": userprice12.toString() ?? "0.0",

"processfrom":  int.tryParse(durationfromp.text) ?? 0,
"processto":  int.tryParse(durationto.text) ?? 0,
"shipfrom":  int.tryParse(durationfrom.text) ?? 0,
"shipto":  int.tryParse(durationto.text) ?? 0,
"shipinterfrom":  int.tryParse(durationfromw.text) ?? 0,
"shipinterto":  int.tryParse(durationtow.text) ?? 0,

"likes": {},
});



setState(() {
file = null;
isUploading = false;
});
}
else{
productsRef
    .doc(widget.currentUser.id)
    .collection("userProducts")
    .doc(prodId)
    .set({

"indian":indian,
"worldship":worldship,
"freeworldship":freeworldship,
"freeship":freeship,
"shipment": shipcontroller.text,
"prodId": prodId,
"ownerId": widget.currentUser.id,
"username": widget.currentUser.displayName,
"photoUrl": widget.currentUser.photoUrl,
"displayName": widget.currentUser.displayName,
"shopmediaUrl": imageUrls,
"Category": value,
// "type":type,
"Gender": dropdownValue,
"details": detailsController.text,
"productname": productnameController.text,
"usd":userprice.toString(),
"gbp": usdtogbp.toString(),
"eur": usdtoeur.toString(),
"inr": usdtoinr.toString(),

"timestamp": timestamp,
"color": Color,
"composition": compositionController.text,
"washandcare": washandcareController.text,
"sizeandfit": sizeandfitController.text,
"xxxsQuantity": int.tryParse(xxxscontroller.text) ?? 0,
"xxsQuantity": int.tryParse(xxscontroller.text) ?? 0,
"xsQuantity":  int.tryParse(xscontroller.text )?? 0,
"sQuantity": int.tryParse(scontroller.text) ?? 0,

"mtoQuantity":  int.tryParse(mtocontroller.text) ?? 0,
"freesizeQuantity":   int.tryParse(freesizecontroller.text) ?? 0,


"mQuantity":  int.tryParse(mcontroller.text) ?? 0,
"lQuantity":  int.tryParse(lcontroller.text) ?? 0,
"xlQuantity":  int.tryParse(xlcontroller.text) ?? 0,
"xxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"xxxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"fourxlQuantity":  int.tryParse(fourxlcontroller.text) ?? 0,
"fivexlQuantity":  int.tryParse(fivexlcontroller.text) ?? 0,
"sixxlQuantity":  int.tryParse(sixxlcontroller.text) ?? 0,
"sevenxlQuantity":  int.tryParse(sevenxlcontroller.text) ?? 0,
"eightxlQuantity":  int.tryParse(eightxlcontroller.text) ?? 0,
"Shoe1":   int.tryParse(Shoe1controller.text) ?? 0,
"Shoe2":   int.tryParse(Shoe2controller.text) ?? 0,
"Shoe3":   int.tryParse(Shoe3controller.text) ?? 0,
"Shoe4":   int.tryParse(Shoe4controller.text) ?? 0,
"Shoe5":   int.tryParse(Shoe5controller.text) ?? 0,
"Shoe6":   int.tryParse(Shoe6controller.text) ?? 0,
"Shoe7":   int.tryParse(Shoe7controller.text) ?? 0,
"Shoe8":   int.tryParse(Shoe8controller.text) ?? 0,
"Shoe9":   int.tryParse(Shoe9controller.text) ?? 0,
"Shoe10":   int.tryParse(Shoe10controller.text) ?? 0,
"Shoe11":   int.tryParse(Shoe11controller.text) ?? 0,
"Shoe12":   int.tryParse(Shoe12controller.text) ?? 0,
"Shoe13":   int.tryParse(Shoe13controller.text) ?? 0,
"Shoe14":   int.tryParse(Shoe14controller.text) ?? 0,
"Shoe15":  int.tryParse(Shoe15controller.text) ?? 0,
"Shoe16":  int.tryParse(Shoe16controller.text) ?? 0,
"Shoe17":  int.tryParse(Shoe17controller.text) ?? 0,
"Shoe18":  int.tryParse(Shoe18controller.text) ?? 0,
"Shoe19":  int.tryParse(Shoe19controller.text) ?? 0,
"Shoe20":  int.tryParse(Shoe20controller.text) ?? 0,
"Shoe21":  int.tryParse(Shoe21controller.text) ?? 0,
"Ring1":   int.tryParse(Ring1controller.text) ?? 0,
"Ring2":   int.tryParse(Ring2controller.text) ?? 0,
"Ring3":   int.tryParse(Ring3controller.text) ?? 0,
"Ring4":   int.tryParse(Ring4controller.text) ?? 0,
"Ring5":   int.tryParse(Ring5controller.text) ?? 0,
"Ring6":   int.tryParse(Ring6controller.text) ?? 0,
"Ring7":   int.tryParse(Ring7controller.text) ?? 0,
"Ring8":   int.tryParse(Ring8controller.text) ?? 0,
"Ring9":   int.tryParse(Ring9controller.text) ?? 0,
"Ring10":   int.tryParse(Ring10controller.text) ?? 0,
"Ring11":   int.tryParse(Ring11controller.text) ?? 0,
"Ring12":   int.tryParse(Ring12controller.text) ?? 0,
"Ring13":   int.tryParse(Ring13controller.text) ?? 0,
"Ring14":   int.tryParse(Ring14controller.text) ?? 0,
"Ring15":  int.tryParse(Ring15controller.text) ?? 0,
"Ring16":  int.tryParse(Ring16controller.text) ?? 0,
"Ring17":  int.tryParse(Ring17controller.text) ?? 0,
"Ring18":  int.tryParse(Ring18controller.text) ?? 0,
"Ring19":  int.tryParse(Ring19controller.text) ?? 0,
"Ring20":  int.tryParse(Ring20controller.text) ?? 0,
"Ring21":  int.tryParse(Ring21controller.text) ?? 0,
"Ring22":  int.tryParse(Ring22controller.text) ?? 0,
"Ring23":  int.tryParse(Ring23controller.text) ?? 0,
"custom1":  customController1.text ?? "",
"custom2":  customController2.text ?? "",
"custom3":  customController3.text ?? "",
"custom4":  customController4.text ?? "",
"custom5":  customController5.text ?? "",
"custom6":  customController6.text ?? "",
"custom7":  customController7.text ?? "",
"custom8":  customController8.text ?? "",
"custom9":  customController9.text ?? "",
"custom10":  customController10.text ?? "",
"custom12":  int.tryParse(customController12.text) ?? 0,
"custom22":  int.tryParse(customController22.text) ?? 0,
"custom32":  int.tryParse(customController32.text) ?? 0,
"custom42":  int.tryParse(customController42.text) ?? 0,
"custom52":  int.tryParse(customController52.text) ?? 0,
"custom62":  int.tryParse(customController62.text) ?? 0,
"custom72":  int.tryParse(customController72.text) ?? 0,
"custom82":  int.tryParse(customController82.text) ?? 0,
"custom92":  int.tryParse(customController92.text) ?? 0,
"custom102":  int.tryParse(customController102.text) ??0,
"custom11usd":userprice1.toString() ?? "0.0",
"custom11gbp": usdtogbp1.toString() ?? "0.0",
"custom11eur": usdtoeur1.toString() ?? "0.0",
"custom11inr": usdtoinr1.toString() ?? "0.0",
"custom21usd":userprice2.toString() ?? "0.0",
"custom21gbp": usdtogbp2.toString() ?? "0.0",
"custom21eur": usdtoeur2.toString() ?? "0.0",
"custom21inr": usdtoinr2.toString() ?? "0.0",
"custom31usd":userprice3.toString() ?? "0.0",
"custom31gbp": usdtogbp3.toString() ?? "0.0",
"custom31eur": usdtoeur3.toString() ?? "0.0",
"custom31inr": usdtoinr3.toString() ?? "0.0",
"custom41usd":userprice4.toString() ?? "0.0",
"custom41gbp": usdtogbp4.toString() ?? "0.0",
"custom41eur": usdtoeur4.toString() ?? "0.0",
"custom41inr": usdtoinr4.toString() ?? "0.0",
"custom51usd":userprice5.toString() ?? "0.0",
"custom51gbp": usdtogbp5.toString() ?? "0.0",
"custom51eur": usdtoeur5.toString() ?? "0.0",
"custom51inr": usdtoinr5.toString() ?? "0.0",
"custom61usd":userprice6.toString() ?? "0.0",
"custom61gbp": usdtogbp6.toString() ?? "0.0",
"custom61eur": usdtoeur6.toString() ?? "0.0",
"custom61inr": usdtoinr6.toString() ?? "0.0",
"custom71usd":userprice7.toString() ?? "0.0",
"custom71gbp": usdtogbp7.toString() ?? "0.0",
"custom71eur": usdtoeur7.toString() ?? "0.0",
"custom71inr": usdtoinr7.toString() ?? "0.0",
"custom81usd":userprice8.toString() ?? "0.0",
"custom81gbp": usdtogbp8.toString() ?? "0.0",
"custom81eur": usdtoeur8.toString() ?? "0.0",
"custom81inr": usdtoinr8.toString() ?? "0.0",
"custom91usd":userprice9.toString() ?? "0.0",
"custom91gbp": usdtogbp9.toString() ?? "0.0",
"custom91eur": usdtoeur9.toString() ?? "0.0",
"custom91inr": usdtoinr9.toString() ?? "0.0",
"custom101usd":userprice10.toString() ?? "0.0",
"custom101gbp": usdtogbp10.toString() ?? "0.0",
"custom101eur": usdtoeur10.toString() ?? "0.0",
"custom101inr": usdtoinr10.toString() ?? "0.0",
"shipcostusd":userprice11.toString() ?? "0.0",
"shipcostgbp": usdtogbp11.toString() ?? "0.0",
"shipcosteur": usdtoeur11.toString() ?? "0.0",
"shipcostinr": usdtoinr11.toString() ?? "0.0",
"shipcostinternusd":userprice12.toString() ?? "0.0",
"shipcostinterngbp": usdtogbp12.toString() ?? "0.0",
"shipcostinterneur": usdtoeur12.toString() ?? "0.0",
"shipcostinterninr": usdtoinr12.toString() ?? "0.0",

"processfrom":  int.tryParse(durationfromp.text) ?? 0,
"processto":  int.tryParse(durationto.text) ?? 0,
"shipfrom":  int.tryParse(durationfrom.text) ?? 0,
"shipto":  int.tryParse(durationto.text) ?? 0,
"shipinterfrom":  int.tryParse(durationfromw.text) ?? 0,
"shipinterto":  int.tryParse(durationtow.text) ?? 0,

"likes": {},
});



setState(() {
file = null;
isUploading = false;
});
}
worldship ?     Container(
margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0,8.0),
child: ListTile(
leading: Icon(
Icons.local_shipping,
color: Colors.orange,
size: 35.0,
),
title:Text("Shipping duration to worldwide",  style:TextStyle(color: kText)),

),
):Container(),
SizedBox(height: 8.0,),

worldship ?   Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,

children: [
Expanded(
child: Padding(
padding: const EdgeInsets.all(8.0),

child: TextFormField(
style:TextStyle(color: kText),
keyboardType: TextInputType.number,

controller: durationfromw,
decoration: InputDecoration(
border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

// labelText: 'Between',labelStyle: TextStyle(color: kText),
),
textAlign: TextAlign.center,
validator: (text) {
if (worldship==true && text.isEmpty) {
return 'Shipping duration is empty';
}
return null;
},
),
),
),
Text("-",  style:TextStyle(color: kText)),

Expanded(

child: Padding(
padding: const EdgeInsets.all(8.0),
child: TextFormField(
style:TextStyle(color: kText),
keyboardType: TextInputType.number,
controller: durationtow,
decoration: InputDecoration(
border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

),
textAlign: TextAlign.center,
validator: (text) {
if (worldship==true && text.isEmpty) {
return 'Shipping duration is empty';
}
return null;
},
),
),
),

],
):Container(),
SizedBox( height: 8.0,),
Text('Free shipping',style:TextStyle(color: kText)) ,

SizedBox( height: 8.0,),

worldship ? Row(
mainAxisAlignment:MainAxisAlignment.center,
children: [
Text('No'),
SizedBox( width: 8.0,),

Switch(
value: freeworldship,
onChanged: (value){setState(() {
freeworldship = value;
});},
activeColor: Colors.blue,
activeTrackColor:kPrimaryColor,
),
SizedBox( width: 8.0,),

Text('Yes')
],
):Container(),

worldship && !freeworldship ?   Padding(
padding: const EdgeInsets.all(8.0),
child: TextFormField(
style:TextStyle(color: kText),
keyboardType: TextInputType.number,

controller: shipcostintern,
decoration: InputDecoration(
border: OutlineInputBorder(borderSide: BorderSide(color: kSubtitle)),
enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

labelText: 'Shipping cost',labelStyle: TextStyle(color: kText),
),
textAlign: TextAlign.center,
validator: (text) {
if ( freeworldship==false && text.isEmpty ) {
return 'Shipping cost is empty';
}
return null;
},
),
):Container(),
SizedBox(height: 8.0,),
void INRUSD() async {
  setState(() {
    isUploading = true;
  });

  if (currentUser.country == 'India') {
    var resultUSD = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: priceController.text);
    var resultUSD1 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController11.text ??  0);
    var resultUSD2 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController21.text ??  0);
    var resultUSD3 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController31.text ??  0);
    var resultUSD4 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController41.text ??  0);
    var resultUSD5 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController51.text ??  0);
    var resultUSD6 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController61.text ??  0);
    var resultUSD7 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController71.text ??  0);
    var resultUSD8 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController81.text ??  0);
    var resultUSD9 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController91.text ??  0);
    var resultUSD10 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: customController101.text ??  0);
    var resultUSD11 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: shipcost.text ??  0);
    var resultUSD12 = await Currency.getConversion(
        from: '${currentUser.currencyISO}', to: 'USD', amount: shipcostintern.text ??  0);
    // String date = result.date; // Returns the last updated date

    print("$inrtousd");
    var resultGBP = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: priceController.text);
    var resultGBP1 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController11.text ??  0);
    var resultGBP2 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController21.text ??  0);
    var resultGBP3 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController31.text ??  0);
    var resultGBP4 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController41.text ??  0);
    var resultGBP5 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController51.text ??  0);
    var resultGBP6 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController61.text ??  0);
    var resultGBP7 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController71.text ??  0);
    var resultGBP8 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController81.text ??  0);
    var resultGBP9 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController91.text ??  0);
    var resultGBP10 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: customController101.text ??  0);
    var resultGBP11 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: shipcost.text ??  0);
    var resultGBP12 = await Currency.getConversion(
        from: 'INR', to: 'GBP', amount: shipcostintern.text ??  0);
// Returns the last updated date


    print("$inrtogbp");
    var resultEUR = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount:priceController.text);
    var resultEUR1 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController11.text ??  0);
    var resultEUR2 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController21.text ??  0);
    var resultEUR3 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController31.text ??  0);
    var resultEUR4 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController41.text ??  0);
    var resultEUR5 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController51.text ??  0);
    var resultEUR6 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController61.text ??  0);
    var resultEUR7 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController71.text ??  0);
    var resultEUR8 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController81.text ??  0);
    var resultEUR9 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController91.text ??  0);
    var resultEUR10 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: customController101.text ??  0);
    var resultEUR11 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: shipcost.text ??  0);
    var resultEUR12 = await Currency.getConversion(
        from: 'INR', to: 'EUR', amount: shipcostintern.text ??  0);
    setState(() {

      inrtogbp = resultGBP.rate;
      inrtogbp1 = resultGBP1.rate;
      inrtogbp2 = resultGBP2.rate;
      inrtogbp3 = resultGBP3.rate;
      inrtogbp4 = resultGBP4.rate;
      inrtogbp5 = resultGBP5.rate;
      inrtogbp6 = resultGBP6.rate;
      inrtogbp7 = resultGBP7.rate;
      inrtogbp8 = resultGBP8.rate;
      inrtogbp9 = resultGBP9.rate;
      inrtogbp10 = resultGBP10.rate;
      inrtogbp11 = resultGBP11.rate;
      inrtogbp12 = resultGBP12.rate;

      inrtoeur = resultEUR.rate;
      inrtoeur1 = resultEUR1.rate;
      inrtoeur2 = resultEUR2.rate;
      inrtoeur3 = resultEUR3.rate;
      inrtoeur4 = resultEUR4.rate;
      inrtoeur5 = resultEUR5.rate;
      inrtoeur6 = resultEUR6.rate;
      inrtoeur7 = resultEUR7.rate;
      inrtoeur8 = resultEUR8.rate;
      inrtoeur9 = resultEUR9.rate;
      inrtoeur10 = resultEUR10.rate;
      inrtoeur11 = resultEUR11.rate;
      inrtoeur12 = resultEUR12.rate;

      inrtousd = resultUSD.rate;
      inrtousd1 = resultUSD1.rate;
      inrtousd2 = resultUSD2.rate;
      inrtousd3 = resultUSD3.rate;
      inrtousd4 = resultUSD4.rate;
      inrtousd5 = resultUSD5.rate;
      inrtousd6 = resultUSD6.rate;
      inrtousd7 = resultUSD7.rate;
      inrtousd8 = resultUSD8.rate;
      inrtousd9 = resultUSD9.rate;
      inrtousd10 = resultUSD10.rate;
      inrtousd11 = resultUSD11.rate;
      inrtousd12 = resultUSD12.rate;
      userprice = priceController.text;
      userprice1 = customController11.text;
      userprice2 = customController21.text;
      userprice3 = customController31.text;
      userprice4 = customController41.text;
      userprice5 = customController51.text;
      userprice6 = customController61.text;
      userprice7 = customController71.text;
      userprice8 = customController81.text;
      userprice9 = customController91.text;
      userprice10 = customController101.text;
      userprice11 = shipcost.text;
      userprice12 = shipcostintern.text;

    });



  }
  else if (currentUser.country == 'Europe') {
    var resultUSD = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: priceController.text);
    var resultUSD1 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController11.text  ??  0);
    var resultUSD2 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController21.text  ??  0);
    var resultUSD3 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController31.text  ??  0);
    var resultUSD4 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController41.text  ??  0);
    var resultUSD5 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController51.text  ??  0);
    var resultUSD6 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController61.text  ??  0);
    var resultUSD7 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController71.text  ??  0);
    var resultUSD8 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController81.text  ??  0);
    var resultUSD9 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController91.text  ??  0);
    var resultUSD10 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: customController101.text  ??  0);
    var resultUSD11 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: shipcost.text  ??  0);
    var resultUSD12 = await Currency.getConversion(
        from: 'EUR', to: 'USD', amount: shipcostintern.text  ??  0);
    // String date = result.date; // Returns the last updated date
    setState(() {
      eurtousd = resultUSD.rate;
      eurtousd1 = resultUSD1.rate;
      eurtousd2 = resultUSD2.rate;
      eurtousd3 = resultUSD3.rate;
      eurtousd4 = resultUSD4.rate;
      eurtousd5 = resultUSD5.rate;
      eurtousd6 = resultUSD6.rate;
      eurtousd7 = resultUSD7.rate;
      eurtousd8 = resultUSD8.rate;
      eurtousd9 = resultUSD9.rate;
      eurtousd10 = resultUSD10.rate;
      eurtousd11 = resultUSD11.rate;
      eurtousd12 = resultUSD12.rate;
      userprice = priceController.text;
      userprice1 = customController11.text;
      userprice2 = customController21.text;
      userprice3 = customController31.text;
      userprice4 = customController41.text;
      userprice5 = customController51.text;
      userprice6 = customController61.text;
      userprice7 = customController71.text;
      userprice8 = customController81.text;
      userprice9 = customController91.text;
      userprice10 = customController101.text;
      userprice11 = shipcost.text;
      userprice12 = shipcostintern.text;

    });

    print("$eurtousd");
    var resultGBP = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: priceController.text);
    var resultGBP1 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController11.text  ??  0);
    var resultGBP2 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController21.text  ??  0);
    var resultGBP3 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController31.text  ??  0);
    var resultGBP4 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController41.text  ??  0);
    var resultGBP5 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController51.text  ??  0);
    var resultGBP6 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController61.text  ??  0);
    var resultGBP7 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController71.text  ??  0);
    var resultGBP8 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController81.text  ??  0);
    var resultGBP9 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController91.text  ??  0);
    var resultGBP10 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: customController101.text  ??  0);
    var resultGBP11 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: shipcost.text  ??  0);
    var resultGBP12 = await Currency.getConversion(
        from: 'EUR', to: 'GBP', amount: shipcostintern.text  ??  0);
// Returns the last updated date
    setState(() {
      eurtogbp = resultGBP.rate;
      eurtogbp1 = resultGBP1.rate;

      eurtogbp2 = resultGBP2.rate;

      eurtogbp3 = resultGBP3.rate;

      eurtogbp4 = resultGBP4.rate;

      eurtogbp5 = resultGBP5.rate;

      eurtogbp6 = resultGBP6.rate;

      eurtogbp7 = resultGBP7.rate;

      eurtogbp8 = resultGBP8.rate;

      eurtogbp9 = resultGBP9.rate;

      eurtogbp10 = resultGBP10.rate;

      eurtogbp11 = resultGBP11.rate;
      eurtogbp12 = resultGBP12.rate;

    });

    print("$eurtogbp");

    var resultINR = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: priceController.text );
    var resultINR1 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController11.text  ??  0);
    var resultINR2 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController21.text  ??  0);
    var resultINR3 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController31.text  ??  0);
    var resultINR4 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController41.text  ??  0);
    var resultINR5 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController51.text  ??  0);
    var resultINR6 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController61.text  ??  0);
    var resultINR7 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController71.text  ??  0);
    var resultINR8 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController81.text  ??  0);
    var resultINR9 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController91.text  ??  0);
    var resultINR10 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: customController101.text  ??  0);
    var resultINR11 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: shipcost.text  ??  0);
    var resultINR12 = await Currency.getConversion(
        from: 'EUR', to: 'INR', amount: shipcostintern.text  ??  0);
    setState(() {
      eurtoinr = resultINR.rate;
      eurtoinr1 = resultINR1.rate;

      eurtoinr2 = resultINR2.rate;

      eurtoinr3 = resultINR3.rate;

      eurtoinr4 = resultINR4.rate;

      eurtoinr5 = resultINR5.rate;

      eurtoinr6 = resultINR6.rate;

      eurtoinr7 = resultINR7.rate;

      eurtoinr8 = resultINR8.rate;

      eurtoinr9 = resultINR9.rate;

      eurtoinr10 = resultINR10.rate;

      eurtoinr11 = resultINR11.rate;
      eurtoinr12 = resultINR12.rate;

    });

    print("$eurtoinr");

  }
  else if (currentUser.country == 'UK') {
    var resultUSD = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: priceController.text);
    var resultUSD1 = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: customController11.text  ??  0);
    var resultUSD2 = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: customController21.text  ??  0);
    var resultUSD3 = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: customController31.text  ??  0);
    var resultUSD4 = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: customController41.text  ??  0);
    var resultUSD5 = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: customController51.text  ??  0);
    var resultUSD6 = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: customController61.text  ??  0);
    var resultUSD7 = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: customController71.text  ??  0);
    var resultUSD8 = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: customController81.text  ??  0);
    var resultUSD9 = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: customController91.text  ??  0);
    var resultUSD10 = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: customController101.text  ??  0);
    var resultUSD11 = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: shipcost.text  ??  0);
    var resultUSD12 = await Currency.getConversion(
        from: 'GBP', to: 'USD', amount: shipcostintern.text  ??  0);
    // String date = result.date; // Returns the last updated date
    var resultEUR = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: priceController.text );
    var resultEUR1 = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: customController11.text  ??  0);
    var resultEUR2 = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: customController21.text  ??  0);
    var resultEUR3 = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: customController31.text  ??  0);
    var resultEUR4 = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: customController41.text  ??  0);
    var resultEUR5 = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: customController51.text  ??  0);
    var resultEUR6 = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: customController61.text  ??  0);
    var resultEUR7 = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: customController71.text  ??  0);
    var resultEUR8 = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: customController81.text  ??  0);
    var resultEUR9 = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: customController91.text  ??  0);
    var resultEUR10 = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: customController101.text  ??  0);
    var resultEUR11 = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: shipcost.text  ??  0);
    var resultEUR12 = await Currency.getConversion(
        from: 'GBP', to: 'EUR', amount: shipcostintern.text  ??  0);
    var resultINR = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: priceController.text);
    var resultINR1 = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: customController11.text  ??  0);
    var resultINR2 = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: customController21.text  ??  0);
    var resultINR3 = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: customController31.text  ??  0);
    var resultINR4 = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: customController41.text  ??  0);
    var resultINR5 = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: customController51.text  ??  0);
    var resultINR6 = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: customController61.text  ??  0);
    var resultINR7 = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: customController71.text  ??  0);
    var resultINR8 = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: customController81.text  ??  0);
    var resultINR9 = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: customController91.text  ??  0);
    var resultINR10 = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: customController101.text  ??  0);
    var resultINR11 = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: shipcost.text  ??  0);
    var resultINR12 = await Currency.getConversion(
        from: 'GBP', to: 'INR', amount: shipcostintern.text  ??  0);
    setState(() {
      gbptousd = resultUSD.rate;
      gbptousd1 = resultUSD1.rate;
      gbptousd2 = resultUSD2.rate;
      gbptousd3 = resultUSD3.rate;
      gbptousd4 = resultUSD4.rate;
      gbptousd5 = resultUSD5.rate;
      gbptousd6 = resultUSD6.rate;
      gbptousd7 = resultUSD7.rate;
      gbptousd8 = resultUSD8.rate;
      gbptousd9 = resultUSD9.rate;
      gbptousd10 = resultUSD10.rate;
      gbptousd11 = resultUSD11.rate;
      gbptousd12 = resultUSD12.rate;

      gbptoeur = resultEUR.rate;
      gbptoeur1 = resultEUR1.rate;
      gbptoeur2 = resultEUR2.rate;
      gbptoeur3 = resultEUR3.rate;
      gbptoeur4 = resultEUR4.rate;
      gbptoeur5 = resultEUR5.rate;
      gbptoeur6 = resultEUR6.rate;
      gbptoeur7 = resultEUR7.rate;
      gbptoeur8 = resultEUR8.rate;
      gbptoeur9 = resultEUR9.rate;
      gbptoeur10 = resultEUR10.rate;
      gbptoeur11 = resultEUR11.rate;
      gbptoeur12 = resultEUR12.rate;

      gbptoinr = resultINR.rate;
      gbptoinr1 = resultINR1.rate;
      gbptoinr2 = resultINR2.rate;
      gbptoinr3 = resultINR3.rate;
      gbptoinr4 = resultINR4.rate;
      gbptoinr5 = resultINR5.rate;
      gbptoinr6 = resultINR6.rate;
      gbptoinr7 = resultINR7.rate;
      gbptoinr8 = resultINR8.rate;
      gbptoinr9 = resultINR9.rate;
      gbptoinr10 = resultINR10.rate;
      gbptoinr11 = resultINR11.rate;
      gbptoinr12 = resultINR12.rate;
      userprice = priceController.text;
      userprice1 = customController11.text;
      userprice2 = customController21.text;
      userprice3 = customController31.text;
      userprice4 = customController41.text;
      userprice5 = customController51.text;
      userprice6 = customController61.text;
      userprice7 = customController71.text;
      userprice8 = customController81.text;
      userprice9 = customController91.text;
      userprice10 = customController101.text;
      userprice11 = shipcost.text;
      userprice12 = shipcostintern.text;

      print("$gbptousd");
      print("$userprice");
      print("$usdtoeur");
      print("$gbptocny");
      print("$gbptoinr");


    });

// Returns the last updated date

  }
  else if (currentUser.country == 'USA') {
    var resultGBP = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: priceController.text);
    var resultGBP1 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController11.text ??  0);
    var resultGBP2 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController21.text ??  0);
    var resultGBP3 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController31.text ??  0);
    var resultGBP4 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController41.text ??  0);
    var resultGBP5 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController51.text ??  0);
    var resultGBP6 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController61.text ??  0);
    var resultGBP7 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController71.text ??  0);
    var resultGBP8 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController81.text ??  0);
    var resultGBP9 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController91.text ??  0);
    var resultGBP10 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController101.text ??  0);
    var resultGBP11 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: shipcost.text ??  0);
    var resultGBP12 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: shipcostintern.text ??  0);

    // String date = result.date; // Returns the last updated date

    print("$usdtogbp");
    var resultEUR = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: priceController.text);
    var resultEUR1 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController11.text ??  0);
    var resultEUR2 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController21.text ??  0);
    var resultEUR3 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController31.text ??  0);
    var resultEUR4 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController41.text ??  0);
    var resultEUR5 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController51.text ??  0);
    var resultEUR6 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController61.text ??  0);
    var resultEUR7 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController71.text ??  0);
    var resultEUR8 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController81.text ??  0);
    var resultEUR9 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController91.text ??  0);
    var resultEUR10 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController101.text ??  0);
    var resultEUR11 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: shipcost.text ??  0);
    var resultEUR12 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: shipcostintern.text ??  0);

// Returns the last updated date

    print("$usdtoeur");

    var resultINR = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: priceController.text);
    var resultINR1 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController11.text ??  0);
    var resultINR2 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController21.text ??  0);
    var resultINR3 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController31.text ??  0);
    var resultINR4 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController41.text ??  0);
    var resultINR5 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController51.text ??  0);
    var resultINR6 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController61.text ??  0);
    var resultINR7 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController71.text ??  0);
    var resultINR8 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController81.text ??  0);
    var resultINR9 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController91.text ??  0);
    var resultINR10 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController101.text ??  0);
    var resultINR11 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: shipcost.text ??  0);
    var resultINR12 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: shipcostintern.text ??  0);

    setState(() {

      usdtogbp = resultGBP.rate;
      usdtogbp1 = resultGBP1.rate;
      usdtogbp2 = resultGBP2.rate;
      usdtogbp3 = resultGBP3.rate;
      usdtogbp4 = resultGBP4.rate;
      usdtogbp5 = resultGBP5.rate;
      usdtogbp6 = resultGBP6.rate;
      usdtogbp7 = resultGBP7.rate;
      usdtogbp8 = resultGBP8.rate;
      usdtogbp9 = resultGBP9.rate;
      usdtogbp10 = resultGBP10.rate;
      usdtogbp11 = resultGBP11.rate;
      usdtogbp12 = resultGBP12.rate;

      usdtoeur = resultEUR.rate;
      usdtoeur1 = resultEUR1.rate;
      usdtoeur2 = resultEUR2.rate;
      usdtoeur3 = resultEUR3.rate;
      usdtoeur4 = resultEUR4.rate;
      usdtoeur5 = resultEUR5.rate;
      usdtoeur6 = resultEUR6.rate;
      usdtoeur7 = resultEUR7.rate;
      usdtoeur8 = resultEUR8.rate;
      usdtoeur9 = resultEUR9.rate;
      usdtoeur10 = resultEUR10.rate;
      usdtoeur11 = resultEUR11.rate;
      usdtoeur12 = resultEUR12.rate;

      usdtoinr = resultINR.rate;
      usdtoinr1 = resultINR1.rate;
      usdtoinr2 = resultINR2.rate;
      usdtoinr3 = resultINR3.rate;
      usdtoinr4 = resultINR4.rate;
      usdtoinr5 = resultINR5.rate;
      usdtoinr6 = resultINR6.rate;
      usdtoinr7 = resultINR7.rate;
      usdtoinr8 = resultINR8.rate;
      usdtoinr9 = resultINR9.rate;
      usdtoinr10 = resultINR10.rate;
      usdtoinr11 = resultINR11.rate;
      usdtoinr12 = resultINR12.rate;
      userprice = priceController.text;
      userprice1 = customController11.text;
      userprice2 = customController21.text;
      userprice3 = customController31.text;
      userprice4 = customController41.text;
      userprice5 = customController51.text;
      userprice6 = customController61.text;
      userprice7 = customController71.text;
      userprice8 = customController81.text;
      userprice9 = customController91.text;
      userprice10 = customController101.text;
      userprice11 = shipcost.text;
      userprice12 = shipcostintern.text;


    });


    print("$usdtoinr");
  }
  else  {
    var resultGBP = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: priceController.text);
    var resultGBP1 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController11.text ??  0);
    var resultGBP2 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController21.text ??  0);
    var resultGBP3 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController31.text ??  0);
    var resultGBP4 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController41.text ??  0);
    var resultGBP5 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController51.text ??  0);
    var resultGBP6 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController61.text ??  0);
    var resultGBP7 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController71.text ??  0);
    var resultGBP8 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController81.text ??  0);
    var resultGBP9 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController91.text ??  0);
    var resultGBP10 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: customController101.text ??  0);
    var resultGBP11 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: shipcost.text ??  0);
    var resultGBP12 = await Currency.getConversion(
        from: 'USD', to: 'GBP', amount: shipcostintern.text ??  0);

    // String date = result.date; // Returns the last updated date

    print("$usdtogbp");
    var resultEUR = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: priceController.text);
    var resultEUR1 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController11.text ??  0);
    var resultEUR2 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController21.text ??  0);
    var resultEUR3 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController31.text ??  0);
    var resultEUR4 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController41.text ??  0);
    var resultEUR5 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController51.text ??  0);
    var resultEUR6 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController61.text ??  0);
    var resultEUR7 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController71.text ??  0);
    var resultEUR8 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController81.text ??  0);
    var resultEUR9 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController91.text ??  0);
    var resultEUR10 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: customController101.text ??  0);
    var resultEUR11 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: shipcost.text ??  0);
    var resultEUR12 = await Currency.getConversion(
        from: 'USD', to: 'EUR', amount: shipcostintern.text ??  0);

// Returns the last updated date

    print("$usdtoeur");

    var resultINR = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: priceController.text);
    var resultINR1 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController11.text ??  0);
    var resultINR2 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController21.text ??  0);
    var resultINR3 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController31.text ??  0);
    var resultINR4 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController41.text ??  0);
    var resultINR5 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController51.text ??  0);
    var resultINR6 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController61.text ??  0);
    var resultINR7 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController71.text ??  0);
    var resultINR8 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController81.text ??  0);
    var resultINR9 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController91.text ??  0);
    var resultINR10 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: customController101.text ??  0);
    var resultINR11 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: shipcost.text ??  0);
    var resultINR12 = await Currency.getConversion(
        from: 'USD', to: 'INR', amount: shipcostintern.text ??  0);

    setState(() {

      usdtogbp = resultGBP.rate;
      usdtogbp1 = resultGBP1.rate;
      usdtogbp2 = resultGBP2.rate;
      usdtogbp3 = resultGBP3.rate;
      usdtogbp4 = resultGBP4.rate;
      usdtogbp5 = resultGBP5.rate;
      usdtogbp6 = resultGBP6.rate;
      usdtogbp7 = resultGBP7.rate;
      usdtogbp8 = resultGBP8.rate;
      usdtogbp9 = resultGBP9.rate;
      usdtogbp10 = resultGBP10.rate;
      usdtogbp11 = resultGBP11.rate;
      usdtogbp12 = resultGBP12.rate;

      usdtoeur = resultEUR.rate;
      usdtoeur1 = resultEUR1.rate;
      usdtoeur2 = resultEUR2.rate;
      usdtoeur3 = resultEUR3.rate;
      usdtoeur4 = resultEUR4.rate;
      usdtoeur5 = resultEUR5.rate;
      usdtoeur6 = resultEUR6.rate;
      usdtoeur7 = resultEUR7.rate;
      usdtoeur8 = resultEUR8.rate;
      usdtoeur9 = resultEUR9.rate;
      usdtoeur10 = resultEUR10.rate;
      usdtoeur11 = resultEUR11.rate;
      usdtoeur12 = resultEUR12.rate;

      usdtoinr = resultINR.rate;
      usdtoinr1 = resultINR1.rate;
      usdtoinr2 = resultINR2.rate;
      usdtoinr3 = resultINR3.rate;
      usdtoinr4 = resultINR4.rate;
      usdtoinr5 = resultINR5.rate;
      usdtoinr6 = resultINR6.rate;
      usdtoinr7 = resultINR7.rate;
      usdtoinr8 = resultINR8.rate;
      usdtoinr9 = resultINR9.rate;
      usdtoinr10 = resultINR10.rate;
      usdtoinr11 = resultINR11.rate;
      usdtoinr12 = resultINR12.rate;
      userprice = priceController.text;
      userprice1 = customController11.text;
      userprice2 = customController21.text;
      userprice3 = customController31.text;
      userprice4 = customController41.text;
      userprice5 = customController51.text;
      userprice6 = customController61.text;
      userprice7 = customController71.text;
      userprice8 = customController81.text;
      userprice9 = customController91.text;
      userprice10 = customController101.text;
      userprice11 = shipcost.text;
      userprice12 = shipcostintern.text;


    });


    print("$usdtoinr");
  }
}
if (currentUser.country == 'Europe'){
productsRef
    .doc(widget.currentUser.id)
    .collection("userProducts")
    .doc(prodId)
    .set({

"indian":indian,
"worldship":worldship,
"freeworldship":freeworldship,
"freeship":freeship,

"shipment": shipcontroller.text,
"prodId": prodId,
"ownerId": widget.currentUser.id,
"username": widget.currentUser.displayName,
"photoUrl": widget.currentUser.photoUrl,
"displayName": widget.currentUser.displayName,
"shopmediaUrl": imageUrls,
"Category": value,
// "type":type,
"Gender": dropdownValue,
"details": detailsController.text,
"productname": productnameController.text,
"usd": eurtousd.toString(),
"gbp": eurtogbp.toString(),
"eur": userprice.toString(),
"inr": eurtoinr.toString(),

"timestamp": timestamp,
"composition": compositionController.text,
"washandcare": washandcareController.text,
"sizeandfit": sizeandfitController.text,
"xxxsQuantity": int.tryParse(xxxscontroller.text) ?? 0,
"xxsQuantity": int.tryParse(xxscontroller.text) ?? 0,
"xsQuantity":  int.tryParse(xscontroller.text )?? 0,
"sQuantity": int.tryParse(scontroller.text) ?? 0,

"mtoQuantity":  int.tryParse(mtocontroller.text) ?? 0,
"freesizeQuantity":   int.tryParse(freesizecontroller.text) ?? 0,


"mQuantity":  int.tryParse(mcontroller.text) ?? 0,
"lQuantity":  int.tryParse(lcontroller.text) ?? 0,
"xlQuantity":  int.tryParse(xlcontroller.text) ?? 0,
"xxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"xxxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"fourxlQuantity":  int.tryParse(fourxlcontroller.text) ?? 0,
"fivexlQuantity":  int.tryParse(fivexlcontroller.text) ?? 0,
"sixxlQuantity":  int.tryParse(sixxlcontroller.text) ?? 0,
"sevenxlQuantity":  int.tryParse(sevenxlcontroller.text) ?? 0,
"eightxlQuantity":  int.tryParse(eightxlcontroller.text) ?? 0,
"Shoe1":   int.tryParse(Shoe1controller.text) ?? 0,
"Shoe2":   int.tryParse(Shoe2controller.text) ?? 0,
"Shoe3":   int.tryParse(Shoe3controller.text) ?? 0,
"Shoe4":   int.tryParse(Shoe4controller.text) ?? 0,
"Shoe5":   int.tryParse(Shoe5controller.text) ?? 0,
"Shoe6":   int.tryParse(Shoe6controller.text) ?? 0,
"Shoe7":   int.tryParse(Shoe7controller.text) ?? 0,
"Shoe8":   int.tryParse(Shoe8controller.text) ?? 0,
"Shoe9":   int.tryParse(Shoe9controller.text) ?? 0,
"Shoe10":   int.tryParse(Shoe10controller.text) ?? 0,
"Shoe11":   int.tryParse(Shoe11controller.text) ?? 0,
"Shoe12":   int.tryParse(Shoe12controller.text) ?? 0,
"Shoe13":   int.tryParse(Shoe13controller.text) ?? 0,
"Shoe14":   int.tryParse(Shoe14controller.text) ?? 0,
"Shoe15":  int.tryParse(Shoe15controller.text) ?? 0,
"Shoe16":  int.tryParse(Shoe16controller.text) ?? 0,
"Shoe17":  int.tryParse(Shoe17controller.text) ?? 0,
"Shoe18":  int.tryParse(Shoe18controller.text) ?? 0,
"Shoe19":  int.tryParse(Shoe19controller.text) ?? 0,
"Shoe20":  int.tryParse(Shoe20controller.text) ?? 0,
"Shoe21":  int.tryParse(Shoe21controller.text) ?? 0,
"Ring1":   int.tryParse(Ring1controller.text) ?? 0,
"Ring2":   int.tryParse(Ring2controller.text) ?? 0,
"Ring3":   int.tryParse(Ring3controller.text) ?? 0,
"Ring4":   int.tryParse(Ring4controller.text) ?? 0,
"Ring5":   int.tryParse(Ring5controller.text) ?? 0,
"Ring6":   int.tryParse(Ring6controller.text) ?? 0,
"Ring7":   int.tryParse(Ring7controller.text) ?? 0,
"Ring8":   int.tryParse(Ring8controller.text) ?? 0,
"Ring9":   int.tryParse(Ring9controller.text) ?? 0,
"Ring10":   int.tryParse(Ring10controller.text) ?? 0,
"Ring11":   int.tryParse(Ring11controller.text) ?? 0,
"Ring12":   int.tryParse(Ring12controller.text) ?? 0,
"Ring13":   int.tryParse(Ring13controller.text) ?? 0,
"Ring14":   int.tryParse(Ring14controller.text) ?? 0,
"Ring15":  int.tryParse(Ring15controller.text) ?? 0,
"Ring16":  int.tryParse(Ring16controller.text) ?? 0,
"Ring17":  int.tryParse(Ring17controller.text) ?? 0,
"Ring18":  int.tryParse(Ring18controller.text) ?? 0,
"Ring19":  int.tryParse(Ring19controller.text) ?? 0,
"Ring20":  int.tryParse(Ring20controller.text) ?? 0,
"Ring21":  int.tryParse(Ring21controller.text) ?? 0,
"Ring22":  int.tryParse(Ring22controller.text) ?? 0,
"Ring23":  int.tryParse(Ring23controller.text) ?? 0,
"custom1":  customController1.text ?? "",
"custom2":  customController2.text ?? "",
"custom3":  customController3.text ?? "",
"custom4":  customController4.text ?? "",
"custom5":  customController5.text ?? "",
"custom6":  customController6.text ?? "",
"custom7":  customController7.text ?? "",
"custom8":  customController8.text ?? "",
"custom9":  customController9.text ?? "",
"custom10":  customController10.text ?? "",
"custom12":  int.tryParse(customController12.text) ?? 0,
"custom22":  int.tryParse(customController22.text) ?? 0,
"custom32":  int.tryParse(customController32.text) ?? 0,
"custom42":  int.tryParse(customController42.text) ?? 0,
"custom52":  int.tryParse(customController52.text) ?? 0,
"custom62":  int.tryParse(customController62.text) ?? 0,
"custom72":  int.tryParse(customController72.text) ?? 0,
"custom82":  int.tryParse(customController82.text) ?? 0,
"custom92":  int.tryParse(customController92.text) ?? 0,
"custom102":  int.tryParse(customController102.text) ??0,
"custom11usd": eurtousd1.toString() ?? "0.0",
"custom11gbp": eurtogbp1.toString() ?? "0.0",
"custom11eur": userprice1.toString() ?? "0.0",
"custom11inr": eurtoinr1.toString() ?? "0.0",
"custom21usd": eurtousd2.toString() ?? "0.0",
"custom21gbp": eurtogbp2.toString() ?? "0.0",
"custom21eur": userprice2.toString() ?? "0.0",
"custom21inr": eurtoinr2.toString() ?? "0.0",
"custom31usd": eurtousd3.toString() ?? "0.0",
"custom31gbp": eurtogbp3.toString() ?? "0.0",
"custom31eur": userprice3.toString() ?? "0.0",
"custom31inr": eurtoinr3.toString() ?? "0.0",
"custom41usd": eurtousd4.toString() ?? "0.0",
"custom41gbp": eurtogbp4.toString() ?? "0.0",
"custom41eur": userprice4.toString() ?? "0.0",
"custom41inr": eurtoinr4.toString() ?? "0.0",
"custom51usd": eurtousd5.toString() ?? "0.0",
"custom51gbp": eurtogbp5.toString() ?? "0.0",
"custom51eur": userprice5.toString() ?? "0.0",
"custom51inr": eurtoinr5.toString() ?? "0.0",
"custom61usd": eurtousd6.toString() ?? "0.0",
"custom61gbp": eurtogbp6.toString() ?? "0.0",
"custom61eur": userprice6.toString() ?? "0.0",
"custom61inr": eurtoinr6.toString() ?? "0.0",
"custom71usd": eurtousd7.toString() ?? "0.0",
"custom71gbp": eurtogbp7.toString() ?? "0.0",
"custom71eur": userprice7.toString() ?? "0.0",
"custom71inr": eurtoinr7.toString() ?? "0.0",
"custom81usd": eurtousd8.toString() ?? "0.0",
"custom81gbp": eurtogbp8.toString() ?? "0.0",
"custom81eur": userprice8.toString() ?? "0.0",
"custom81inr": eurtoinr8.toString() ?? "0.0",
"custom91usd": eurtousd9.toString() ?? "0.0",
"custom91gbp": eurtogbp9.toString() ?? "0.0",
"custom91eur": userprice9.toString() ?? "0.0",
"custom91inr": eurtoinr9.toString() ?? "0.0",
"custom101usd": eurtousd10.toString() ?? "0.0",
"custom101gbp": eurtogbp10.toString() ?? "0.0",
"custom101eur": userprice10.toString() ?? "0.0",
"custom101inr": eurtoinr10.toString() ?? "0.0",
"shipcostusd": eurtousd11.toString() ?? "0.0",
"shipcostgbp": eurtogbp11.toString() ?? "0.0",
"shipcosteur": userprice11.toString() ?? "0.0",
"shipcostinr": eurtoinr11.toString() ?? "0.0",
"processfrom":  int.tryParse(durationfromp.text) ?? 0,
"processto":  int.tryParse(durationto.text) ?? 0,
"shipfrom":  int.tryParse(durationfrom.text) ?? 0,
"shipto":  int.tryParse(durationto.text) ?? 0,
"colorText1":colorController1.text ?? "",
"colorText2":colorController2.text ?? "",
"colorText3":colorController3.text ?? "",
"colorText4":colorController4.text ?? "",
"colorText5":colorController5.text ?? "",
"colorText6":colorController6.text ?? "",
"colorText7":colorController7.text ?? "",
"colorText8":colorController8.text ?? "",
"colorText9":colorController9.text ?? "",
"colorText10":colorController10.text ?? "",
"color1":int.tryParse(colorController11.text) ?? 0,
"color2":int.tryParse(colorController21.text) ?? 0,
"color3":int.tryParse(colorController31.text) ?? 0,
"color4":int.tryParse(colorController41.text) ?? 0,
"color5":int.tryParse(colorController51.text) ?? 0,
"color6":int.tryParse(colorController61.text) ?? 0,
"color7":int.tryParse(colorController71.text) ?? 0,
"color8":int.tryParse(colorController81.text) ?? 0,
"color9":int.tryParse(colorController91.text) ?? 0,
"color10":int.tryParse(colorController10.text) ?? 0,
"country":  currentUser.country,

"likes": {},
});



setState(() {
file = null;
isUploading = false;
});
}
else  if (currentUser.country == 'UK'){
productsRef
    .doc(widget.currentUser.id)
    .collection("userProducts")
    .doc(prodId)
    .set({

"indian":indian,
"worldship":worldship,
"freeworldship":freeworldship,
"freeship":freeship,
"shipment": shipcontroller.text,
"prodId": prodId,
"ownerId": widget.currentUser.id,
"username": widget.currentUser.displayName,
"photoUrl": widget.currentUser.photoUrl,
"displayName": widget.currentUser.displayName,
"shopmediaUrl": imageUrls,
"Category": value,
// "type":type,
"Gender": dropdownValue,
"details": detailsController.text,
"productname": productnameController.text,
"usd": gbptousd.toString(),
"gbp": userprice.toString(),
"eur": gbptoeur.toString(),
"inr": gbptoinr.toString(),

"timestamp": timestamp,
"composition": compositionController.text,
"washandcare": washandcareController.text,
"sizeandfit": sizeandfitController.text,
"xxxsQuantity": int.tryParse(xxxscontroller.text) ?? 0,
"xxsQuantity": int.tryParse(xxscontroller.text) ?? 0,
"xsQuantity":  int.tryParse(xscontroller.text )?? 0,
"sQuantity": int.tryParse(scontroller.text) ?? 0,

"mtoQuantity":  int.tryParse(mtocontroller.text) ?? 0,
"freesizeQuantity":   int.tryParse(freesizecontroller.text) ?? 0,


"mQuantity":  int.tryParse(mcontroller.text) ?? 0,
"lQuantity":  int.tryParse(lcontroller.text) ?? 0,
"xlQuantity":  int.tryParse(xlcontroller.text) ?? 0,
"xxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"xxxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"fourxlQuantity":  int.tryParse(fourxlcontroller.text) ?? 0,
"fivexlQuantity":  int.tryParse(fivexlcontroller.text) ?? 0,
"sixxlQuantity":  int.tryParse(sixxlcontroller.text) ?? 0,
"sevenxlQuantity":  int.tryParse(sevenxlcontroller.text) ?? 0,
"eightxlQuantity":  int.tryParse(eightxlcontroller.text) ?? 0,
"Shoe1":   int.tryParse(Shoe1controller.text) ?? 0,
"Shoe2":   int.tryParse(Shoe2controller.text) ?? 0,
"Shoe3":   int.tryParse(Shoe3controller.text) ?? 0,
"Shoe4":   int.tryParse(Shoe4controller.text) ?? 0,
"Shoe5":   int.tryParse(Shoe5controller.text) ?? 0,
"Shoe6":   int.tryParse(Shoe6controller.text) ?? 0,
"Shoe7":   int.tryParse(Shoe7controller.text) ?? 0,
"Shoe8":   int.tryParse(Shoe8controller.text) ?? 0,
"Shoe9":   int.tryParse(Shoe9controller.text) ?? 0,
"Shoe10":   int.tryParse(Shoe10controller.text) ?? 0,
"Shoe11":   int.tryParse(Shoe11controller.text) ?? 0,
"Shoe12":   int.tryParse(Shoe12controller.text) ?? 0,
"Shoe13":   int.tryParse(Shoe13controller.text) ?? 0,
"Shoe14":   int.tryParse(Shoe14controller.text) ?? 0,
"Shoe15":  int.tryParse(Shoe15controller.text) ?? 0,
"Shoe16":  int.tryParse(Shoe16controller.text) ?? 0,
"Shoe17":  int.tryParse(Shoe17controller.text) ?? 0,
"Shoe18":  int.tryParse(Shoe18controller.text) ?? 0,
"Shoe19":  int.tryParse(Shoe19controller.text) ?? 0,
"Shoe20":  int.tryParse(Shoe20controller.text) ?? 0,
"Shoe21":  int.tryParse(Shoe21controller.text) ?? 0,
"Ring1":   int.tryParse(Ring1controller.text) ?? 0,
"Ring2":   int.tryParse(Ring2controller.text) ?? 0,
"Ring3":   int.tryParse(Ring3controller.text) ?? 0,
"Ring4":   int.tryParse(Ring4controller.text) ?? 0,
"Ring5":   int.tryParse(Ring5controller.text) ?? 0,
"Ring6":   int.tryParse(Ring6controller.text) ?? 0,
"Ring7":   int.tryParse(Ring7controller.text) ?? 0,
"Ring8":   int.tryParse(Ring8controller.text) ?? 0,
"Ring9":   int.tryParse(Ring9controller.text) ?? 0,
"Ring10":   int.tryParse(Ring10controller.text) ?? 0,
"Ring11":   int.tryParse(Ring11controller.text) ?? 0,
"Ring12":   int.tryParse(Ring12controller.text) ?? 0,
"Ring13":   int.tryParse(Ring13controller.text) ?? 0,
"Ring14":   int.tryParse(Ring14controller.text) ?? 0,
"Ring15":  int.tryParse(Ring15controller.text) ?? 0,
"Ring16":  int.tryParse(Ring16controller.text) ?? 0,
"Ring17":  int.tryParse(Ring17controller.text) ?? 0,
"Ring18":  int.tryParse(Ring18controller.text) ?? 0,
"Ring19":  int.tryParse(Ring19controller.text) ?? 0,
"Ring20":  int.tryParse(Ring20controller.text) ?? 0,
"Ring21":  int.tryParse(Ring21controller.text) ?? 0,
"Ring22":  int.tryParse(Ring22controller.text) ?? 0,
"Ring23":  int.tryParse(Ring23controller.text) ?? 0,
"custom1":  customController1.text ?? "",
"custom2":  customController2.text ?? "",
"custom3":  customController3.text ?? "",
"custom4":  customController4.text ?? "",
"custom5":  customController5.text ?? "",
"custom6":  customController6.text ?? "",
"custom7":  customController7.text ?? "",
"custom8":  customController8.text ?? "",
"custom9":  customController9.text ?? "",
"custom10":  customController10.text ?? "",
"custom12":  int.tryParse(customController12.text) ?? 0,
"custom22":  int.tryParse(customController22.text) ?? 0,
"custom32":  int.tryParse(customController32.text) ?? 0,
"custom42":  int.tryParse(customController42.text) ?? 0,
"custom52":  int.tryParse(customController52.text) ?? 0,
"custom62":  int.tryParse(customController62.text) ?? 0,
"custom72":  int.tryParse(customController72.text) ?? 0,
"custom82":  int.tryParse(customController82.text) ?? 0,
"custom92":  int.tryParse(customController92.text) ?? 0,
"custom102":  int.tryParse(customController102.text) ??0,
"custom11usd": gbptousd1.toString() ?? "0.0",
"custom11gbp":userprice1.toString() ?? "0.0",
"custom11eur": gbptoeur1.toString() ?? "0.0",
"custom11inr": gbptoinr1.toString() ?? "0.0",
"custom21usd": gbptousd2.toString() ?? "0.0",
"custom21gbp": userprice2.toString() ?? "0.0",
"custom21eur":gbptoeur2.toString() ?? "0.0",
"custom21inr": gbptoinr2.toString() ?? "0.0",
"custom31usd": gbptousd3.toString() ?? "0.0",
"custom31gbp": userprice3.toString() ?? "0.0",
"custom31eur": gbptoeur3.toString() ?? "0.0",
"custom31inr": gbptoinr3.toString() ?? "0.0",
"custom41usd": gbptousd4.toString() ?? "0.0",
"custom41gbp": userprice4.toString() ?? "0.0",
"custom41eur": gbptoeur4.toString() ?? "0.0",
"custom41inr": gbptoinr4.toString() ?? "0.0",
"custom51usd": gbptousd5.toString() ?? "0.0",
"custom51gbp": userprice5.toString() ?? "0.0",
"custom51eur": gbptoeur5.toString() ?? "0.0",
"custom51inr": gbptoinr5.toString() ?? "0.0",
"custom61usd": gbptousd6.toString() ?? "0.0",
"custom61gbp": userprice6.toString() ?? "0.0",
"custom61eur": gbptoeur6.toString() ?? "0.0",
"custom61inr": gbptoinr6.toString() ?? "0.0",
"custom71usd": gbptousd7.toString() ?? "0.0",
"custom71gbp": userprice7.toString() ?? "0.0",
"custom71eur": gbptoeur7.toString() ?? "0.0",
"custom71inr": gbptoinr7.toString() ?? "0.0",
"custom81usd": gbptousd8.toString() ?? "0.0",
"custom81gbp": userprice8.toString() ?? "0.0",
"custom81eur": gbptoeur8.toString() ?? "0.0",
"custom81inr": gbptoinr8.toString() ?? "0.0",
"custom91usd": gbptousd9.toString() ?? "0.0",
"custom91gbp": userprice9.toString() ?? "0.0",
"custom91eur": gbptoeur9.toString() ?? "0.0",
"custom91inr": gbptoinr9.toString() ?? "0.0",
"custom101usd": gbptousd10.toString() ?? "0.0",
"custom101gbp": userprice10.toString() ?? "0.0",
"custom101eur": gbptoeur10.toString() ?? "0.0",
"custom101inr": gbptoinr10.toString() ?? "0.0",
"shipcostusd": gbptousd11.toString() ?? "0.0",
"shipcostgbp": userprice11.toString() ?? "0.0",
"shipcosteur": gbptoeur11.toString() ?? "0.0",
"shipcostinr": gbptoinr11.toString() ?? "0.0",

"processfrom":  int.tryParse(durationfromp.text) ?? 0,
"processto":  int.tryParse(durationto.text) ?? 0,
"shipfrom":  int.tryParse(durationfrom.text) ?? 0,
"shipto":  int.tryParse(durationto.text) ?? 0,
"colorText1":colorController1.text ?? "",
"colorText2":colorController2.text ?? "",
"colorText3":colorController3.text ?? "",
"colorText4":colorController4.text ?? "",
"colorText5":colorController5.text ?? "",
"colorText6":colorController6.text ?? "",
"colorText7":colorController7.text ?? "",
"colorText8":colorController8.text ?? "",
"colorText9":colorController9.text ?? "",
"colorText10":colorController10.text ?? "",
"color1":int.tryParse(colorController11.text) ?? 0,
"color2":int.tryParse(colorController21.text) ?? 0,
"color3":int.tryParse(colorController31.text) ?? 0,
"color4":int.tryParse(colorController41.text) ?? 0,
"color5":int.tryParse(colorController51.text) ?? 0,
"color6":int.tryParse(colorController61.text) ?? 0,
"color7":int.tryParse(colorController71.text) ?? 0,
"color8":int.tryParse(colorController81.text) ?? 0,
"color9":int.tryParse(colorController91.text) ?? 0,
"color10":int.tryParse(colorController10.text) ?? 0,
"country":  currentUser.country,

"likes": {},
});



setState(() {
file = null;
isUploading = false;
});
}

else if (currentUser.country == 'USA'){
productsRef
    .doc(widget.currentUser.id)
    .collection("userProducts")
    .doc(prodId)
    .set({

"indian":indian,
"worldship":worldship,
"freeworldship":freeworldship,
"freeship":freeship,
"shipment": shipcontroller.text,
"prodId": prodId,
"ownerId": widget.currentUser.id,
"username": widget.currentUser.displayName,
"photoUrl": widget.currentUser.photoUrl,
"displayName": widget.currentUser.displayName,
"shopmediaUrl": imageUrls,
"Category": value,
// "type":type,
"Gender": dropdownValue,
"details": detailsController.text,
"productname": productnameController.text,
"usd":userprice.toString(),
"gbp": usdtogbp.toString(),
"eur": usdtoeur.toString(),
"inr": usdtoinr.toString(),

"timestamp": timestamp,
"composition": compositionController.text,
"washandcare": washandcareController.text,
"sizeandfit": sizeandfitController.text,
"xxxsQuantity": int.tryParse(xxxscontroller.text) ?? 0,
"xxsQuantity": int.tryParse(xxscontroller.text) ?? 0,
"xsQuantity":  int.tryParse(xscontroller.text )?? 0,
"sQuantity": int.tryParse(scontroller.text) ?? 0,

"mtoQuantity":  int.tryParse(mtocontroller.text) ?? 0,
"freesizeQuantity":   int.tryParse(freesizecontroller.text) ?? 0,


"mQuantity":  int.tryParse(mcontroller.text) ?? 0,
"lQuantity":  int.tryParse(lcontroller.text) ?? 0,
"xlQuantity":  int.tryParse(xlcontroller.text) ?? 0,
"xxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"xxxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"fourxlQuantity":  int.tryParse(fourxlcontroller.text) ?? 0,
"fivexlQuantity":  int.tryParse(fivexlcontroller.text) ?? 0,
"sixxlQuantity":  int.tryParse(sixxlcontroller.text) ?? 0,
"sevenxlQuantity":  int.tryParse(sevenxlcontroller.text) ?? 0,
"eightxlQuantity":  int.tryParse(eightxlcontroller.text) ?? 0,
"Shoe1":   int.tryParse(Shoe1controller.text) ?? 0,
"Shoe2":   int.tryParse(Shoe2controller.text) ?? 0,
"Shoe3":   int.tryParse(Shoe3controller.text) ?? 0,
"Shoe4":   int.tryParse(Shoe4controller.text) ?? 0,
"Shoe5":   int.tryParse(Shoe5controller.text) ?? 0,
"Shoe6":   int.tryParse(Shoe6controller.text) ?? 0,
"Shoe7":   int.tryParse(Shoe7controller.text) ?? 0,
"Shoe8":   int.tryParse(Shoe8controller.text) ?? 0,
"Shoe9":   int.tryParse(Shoe9controller.text) ?? 0,
"Shoe10":   int.tryParse(Shoe10controller.text) ?? 0,
"Shoe11":   int.tryParse(Shoe11controller.text) ?? 0,
"Shoe12":   int.tryParse(Shoe12controller.text) ?? 0,
"Shoe13":   int.tryParse(Shoe13controller.text) ?? 0,
"Shoe14":   int.tryParse(Shoe14controller.text) ?? 0,
"Shoe15":  int.tryParse(Shoe15controller.text) ?? 0,
"Shoe16":  int.tryParse(Shoe16controller.text) ?? 0,
"Shoe17":  int.tryParse(Shoe17controller.text) ?? 0,
"Shoe18":  int.tryParse(Shoe18controller.text) ?? 0,
"Shoe19":  int.tryParse(Shoe19controller.text) ?? 0,
"Shoe20":  int.tryParse(Shoe20controller.text) ?? 0,
"Shoe21":  int.tryParse(Shoe21controller.text) ?? 0,
"Ring1":   int.tryParse(Ring1controller.text) ?? 0,
"Ring2":   int.tryParse(Ring2controller.text) ?? 0,
"Ring3":   int.tryParse(Ring3controller.text) ?? 0,
"Ring4":   int.tryParse(Ring4controller.text) ?? 0,
"Ring5":   int.tryParse(Ring5controller.text) ?? 0,
"Ring6":   int.tryParse(Ring6controller.text) ?? 0,
"Ring7":   int.tryParse(Ring7controller.text) ?? 0,
"Ring8":   int.tryParse(Ring8controller.text) ?? 0,
"Ring9":   int.tryParse(Ring9controller.text) ?? 0,
"Ring10":   int.tryParse(Ring10controller.text) ?? 0,
"Ring11":   int.tryParse(Ring11controller.text) ?? 0,
"Ring12":   int.tryParse(Ring12controller.text) ?? 0,
"Ring13":   int.tryParse(Ring13controller.text) ?? 0,
"Ring14":   int.tryParse(Ring14controller.text) ?? 0,
"Ring15":  int.tryParse(Ring15controller.text) ?? 0,
"Ring16":  int.tryParse(Ring16controller.text) ?? 0,
"Ring17":  int.tryParse(Ring17controller.text) ?? 0,
"Ring18":  int.tryParse(Ring18controller.text) ?? 0,
"Ring19":  int.tryParse(Ring19controller.text) ?? 0,
"Ring20":  int.tryParse(Ring20controller.text) ?? 0,
"Ring21":  int.tryParse(Ring21controller.text) ?? 0,
"Ring22":  int.tryParse(Ring22controller.text) ?? 0,
"Ring23":  int.tryParse(Ring23controller.text) ?? 0,
"custom1":  customController1.text ?? "",
"custom2":  customController2.text ?? "",
"custom3":  customController3.text ?? "",
"custom4":  customController4.text ?? "",
"custom5":  customController5.text ?? "",
"custom6":  customController6.text ?? "",
"custom7":  customController7.text ?? "",
"custom8":  customController8.text ?? "",
"custom9":  customController9.text ?? "",
"custom10":  customController10.text ?? "",
"custom12":  int.tryParse(customController12.text) ?? 0,
"custom22":  int.tryParse(customController22.text) ?? 0,
"custom32":  int.tryParse(customController32.text) ?? 0,
"custom42":  int.tryParse(customController42.text) ?? 0,
"custom52":  int.tryParse(customController52.text) ?? 0,
"custom62":  int.tryParse(customController62.text) ?? 0,
"custom72":  int.tryParse(customController72.text) ?? 0,
"custom82":  int.tryParse(customController82.text) ?? 0,
"custom92":  int.tryParse(customController92.text) ?? 0,
"custom102":  int.tryParse(customController102.text) ??0,
"custom11usd":userprice1.toString() ?? "0.0",
"custom11gbp": usdtogbp1.toString() ?? "0.0",
"custom11eur": usdtoeur1.toString() ?? "0.0",
"custom11inr": usdtoinr1.toString() ?? "0.0",
"custom21usd":userprice2.toString() ?? "0.0",
"custom21gbp": usdtogbp2.toString() ?? "0.0",
"custom21eur": usdtoeur2.toString() ?? "0.0",
"custom21inr": usdtoinr2.toString() ?? "0.0",
"custom31usd":userprice3.toString() ?? "0.0",
"custom31gbp": usdtogbp3.toString() ?? "0.0",
"custom31eur": usdtoeur3.toString() ?? "0.0",
"custom31inr": usdtoinr3.toString() ?? "0.0",
"custom41usd":userprice4.toString() ?? "0.0",
"custom41gbp": usdtogbp4.toString() ?? "0.0",
"custom41eur": usdtoeur4.toString() ?? "0.0",
"custom41inr": usdtoinr4.toString() ?? "0.0",
"custom51usd":userprice5.toString() ?? "0.0",
"custom51gbp": usdtogbp5.toString() ?? "0.0",
"custom51eur": usdtoeur5.toString() ?? "0.0",
"custom51inr": usdtoinr5.toString() ?? "0.0",
"custom61usd":userprice6.toString() ?? "0.0",
"custom61gbp": usdtogbp6.toString() ?? "0.0",
"custom61eur": usdtoeur6.toString() ?? "0.0",
"custom61inr": usdtoinr6.toString() ?? "0.0",
"custom71usd":userprice7.toString() ?? "0.0",
"custom71gbp": usdtogbp7.toString() ?? "0.0",
"custom71eur": usdtoeur7.toString() ?? "0.0",
"custom71inr": usdtoinr7.toString() ?? "0.0",
"custom81usd":userprice8.toString() ?? "0.0",
"custom81gbp": usdtogbp8.toString() ?? "0.0",
"custom81eur": usdtoeur8.toString() ?? "0.0",
"custom81inr": usdtoinr8.toString() ?? "0.0",
"custom91usd":userprice9.toString() ?? "0.0",
"custom91gbp": usdtogbp9.toString() ?? "0.0",
"custom91eur": usdtoeur9.toString() ?? "0.0",
"custom91inr": usdtoinr9.toString() ?? "0.0",
"custom101usd":userprice10.toString() ?? "0.0",
"custom101gbp": usdtogbp10.toString() ?? "0.0",
"custom101eur": usdtoeur10.toString() ?? "0.0",
"custom101inr": usdtoinr10.toString() ?? "0.0",
"shipcostusd":userprice11.toString() ?? "0.0",
"shipcostgbp": usdtogbp11.toString() ?? "0.0",
"shipcosteur": usdtoeur11.toString() ?? "0.0",
"shipcostinr": usdtoinr11.toString() ?? "0.0",

"colorText1":colorController1.text ?? "",
"colorText2":colorController2.text ?? "",
"colorText3":colorController3.text ?? "",
"colorText4":colorController4.text ?? "",
"colorText5":colorController5.text ?? "",
"colorText6":colorController6.text ?? "",
"colorText7":colorController7.text ?? "",
"colorText8":colorController8.text ?? "",
"colorText9":colorController9.text ?? "",
"colorText10":colorController10.text ?? "",
"color1":int.tryParse(colorController11.text) ?? 0,
"color2":int.tryParse(colorController21.text) ?? 0,
"color3":int.tryParse(colorController31.text) ?? 0,
"color4":int.tryParse(colorController41.text) ?? 0,
"color5":int.tryParse(colorController51.text) ?? 0,
"color6":int.tryParse(colorController61.text) ?? 0,
"color7":int.tryParse(colorController71.text) ?? 0,
"color8":int.tryParse(colorController81.text) ?? 0,
"color9":int.tryParse(colorController91.text) ?? 0,
"color10":int.tryParse(colorController10.text) ?? 0,
"country":  currentUser.country,
"processfrom":  int.tryParse(durationfromp.text) ?? 0,
"processto":  int.tryParse(durationto.text) ?? 0,
"shipfrom":  int.tryParse(durationfrom.text) ?? 0,
"shipto":  int.tryParse(durationto.text) ?? 0,

"likes": {},
});



setState(() {
file = null;
isUploading = false;
});
}

else if (currentUser.country == 'India'){
productsRef
    .doc(widget.currentUser.id)
    .collection("userProducts")
    .doc(prodId)
    .set({
"colorText1":colorController1.text ?? "",
"colorText2":colorController2.text ?? "",
"colorText3":colorController3.text ?? "",
"colorText4":colorController4.text ?? "",
"colorText5":colorController5.text ?? "",
"colorText6":colorController6.text ?? "",
"colorText7":colorController7.text ?? "",
"colorText8":colorController8.text ?? "",
"colorText9":colorController9.text ?? "",
"colorText10":colorController10.text ?? "",
"color1":int.tryParse(colorController11.text) ?? 0,
"color2":int.tryParse(colorController21.text) ?? 0,
"color3":int.tryParse(colorController31.text) ?? 0,
"color4":int.tryParse(colorController41.text) ?? 0,
"color5":int.tryParse(colorController51.text) ?? 0,
"color6":int.tryParse(colorController61.text) ?? 0,
"color7":int.tryParse(colorController71.text) ?? 0,
"color8":int.tryParse(colorController81.text) ?? 0,
"color9":int.tryParse(colorController91.text) ?? 0,
"color10":int.tryParse(colorController10.text) ?? 0,
"country":  currentUser.country,

"indian":indian,
"worldship":worldship,
"freeworldship":freeworldship,
"freeship":freeship,
"shipment": shipcontroller.text,
"prodId": prodId,
"ownerId": widget.currentUser.id,
"username": widget.currentUser.displayName,
"photoUrl": widget.currentUser.photoUrl,
"displayName": widget.currentUser.displayName,
"shopmediaUrl": imageUrls,
"Category": value,
// "type":type,
"Gender": dropdownValue,
"details": detailsController.text,
"productname": productnameController.text,
"usd": inrtousd.toString(),
"gbp": inrtogbp.toString(),
"eur": inrtoeur.toString(),
"inr": userprice.toString(),

"timestamp": timestamp,
"composition": compositionController.text,
"washandcare": washandcareController.text,
"sizeandfit": sizeandfitController.text,
"xxxsQuantity": int.tryParse(xxxscontroller.text) ?? 0,
"xxsQuantity": int.tryParse(xxscontroller.text) ?? 0,
"xsQuantity":  int.tryParse(xscontroller.text )?? 0,
"sQuantity": int.tryParse(scontroller.text) ?? 0,

"mtoQuantity":  int.tryParse(mtocontroller.text) ?? 0,
"freesizeQuantity":   int.tryParse(freesizecontroller.text) ?? 0,


"mQuantity":  int.tryParse(mcontroller.text) ?? 0,
"lQuantity":  int.tryParse(lcontroller.text) ?? 0,
"xlQuantity":  int.tryParse(xlcontroller.text) ?? 0,
"xxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"xxxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"fourxlQuantity":  int.tryParse(fourxlcontroller.text) ?? 0,
"fivexlQuantity":  int.tryParse(fivexlcontroller.text) ?? 0,
"sixxlQuantity":  int.tryParse(sixxlcontroller.text) ?? 0,
"sevenxlQuantity":  int.tryParse(sevenxlcontroller.text) ?? 0,
"eightxlQuantity":  int.tryParse(eightxlcontroller.text) ?? 0,
"Shoe1":   int.tryParse(Shoe1controller.text) ?? 0,
"Shoe2":   int.tryParse(Shoe2controller.text) ?? 0,
"Shoe3":   int.tryParse(Shoe3controller.text) ?? 0,
"Shoe4":   int.tryParse(Shoe4controller.text) ?? 0,
"Shoe5":   int.tryParse(Shoe5controller.text) ?? 0,
"Shoe6":   int.tryParse(Shoe6controller.text) ?? 0,
"Shoe7":   int.tryParse(Shoe7controller.text) ?? 0,
"Shoe8":   int.tryParse(Shoe8controller.text) ?? 0,
"Shoe9":   int.tryParse(Shoe9controller.text) ?? 0,
"Shoe10":   int.tryParse(Shoe10controller.text) ?? 0,
"Shoe11":   int.tryParse(Shoe11controller.text) ?? 0,
"Shoe12":   int.tryParse(Shoe12controller.text) ?? 0,
"Shoe13":   int.tryParse(Shoe13controller.text) ?? 0,
"Shoe14":   int.tryParse(Shoe14controller.text) ?? 0,
"Shoe15":  int.tryParse(Shoe15controller.text) ?? 0,
"Shoe16":  int.tryParse(Shoe16controller.text) ?? 0,
"Shoe17":  int.tryParse(Shoe17controller.text) ?? 0,
"Shoe18":  int.tryParse(Shoe18controller.text) ?? 0,
"Shoe19":  int.tryParse(Shoe19controller.text) ?? 0,
"Shoe20":  int.tryParse(Shoe20controller.text) ?? 0,
"Shoe21":  int.tryParse(Shoe21controller.text) ?? 0,
"Ring1":   int.tryParse(Ring1controller.text) ?? 0,
"Ring2":   int.tryParse(Ring2controller.text) ?? 0,
"Ring3":   int.tryParse(Ring3controller.text) ?? 0,
"Ring4":   int.tryParse(Ring4controller.text) ?? 0,
"Ring5":   int.tryParse(Ring5controller.text) ?? 0,
"Ring6":   int.tryParse(Ring6controller.text) ?? 0,
"Ring7":   int.tryParse(Ring7controller.text) ?? 0,
"Ring8":   int.tryParse(Ring8controller.text) ?? 0,
"Ring9":   int.tryParse(Ring9controller.text) ?? 0,
"Ring10":   int.tryParse(Ring10controller.text) ?? 0,
"Ring11":   int.tryParse(Ring11controller.text) ?? 0,
"Ring12":   int.tryParse(Ring12controller.text) ?? 0,
"Ring13":   int.tryParse(Ring13controller.text) ?? 0,
"Ring14":   int.tryParse(Ring14controller.text) ?? 0,
"Ring15":  int.tryParse(Ring15controller.text) ?? 0,
"Ring16":  int.tryParse(Ring16controller.text) ?? 0,
"Ring17":  int.tryParse(Ring17controller.text) ?? 0,
"Ring18":  int.tryParse(Ring18controller.text) ?? 0,
"Ring19":  int.tryParse(Ring19controller.text) ?? 0,
"Ring20":  int.tryParse(Ring20controller.text) ?? 0,
"Ring21":  int.tryParse(Ring21controller.text) ?? 0,
"Ring22":  int.tryParse(Ring22controller.text) ?? 0,
"Ring23":  int.tryParse(Ring23controller.text) ?? 0,
"custom1":  customController1.text ?? "",
"custom2":  customController2.text ?? "",
"custom3":  customController3.text ?? "",
"custom4":  customController4.text ?? "",
"custom5":  customController5.text ?? "",
"custom6":  customController6.text ?? "",
"custom7":  customController7.text ?? "",
"custom8":  customController8.text ?? "",
"custom9":  customController9.text ?? "",
"custom10":  customController10.text ?? "",
"custom12":  int.tryParse(customController12.text) ?? 0,
"custom22":  int.tryParse(customController22.text) ?? 0,
"custom32":  int.tryParse(customController32.text) ?? 0,
"custom42":  int.tryParse(customController42.text) ?? 0,
"custom52":  int.tryParse(customController52.text) ?? 0,
"custom62":  int.tryParse(customController62.text) ?? 0,
"custom72":  int.tryParse(customController72.text) ?? 0,
"custom82":  int.tryParse(customController82.text) ?? 0,
"custom92":  int.tryParse(customController92.text) ?? 0,
"custom102":  int.tryParse(customController102.text) ??0,
"custom11usd": inrtousd1.toString() ?? "0.0",
"custom11gbp": inrtogbp1.toString() ?? "0.0",
"custom11eur": inrtoeur1.toString() ?? "0.0",
"custom11inr": userprice1.toString() ?? "0.0",
"custom21usd": inrtousd2.toString() ?? "0.0",
"custom21gbp": inrtogbp2.toString() ?? "0.0",
"custom21eur": inrtoeur2.toString() ?? "0.0",
"custom21inr": userprice2.toString() ?? "0.0",
"custom31usd": inrtousd3.toString() ?? "0.0",
"custom31gbp": inrtogbp3.toString() ?? "0.0",
"custom31eur": inrtoeur3.toString() ?? "0.0",
"custom31inr": userprice3.toString() ?? "0.0",
"custom41usd": inrtousd4.toString() ?? "0.0",
"custom41gbp": inrtogbp4.toString() ?? "0.0",
"custom41eur": inrtoeur4.toString() ?? "0.0",
"custom41inr": userprice4.toString() ?? "0.0",
"custom51usd": inrtousd5.toString() ?? "0.0",
"custom51gbp": inrtogbp5.toString() ?? "0.0",
"custom51eur": inrtoeur5.toString() ?? "0.0",
"custom51inr": userprice5.toString() ?? "0.0",
"custom61usd": inrtousd6.toString() ?? "0.0",
"custom61gbp": inrtogbp6.toString() ?? "0.0",
"custom61eur": inrtoeur6.toString() ?? "0.0",
"custom61inr": userprice6.toString() ?? "0.0",
"custom71usd": inrtousd7.toString() ?? "0.0",
"custom71gbp": inrtogbp7.toString() ?? "0.0",
"custom71eur": inrtoeur7.toString() ?? "0.0",
"custom71inr": userprice7.toString() ?? "0.0",
"custom81usd": inrtousd8.toString() ?? "0.0",
"custom81gbp": inrtogbp8.toString() ?? "0.0",
"custom81eur": inrtoeur8.toString() ?? "0.0",
"custom81inr": userprice8.toString() ?? "0.0",
"custom91usd": inrtousd9.toString() ?? "0.0",
"custom91gbp": inrtogbp9.toString() ?? "0.0",
"custom91eur": inrtoeur9.toString() ?? "0.0",
"custom91inr": userprice9.toString() ?? "0.0",
"custom101usd": inrtousd10.toString() ?? "0.0",
"custom101gbp": inrtogbp10.toString() ?? "0.0",
"custom101eur": inrtoeur10.toString() ?? "0.0",
"custom101inr": userprice10.toString() ?? "0.0",
"shipcostusd": inrtousd11.toString() ?? "0.0",
"shipcostgbp": inrtogbp11.toString() ?? "0.0",
"shipcosteur": inrtoeur11.toString() ?? "0.0",
"shipcostinr": userprice11.toString() ?? "0.0",

"processfrom":  int.tryParse(durationfromp.text) ?? 0,
"processto":  int.tryParse(durationto.text) ?? 0,
"shipfrom":  int.tryParse(durationfrom.text) ?? 0,
"shipto":  int.tryParse(durationto.text) ?? 0,

"likes": {},
});



setState(() {
file = null;
isUploading = false;
});
}
else{
productsRef
    .doc(widget.currentUser.id)
    .collection("userProducts")
    .doc(prodId)
    .set({

"indian":indian,
"worldship":worldship,
"freeworldship":freeworldship,
"freeship":freeship,
"shipment": shipcontroller.text,
"prodId": prodId,
"ownerId": widget.currentUser.id,
"username": widget.currentUser.displayName,
"photoUrl": widget.currentUser.photoUrl,
"displayName": widget.currentUser.displayName,
"shopmediaUrl": imageUrls,
"Category": value,
// "type":type,
"Gender": dropdownValue,
"details": detailsController.text,
"productname": productnameController.text,
"usd":userprice.toString(),
"gbp": usdtogbp.toString(),
"eur": usdtoeur.toString(),
"inr": usdtoinr.toString(),

"timestamp": timestamp,
"composition": compositionController.text,
"washandcare": washandcareController.text,
"sizeandfit": sizeandfitController.text,
"xxxsQuantity": int.tryParse(xxxscontroller.text) ?? 0,
"xxsQuantity": int.tryParse(xxscontroller.text) ?? 0,
"xsQuantity":  int.tryParse(xscontroller.text )?? 0,
"sQuantity": int.tryParse(scontroller.text) ?? 0,

"mtoQuantity":  int.tryParse(mtocontroller.text) ?? 0,
"freesizeQuantity":   int.tryParse(freesizecontroller.text) ?? 0,


"mQuantity":  int.tryParse(mcontroller.text) ?? 0,
"lQuantity":  int.tryParse(lcontroller.text) ?? 0,
"xlQuantity":  int.tryParse(xlcontroller.text) ?? 0,
"xxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"xxxlQuantity":  int.tryParse(xxlcontroller.text) ?? 0,
"fourxlQuantity":  int.tryParse(fourxlcontroller.text) ?? 0,
"fivexlQuantity":  int.tryParse(fivexlcontroller.text) ?? 0,
"sixxlQuantity":  int.tryParse(sixxlcontroller.text) ?? 0,
"sevenxlQuantity":  int.tryParse(sevenxlcontroller.text) ?? 0,
"eightxlQuantity":  int.tryParse(eightxlcontroller.text) ?? 0,
"Shoe1":   int.tryParse(Shoe1controller.text) ?? 0,
"Shoe2":   int.tryParse(Shoe2controller.text) ?? 0,
"Shoe3":   int.tryParse(Shoe3controller.text) ?? 0,
"Shoe4":   int.tryParse(Shoe4controller.text) ?? 0,
"Shoe5":   int.tryParse(Shoe5controller.text) ?? 0,
"Shoe6":   int.tryParse(Shoe6controller.text) ?? 0,
"Shoe7":   int.tryParse(Shoe7controller.text) ?? 0,
"Shoe8":   int.tryParse(Shoe8controller.text) ?? 0,
"Shoe9":   int.tryParse(Shoe9controller.text) ?? 0,
"Shoe10":   int.tryParse(Shoe10controller.text) ?? 0,
"Shoe11":   int.tryParse(Shoe11controller.text) ?? 0,
"Shoe12":   int.tryParse(Shoe12controller.text) ?? 0,
"Shoe13":   int.tryParse(Shoe13controller.text) ?? 0,
"Shoe14":   int.tryParse(Shoe14controller.text) ?? 0,
"Shoe15":  int.tryParse(Shoe15controller.text) ?? 0,
"Shoe16":  int.tryParse(Shoe16controller.text) ?? 0,
"Shoe17":  int.tryParse(Shoe17controller.text) ?? 0,
"Shoe18":  int.tryParse(Shoe18controller.text) ?? 0,
"Shoe19":  int.tryParse(Shoe19controller.text) ?? 0,
"Shoe20":  int.tryParse(Shoe20controller.text) ?? 0,
"Shoe21":  int.tryParse(Shoe21controller.text) ?? 0,
"Ring1":   int.tryParse(Ring1controller.text) ?? 0,
"Ring2":   int.tryParse(Ring2controller.text) ?? 0,
"Ring3":   int.tryParse(Ring3controller.text) ?? 0,
"Ring4":   int.tryParse(Ring4controller.text) ?? 0,
"Ring5":   int.tryParse(Ring5controller.text) ?? 0,
"Ring6":   int.tryParse(Ring6controller.text) ?? 0,
"Ring7":   int.tryParse(Ring7controller.text) ?? 0,
"Ring8":   int.tryParse(Ring8controller.text) ?? 0,
"Ring9":   int.tryParse(Ring9controller.text) ?? 0,
"Ring10":   int.tryParse(Ring10controller.text) ?? 0,
"Ring11":   int.tryParse(Ring11controller.text) ?? 0,
"Ring12":   int.tryParse(Ring12controller.text) ?? 0,
"Ring13":   int.tryParse(Ring13controller.text) ?? 0,
"Ring14":   int.tryParse(Ring14controller.text) ?? 0,
"Ring15":  int.tryParse(Ring15controller.text) ?? 0,
"Ring16":  int.tryParse(Ring16controller.text) ?? 0,
"Ring17":  int.tryParse(Ring17controller.text) ?? 0,
"Ring18":  int.tryParse(Ring18controller.text) ?? 0,
"Ring19":  int.tryParse(Ring19controller.text) ?? 0,
"Ring20":  int.tryParse(Ring20controller.text) ?? 0,
"Ring21":  int.tryParse(Ring21controller.text) ?? 0,
"Ring22":  int.tryParse(Ring22controller.text) ?? 0,
"Ring23":  int.tryParse(Ring23controller.text) ?? 0,
"custom1":  customController1.text ?? "",
"custom2":  customController2.text ?? "",
"custom3":  customController3.text ?? "",
"custom4":  customController4.text ?? "",
"custom5":  customController5.text ?? "",
"custom6":  customController6.text ?? "",
"custom7":  customController7.text ?? "",
"custom8":  customController8.text ?? "",
"custom9":  customController9.text ?? "",
"custom10":  customController10.text ?? "",
"custom12":  int.tryParse(customController12.text) ?? 0,
"custom22":  int.tryParse(customController22.text) ?? 0,
"custom32":  int.tryParse(customController32.text) ?? 0,
"custom42":  int.tryParse(customController42.text) ?? 0,
"custom52":  int.tryParse(customController52.text) ?? 0,
"custom62":  int.tryParse(customController62.text) ?? 0,
"custom72":  int.tryParse(customController72.text) ?? 0,
"custom82":  int.tryParse(customController82.text) ?? 0,
"custom92":  int.tryParse(customController92.text) ?? 0,
"custom102":  int.tryParse(customController102.text) ??0,
"custom11usd":userprice1.toString() ?? "0.0",
"custom11gbp": usdtogbp1.toString() ?? "0.0",
"custom11eur": usdtoeur1.toString() ?? "0.0",
"custom11inr": usdtoinr1.toString() ?? "0.0",
"custom21usd":userprice2.toString() ?? "0.0",
"custom21gbp": usdtogbp2.toString() ?? "0.0",
"custom21eur": usdtoeur2.toString() ?? "0.0",
"custom21inr": usdtoinr2.toString() ?? "0.0",
"custom31usd":userprice3.toString() ?? "0.0",
"custom31gbp": usdtogbp3.toString() ?? "0.0",
"custom31eur": usdtoeur3.toString() ?? "0.0",
"custom31inr": usdtoinr3.toString() ?? "0.0",
"custom41usd":userprice4.toString() ?? "0.0",
"custom41gbp": usdtogbp4.toString() ?? "0.0",
"custom41eur": usdtoeur4.toString() ?? "0.0",
"custom41inr": usdtoinr4.toString() ?? "0.0",
"custom51usd":userprice5.toString() ?? "0.0",
"custom51gbp": usdtogbp5.toString() ?? "0.0",
"custom51eur": usdtoeur5.toString() ?? "0.0",
"custom51inr": usdtoinr5.toString() ?? "0.0",
"custom61usd":userprice6.toString() ?? "0.0",
"custom61gbp": usdtogbp6.toString() ?? "0.0",
"custom61eur": usdtoeur6.toString() ?? "0.0",
"custom61inr": usdtoinr6.toString() ?? "0.0",
"custom71usd":userprice7.toString() ?? "0.0",
"custom71gbp": usdtogbp7.toString() ?? "0.0",
"custom71eur": usdtoeur7.toString() ?? "0.0",
"custom71inr": usdtoinr7.toString() ?? "0.0",
"custom81usd":userprice8.toString() ?? "0.0",
"custom81gbp": usdtogbp8.toString() ?? "0.0",
"custom81eur": usdtoeur8.toString() ?? "0.0",
"custom81inr": usdtoinr8.toString() ?? "0.0",
"custom91usd":userprice9.toString() ?? "0.0",
"custom91gbp": usdtogbp9.toString() ?? "0.0",
"custom91eur": usdtoeur9.toString() ?? "0.0",
"custom91inr": usdtoinr9.toString() ?? "0.0",
"custom101usd":userprice10.toString() ?? "0.0",
"custom101gbp": usdtogbp10.toString() ?? "0.0",
"custom101eur": usdtoeur10.toString() ?? "0.0",
"custom101inr": usdtoinr10.toString() ?? "0.0",
"shipcostusd":userprice11.toString() ?? "0.0",
"shipcostgbp": usdtogbp11.toString() ?? "0.0",
"shipcosteur": usdtoeur11.toString() ?? "0.0",
"shipcostinr": usdtoinr11.toString() ?? "0.0",

"colorText1":colorController1.text ?? "",
"colorText2":colorController2.text ?? "",
"colorText3":colorController3.text ?? "",
"colorText4":colorController4.text ?? "",
"colorText5":colorController5.text ?? "",
"colorText6":colorController6.text ?? "",
"colorText7":colorController7.text ?? "",
"colorText8":colorController8.text ?? "",
"colorText9":colorController9.text ?? "",
"colorText10":colorController10.text ?? "",
"color1":int.tryParse(colorController11.text) ?? 0,
"color2":int.tryParse(colorController21.text) ?? 0,
"color3":int.tryParse(colorController31.text) ?? 0,
"color4":int.tryParse(colorController41.text) ?? 0,
"color5":int.tryParse(colorController51.text) ?? 0,
"color6":int.tryParse(colorController61.text) ?? 0,
"color7":int.tryParse(colorController71.text) ?? 0,
"color8":int.tryParse(colorController81.text) ?? 0,
"color9":int.tryParse(colorController91.text) ?? 0,
"color10":int.tryParse(colorController10.text) ?? 0,
"country":  currentUser.country,
"processfrom":  int.tryParse(durationfromp.text) ?? 0,
"processto":  int.tryParse(durationto.text) ?? 0,
"shipfrom":  int.tryParse(durationfrom.text) ?? 0,
"shipto":  int.tryParse(durationto.text) ?? 0,

"likes": {},
});



setState(() {
file = null;
isUploading = false;
});
}
sdjgf(){  if (currentUser.country == 'India'){
  Proceedtobuy(total:inr,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
      username: username,
      mediaUrl: shopmediaUrl.first,
      productname:productname);
}
else if (currentUser.country == 'UK'){
  Proceedtobuy(total:gbp,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
      username: username,
      mediaUrl: shopmediaUrl.first,
      productname:productname);
}
else  if (currentUser.country == 'Europe'){
  Proceedtobuy(total:eur,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
      username: username,
      mediaUrl: shopmediaUrl.first,
      productname:productname);
}
else  if (currentUser.country == 'USA'){
  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
      username: username,
      mediaUrl: shopmediaUrl.first,
      productname:productname);
}
else  {
  Proceedtobuy(total:usd,prodId:prodId,ownerId:ownerId,userSize:usersize , profileimg: photoUrl ,
      username: username,
      mediaUrl: shopmediaUrl.first,
      productname:productname);
}
}
