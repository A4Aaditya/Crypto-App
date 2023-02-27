import 'package:travan_code_app/model/quotes.dart';

class CryptoModel {
  CryptoModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.numMarketPairs,
    required this.dateAdded,
    required this.tags,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.platform,
    required this.cmcRank,
    required this.selfReportedCirculatingSupply,
    required this.selfReportedMarketCap,
    required this.tvlRatio,
    required this.lastUpdated,
    required this.quote,
  });
  final int id;
  final String name;
  final String symbol;
  final String slug;
  final num numMarketPairs;
  final String dateAdded;
  final List<String> tags;
  final num? maxSupply;
  final num circulatingSupply;
  final num totalSupply;
  final dynamic platform;
  final num cmcRank;
  final dynamic selfReportedCirculatingSupply;
  final dynamic selfReportedMarketCap;
  final dynamic tvlRatio;
  final String lastUpdated;
  final Map<String, QuoteModel> quote;

  factory CryptoModel.fromMap(Map<String, dynamic> json) {
    final quote = json['quote'] as Map;
    final quotes = quote.map(
      (key, value) => MapEntry(key.toString(), QuoteModel.fromMap(value)),
    );
    return CryptoModel(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      slug: json['slug'],
      numMarketPairs: json['num_market_pairs'],
      dateAdded: json['date_added'],
      tags: (json['tags'] as List? ?? []).map((e) => e.toString()).toList(),
      maxSupply: json['max_supply'],
      circulatingSupply: json['circulating_supply'],
      totalSupply: json['total_supply'],
      platform: json['platform'],
      cmcRank: json['cmc_rank'],
      selfReportedCirculatingSupply: json['self_reported_circulating_supply'],
      selfReportedMarketCap: json['self_reported_market_cap'],
      tvlRatio: json['tvl_ratio'],
      lastUpdated: json['last_updated'],
      quote: quotes,
    );
  }
}
