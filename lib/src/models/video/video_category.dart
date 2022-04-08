class VideoCategory {
  final String nextPageToken;
  final String prevPageToken;
  final List<CategoryResource> videoCategories;

  VideoCategory({
    required this.nextPageToken,
    required this.prevPageToken,
    required this.videoCategories,
  });

  @override
  String toString() =>
      'nextPageToken: $nextPageToken\npreviousPageToken: $prevPageToken\nvideoCategories: $videoCategories';

  factory VideoCategory.fromMap(Map<String, dynamic> json) =>
      _videoCategoryFromMap(json);
}

VideoCategory _videoCategoryFromMap(Map<String, dynamic> json) {
  List<Map<String, dynamic>> categorylist =
      json['items'] as List<Map<String, dynamic>>;
  List<CategoryResource> resources = [];
  for (var element in categorylist) {
    resources.add(CategoryResource.fromMap(element));
  }

  return VideoCategory(
    nextPageToken: json['nextPageToken'],
    prevPageToken: json['prevPageToken'],
    videoCategories: resources,
  );
}

class CategoryResource {
  final String id;
  final String channelId;
  final String title;

  @override
  String toString() => '\tid: $id\n\ttitle: $title\n\tchannelId: $channelId\n';

  CategoryResource({
    required this.id,
    required this.title,
    required this.channelId,
  });

  factory CategoryResource.fromMap(Map<String, dynamic> json) =>
      _categoryResourceFromMap(json);
}

CategoryResource _categoryResourceFromMap(Map<String, dynamic> json) {
  return CategoryResource(
    id: json['id'],
    channelId: json['snippet']['channelId'],
    title: json['title'],
  );
}
