import 'package:flutter/material.dart';
import 'ImageAndText.dart';
//This contains offers,gift cards,premium and delivery
class OfferGiftPremiumDelivery extends StatelessWidget {
  const OfferGiftPremiumDelivery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ExpandedTwoChild(imageName: 'images/Offergifts/offer.png',
          textContents: 'Offers',),


        ExpandedTwoChild(imageName: 'images/Offergifts/gift.png',
          textContents: 'Gift Cards',),


        ExpandedTwoChild(imageName: 'images/Offergifts/premium.png',
          textContents: 'Premium',),


        ExpandedTwoChild(imageName: 'images/Offergifts/train.png',
          textContents: 'Delivery',),

      ],
    );
  }
}

