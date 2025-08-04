/// currentPage : 1
/// numberOfPages : 1
/// limit : 40

class Metadata {
  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory Metadata.fromJson(dynamic json) {
    return Metadata(
      currentPage: json['currentPage'],
      numberOfPages: json['numberOfPages'],
      limit: json['limit'],
    );
  }

  int currentPage;
  int numberOfPages;
  int limit;
}
