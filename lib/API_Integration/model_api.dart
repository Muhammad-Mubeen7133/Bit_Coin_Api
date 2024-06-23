class BitCoinModel {
  final Time time;
  final String disclaimer;
  final String chartName;
  final Bpi bpi;

  BitCoinModel({
    required this.time,
    required this.disclaimer,
    required this.chartName,
    required this.bpi,
  });

  factory BitCoinModel.fromJson(Map<String, dynamic> json) {
    return BitCoinModel(
      time: Time.fromJson(json['time']),
      disclaimer: json['disclaimer'],
      chartName: json['chartName'],
      bpi: Bpi.fromJson(json['bpi']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time.toJson(),
      'disclaimer': disclaimer,
      'chartName': chartName,
      'bpi': bpi.toJson(),
    };
  }
}

class Time {
  final String updated;
  final String updatedISO;
  final String updateduk;

  Time({
    required this.updated,
    required this.updatedISO,
    required this.updateduk,
  });

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      updated: json['updated'],
      updatedISO: json['updatedISO'],
      updateduk: json['updateduk'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'updated': updated,
      'updatedISO': updatedISO,
      'updateduk': updateduk,
    };
  }
}

class Bpi {
  final Currency USD;
  final Currency GBP;
  final Currency EUR;

  Bpi({
    required this.USD,
    required this.GBP,
    required this.EUR,
  });

  factory Bpi.fromJson(Map<String, dynamic> json) {
    return Bpi(
      USD: Currency.fromJson(json['USD']),
      GBP: Currency.fromJson(json['GBP']),
      EUR: Currency.fromJson(json['EUR']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'USD': USD.toJson(),
      'GBP': GBP.toJson(),
      'EUR': EUR.toJson(),
    };
  }
}

class Currency {
  final String code;
  final String symbol;
  final String rate;
  final String description;
  final double rateFloat;

  Currency({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'],
      symbol: json['symbol'],
      rate: json['rate'],
      description: json['description'],
      rateFloat: json['rate_float'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'symbol': symbol,
      'rate': rate,
      'description': description,
      'rate_float': rateFloat,
    };
  }
}
