import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class AppConstants {
  static const appName = "Hello Shop";
}

class AppFonts {
  static const primaryFont = "Quicksand";
  static const secondaryFont = "Avenir";
}

class AppFunctions {
  static Color formatColor(String color) {
    var newColor = color.substring(1).toUpperCase();
    var preffix = "0xFF";
    var finalColor = int.parse(preffix + newColor);
    return Color(finalColor);
  }

  static Color getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);

  static String getNameInitials(String name) {
    List namesArr = name.split(" ");
    var initials = [];
    namesArr.forEach((name) => initials.add(name.substring(0, 1)));
    return initials.join();
  }

  static int getRandomId() {
    var rng = new Random();
    return rng.nextInt(1000000000);
  }
}

class AppImages {
  static const controller = 'assets/images/categories/controller.png';
  static const mascara = 'assets/images/categories/mascara.png';
  static const monitor = 'assets/images/categories/monitor.png';
  static const phone = 'assets/images/categories/phone.png';
  static const skinfood = 'assets/images/categories/skinfood.png';
  static const skincare = 'assets/images/categories/skincare.png';
  static const perfume = 'assets/images/categories/perfume.png';
  static const accessory = 'assets/images/categories/accessory.png';
  static const other = 'assets/images/categories/other.png';
  static const shirt = 'assets/images/categories/shirt.png';
  static const sofa = 'assets/images/categories/sofa.png';
  static const homeTheatre = 'assets/images/categories/home_theatre.png';
  static const kid = 'assets/images/latest_items/kid.jpg';
  static const kid2 = 'assets/images/latest_items/kid2.jpg';
  static const man = 'assets/images/latest_items/man.jpg';
  static const woman = 'assets/images/latest_items/woman.jpg';
  static const vitamine = 'assets/images/latest_items/vitamine.jpg';
  static const fragrance = 'assets/images/latest_items/fragrance.jpg';
  static const runningShoesBlack =
      'assets/images/products/runningshoes-black.png';
  static const runningShoesBlue =
      'assets/images/products/runningshoes-blue.png';

  static const nikeShoeRed = 'assets/images/products/nikeshoe-red.png';

  static const bootsBlack = 'assets/images/products/boots-black.png';
  static const bootsMushroom = 'assets/images/products/boots-mushroom.png';
  static const bootsHthrGrey = 'assets/images/products/boots-hthrgrey.png';

  static const backpackGrey = 'assets/images/products/backpack-grey.png';
  static const backpackBlue = 'assets/images/products/backpack-blue.png';
  static const backpackRed = 'assets/images/products/backpack-red.png';

  static const scarfGrey = 'assets/images/products/scarf-grey.png';
  static const scarfBlue = 'assets/images/products/scarf-blue.png';

  static const empty = 'assets/images/empty.png';
  static const logo = 'assets/images/logo.png';
  static const logoWhite = 'assets/images/logo-white.png';
  static const jane = 'assets/images/jane.jpg';

  static const shopBanner = 'assets/images/shop/banner.jpg';
  static const shopSlider1 = 'assets/images/shop/slider1.jpg';
  static const shopSlider2 = 'assets/images/shop/slider2.jpg';
}
