class VideoModel {
  final String id;
  final String title;
  final String description;
  final VideoThumbnails thumbnails;
  // final VideoDetails contentDetails;
  // final VideoMetaData metaData;

  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnails,
  });

  @override
  String toString() =>
      'id: $id\ntitle: $title\ndescription\nthumbnails: $thumbnails\n';

  factory VideoModel.fromMap(Map<String, dynamic> json) =>
      _videoModelFromMap(json);

  factory VideoModel.fromSearchMap(Map<String, dynamic> json) =>
      _videoModelFromSearchMap(json);
}

VideoModel _videoModelFromSearchMap(Map<String, dynamic> json) {
  final Map<String, dynamic> snippet = json['snippet'];

  final String id = json['id']['videoId'];
  final String title = snippet['title'];
  final String description = snippet['description'];
  final VideoThumbnails thumbnails =
      VideoThumbnails.fromMap(snippet['thumbnails']);

  return VideoModel(
    id: id,
    title: title,
    description: description,
    thumbnails: thumbnails,
  );
}

VideoModel _videoModelFromMap(Map<String, dynamic> json) {
  final String id = json['id'];
  final Map<String, dynamic> snippet = json['snippet'];

  final String title = snippet['title'];
  final String description = snippet['description'];
  final VideoThumbnails thumbnails =
      VideoThumbnails.fromMap(snippet['thumbnails']);

  return VideoModel(
    id: id,
    title: title,
    description: description,
    thumbnails: thumbnails,
  );
}

class VideoThumbnails {
  final VideoThumbnail defaultTh;
  final VideoThumbnail mediumTh;
  final VideoThumbnail highTh;
  final VideoThumbnail? standardTh;

  VideoThumbnails({
    required this.defaultTh,
    required this.mediumTh,
    required this.highTh,
    this.standardTh,
  });

  @override
  String toString() =>
      '\tdefault: $defaultTh\n\tmedium: $mediumTh\n\thigh: $highTh\n\tstandard: $standardTh';

  factory VideoThumbnails.fromMap(Map<String, dynamic> json) =>
      _thumbnailsFromMap(json);
}

VideoThumbnails _thumbnailsFromMap(Map<String, dynamic> json) {
  return VideoThumbnails(
    defaultTh: VideoThumbnail.fromMap(json['default']),
    mediumTh: VideoThumbnail.fromMap(json['medium']),
    highTh: VideoThumbnail.fromMap(json['high']),
  );
}

class VideoThumbnail {
  final String url;
  final int width;
  final int height;

  VideoThumbnail({
    required this.url,
    required this.width,
    required this.height,
  });

  @override
  String toString() => '\t\turl: $url\n\t\twidth: $width\n\t\theight: $height';

  factory VideoThumbnail.fromMap(Map<String, dynamic> json) =>
      _videoThumbnailFromMap(json);
}

VideoThumbnail _videoThumbnailFromMap(Map<String, dynamic> json) {
  return VideoThumbnail(
    url: json['url'],
    width: json['width'],
    height: json['height'],
  );
}
