class PaginationModel<T> {
  final List<T> items;
  final int currentPage;
  final bool hasMoreItems;

  PaginationModel({
    required this.items,
    required this.currentPage,
    required this.hasMoreItems,
  });

  PaginationModel<T> copyWith({
    List<T>? items,
    int? currentPage,
    bool? hasMoreItems,
  }) {
    return PaginationModel<T>(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      hasMoreItems: hasMoreItems ?? this.hasMoreItems,
    );
  }
}
