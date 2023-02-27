class QuoteModel {
  final num price;
  final num volume24h;
  final num volumeChange24h;
  final num percentChange1h;
  final num percentChange24h;
  final num percentChange7d;
  final num percentChange30d;
  final num percentChange60d;
  final num percentChange90d;
  final num marketCap;
  final num marketCapDominance;
  final num fullyDilutedMarketCap;
  final dynamic tvl;
  final String lastUpdated;
  QuoteModel({
    required this.volume24h,
    required this.price,
    required this.volumeChange24h,
    required this.percentChange1h,
    required this.percentChange24h,
    required this.percentChange7d,
    required this.percentChange30d,
    required this.percentChange60d,
    required this.percentChange90d,
    required this.marketCap,
    required this.marketCapDominance,
    required this.fullyDilutedMarketCap,
    required this.tvl,
    required this.lastUpdated,
  });

  factory QuoteModel.fromMap(Map<String, dynamic> j) {
    return QuoteModel(
      volume24h: j['volume_24h'],
      price: j['price'],
      volumeChange24h: j['volume_change_24h'],
      percentChange1h: j['percent_change_1h'],
      percentChange24h: j['percent_change_24h'],
      percentChange7d: j['percent_change_7d'],
      percentChange30d: j['percent_change_30d'],
      percentChange60d: j['percent_change_60d'],
      percentChange90d: j['percent_change_90d'],
      marketCap: j['market_cap'],
      marketCapDominance: j['market_cap_dominance'],
      fullyDilutedMarketCap: j['fully_diluted_market_cap'],
      tvl: j['tvl'],
      lastUpdated: j['last_updated'],
    );
  }
}
