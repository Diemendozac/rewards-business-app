import 'package:flutter/material.dart';
import 'package:loyalty_business_project/utils/image_provider_helper.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../providers/loyalty_wallet_provider.dart';

class CustomerCard extends StatelessWidget {

  const CustomerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoyaltyWalletProvider loyaltyWalletProvider = Provider.of<LoyaltyWalletProvider>(context);

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Skeletonizer(
      enabled: loyaltyWalletProvider.loyaltyWallet == null,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        // Borde redondeado
        margin: const EdgeInsets.only(top: 16, bottom: 8),
        child: Padding(
          padding: const EdgeInsets.all(16), // Relleno dentro de la tarjeta
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fila para la foto y el nombre
              Row(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colorScheme.onSurface,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image(
                            image: ImageProviderHelper.getImageProvider(''))),
                  ),
                  const SizedBox(width: 16),
                  // Espacio entre la foto y el nombre
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${loyaltyWalletProvider.loyaltyWallet?.customerInfo.firstName} ${loyaltyWalletProvider.loyaltyWallet?.customerInfo.lastName}",
                        style: textTheme.titleMedium!.copyWith(
                        ),
                      ),
                      Text(
                        "Birthday: ${loyaltyWalletProvider.loyaltyWallet?.customerInfo.birthDate ?? 'Not specified'}",
                        style: textTheme.bodySmall!.copyWith(
                          color: colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16), // Espacio entre la fila y el resto
              // Resto de la información del cliente
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Document: ${loyaltyWalletProvider.loyaltyWallet?.customerInfo.idDocument} ${loyaltyWalletProvider.loyaltyWallet?.customerInfo.documentType ?? ""}",
                    style: textTheme.bodyLarge!
                  ),
                  Text(
                    "Phone: ${loyaltyWalletProvider.loyaltyWallet?.customerInfo.countryCode ?? ""} ${loyaltyWalletProvider.loyaltyWallet?.customerInfo.phoneNumber ?? "Not Specified"}",
                    style: textTheme.bodyLarge!
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
