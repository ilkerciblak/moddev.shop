class QueryParameters {
  final int? limit;
  final int? skip;
  final List<String>? select;
  final String? sortBy;
  final OrderEnum? orderBy;

  QueryParameters({
    this.limit,
    this.skip,
    this.select,
    this.sortBy,
    this.orderBy,
  });

  Map<String, String>? toQueryParameter() {
    Map<String, String> result = {};

    if (limit != null) result.addAll({'limit': limit.toString()});
    if (skip != null) result.addAll({'skip': skip.toString()});
    if (select != null) result.addAll({'select': select!.join(',')});
    if (sortBy != null) result.addAll({'sortBy': sortBy!});
    if (orderBy != null) result.addAll({'orderBy': orderBy!.name});

    return result.isNotEmpty ? result : null;
  }
}

enum OrderEnum {
  ascending(name: 'asc'),
  descending(name: 'desc');

  final String name;

  const OrderEnum({required this.name});
}
