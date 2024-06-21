
import 'package:flutter/material.dart';


class ImageProviderHelper {
  static ImageProvider getImageProvider(String? photoUrl) {

    if (photoUrl == null || !Uri.parse(photoUrl).isAbsolute ) {
      // Si el photoUrl es nulo, devuelve una imagen Asset
      return const AssetImage('assets/images/Profile Image.png');
    } else {
      // Si el photoUrl no es nulo, devuelve una imagen de la red
      return NetworkImage(photoUrl);
    }
  }
}