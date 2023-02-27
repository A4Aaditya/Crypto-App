import 'package:flutter/material.dart';
import 'package:travan_code_app/model/crypto.dart';
import 'package:travan_code_app/presentation/crypto_detail/view/crypto_detail_screen.dart';
import 'package:travan_code_app/utils/crypto_style.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    super.key,
    required this.cryptos,
  });
  final CryptoModel cryptos;

  @override
  Widget build(BuildContext context) {
    final quote = cryptos.quote['USD'];
    final isNegative = quote?.percentChange24h.isNegative ?? false;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: InkWell(
        onTap: () => onCardTap(context),
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                child: Text(cryptos.symbol[0]),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cryptos.name,
                    style: CryptoTextStyle.body1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Vol.${cryptos.totalSupply.toStringAsFixed(3)}',
                    style: CryptoTextStyle.body3,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    quote?.percentChange24h.toStringAsFixed(3) ?? '',
                    style: CryptoTextStyle.body3.copyWith(
                      color: isNegative ? Colors.red : Colors.green,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'USD ${quote?.price.toStringAsFixed(3)}',
                    style: CryptoTextStyle.body3,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
              // Text(crypto.symbol, style: CryptoStyle.body2),
              // Text(crypto.totalSupply.toString()),
              // Text(crypto.cmcRank.toString()),
              // Text(crypto.id.toString()),
              // Text(crypto.dateAdded),
              // Text(crypto.lastUpdated),
              // Text(crypto.selfReportedMarketCap.toString()),
              // Text(crypto.selfReportedMarketCap.toString()),
              // Text(crypto.tvlRatio.toString()),
            ],
          ),
        ),
      ),
    );
  }

  void onCardTap(
    BuildContext context,
  ) {
    final route = MaterialPageRoute(
      builder: (context) => CryptoDetailScreen(
        cryptos: cryptos,
      ),
    );
    Navigator.push(context, route);
  }
}
