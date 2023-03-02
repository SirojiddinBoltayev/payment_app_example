import 'dart:async';

import 'package:confirmation_success/confirmation_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment_app_example/pages/home.dart';
import 'package:payment_app_example/pages/home_page.dart';
import 'package:payment_app_example/pages/widget/app_color.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                height: size.height * 1.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => ConfirmationSuccess(
                                reactColor: Colors.green,
                                child: Text("Success!",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.orangeAccent.withOpacity(0.5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/PayPal.svg.png",
                              width: 150,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Spacer(flex: 3,),
                        Container(
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5)

                          ),
                          height: 3,
                        ),
                        Spacer(),
                        Text("or",style: TextStyle(color: Colors.grey.withOpacity(0.5)),),
                        Spacer(),
                        Container(
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5)

                          ),
                          height: 3,
                        ),
                        Spacer(flex: 3,),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CreditCardWidget(
                      glassmorphismConfig: useGlassMorphism
                          ? Glassmorphism.defaultConfig()
                          : null,
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      bankName: 'World bank',
                      frontCardBorder: !useGlassMorphism
                          ? Border.all(color: Colors.grey)
                          : null,
                      backCardBorder: !useGlassMorphism
                          ? Border.all(color: Colors.grey)
                          : null,
                      showBackView: isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                      isHolderNameVisible: true,
                      cardBgColor: AppColors.cardBgColor,
                      backgroundImage:
                          useBackgroundImage ? 'assets/visa.png' : null,
                      isSwipeGestureEnabled: true,
                      onCreditCardWidgetChange:
                          (CreditCardBrand creditCardBrand) {},
                      customCardTypeIcons: <CustomCardTypeIcon>[
                        CustomCardTypeIcon(
                          cardType: CardType.mastercard,
                          cardImage: Image.asset(
                            'assets/master_card.png',
                            height: 48,
                            width: 48,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            CreditCardForm(
                              formKey: formKey,
                              obscureCvv: true,
                              obscureNumber: true,
                              cardNumber: cardNumber,
                              cvvCode: cvvCode,
                              isHolderNameVisible: true,
                              isCardNumberVisible: true,
                              isExpiryDateVisible: true,
                              cardHolderName: cardHolderName,
                              expiryDate: expiryDate,
                              themeColor: Colors.blue,
                              textColor: Theme.of(context).primaryColor,
                              cardNumberDecoration: InputDecoration(
                                labelText: 'Number',
                                hintText: 'XXXX XXXX XXXX XXXX',
                                focusedBorder: border,
                                enabledBorder: border,
                              ),
                              expiryDateDecoration: InputDecoration(
                                focusedBorder: border,
                                enabledBorder: border,
                                labelText: 'Expired Date',
                                hintText: 'XX/XX',
                              ),
                              cvvCodeDecoration: InputDecoration(
                                focusedBorder: border,
                                enabledBorder: border,
                                labelText: 'CVV',
                                hintText: 'XXX',
                              ),
                              cardHolderDecoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Theme.of(context).cardColor),
                                labelStyle: TextStyle(
                                    color: Theme.of(context).accentColor),
                                focusedBorder: border,
                                enabledBorder: border,
                                labelText: 'Card Holder',
                              ),
                              onCreditCardModelChange: onCreditCardModelChange,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: _onValidate,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: <Color>[
                                      AppColors.colorB58D67,
                                      AppColors.colorB58D67,
                                      AppColors.colorE5D1B2,
                                      AppColors.colorF9EED2,
                                      AppColors.colorFFFFFD,
                                      AppColors.colorF9EED2,
                                      AppColors.colorB58D67,
                                    ],
                                    begin: Alignment(-1, -4),
                                    end: Alignment(1, 4),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Validate',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'halter',
                                    fontSize: 14,
                                    package: 'flutter_credit_card',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]))
          ],
        ));
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (BuildContext context) => ConfirmationSuccess(
              reactColor: Colors.green,
              child: Text("Success!",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))));

      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                MyHomePage(title: "Payment App")));
      });

      print('valid!');
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
