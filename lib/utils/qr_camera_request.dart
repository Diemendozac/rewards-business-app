
import 'package:flutter/cupertino.dart';


abstract class BaseProvider {
  Future<dynamic> requestQRData(String id, BuildContext context);
}


class CustomerProvider extends BaseProvider {
  @override
  Future<dynamic> requestQRData(String id, BuildContext context) async {
  }
}

class GiftCardProvider extends BaseProvider {
  @override
  Future<dynamic> requestQRData(String id, BuildContext context) async {
  }
}

class VoucherProvider extends BaseProvider {
  @override
  Future<dynamic> requestQRData(String id, BuildContext context) async {
  }
}

class QRProvider {
  BaseProvider? getProvider(String action) {
    switch (action) {
      case 'customer':
        return CustomerProvider();
      case 'gift_card':
        return GiftCardProvider();
      case 'voucher':
        return VoucherProvider();
      default:
        return null;
    }
  }

  Future<dynamic> getQrRequestData(String action, String id, BuildContext context) async {
    BaseProvider? provider = getProvider(action);
    if (provider != null) {
      return await provider.requestQRData(id, context);
    } else {
      throw Exception('Proveedor no encontrado');
    }
  }
}
