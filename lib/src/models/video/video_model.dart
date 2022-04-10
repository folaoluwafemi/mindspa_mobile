class VideoModel {
  final String id;
  final String title;
  final String description;

  // final VideoThumbnails thumbnails;
  // final VideoDetails contentDetails;
  // final VideoMetaData metaData;

  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    // required this.thumbnails,
    // required this.contentDetails,
    // required this.metaData,
  });

  @override
  String toString() =>
      'id: $id\ntitle: $title\ndescription\nthumbnails: thumbnails\ncontentDetails: contentDetails\nmetadata: metaData';

  factory VideoModel.fromMap(Map<String, dynamic> json) =>
      _videoModelFromMap(json);

  factory VideoModel.fromSearchMap(Map<String, dynamic> json) => _videoModelFromSearchMap(json);

}
VideoModel _videoModelFromSearchMap(Map<String, dynamic> json){
  final Map<String, dynamic> snippet = json['snippet'];

  final String id = json['id']['kind']['videoId'];
  final String title = snippet['title'];
  final String description = snippet['description'];
  // final VideoThumbnails thumbnails =
  //     VideoThumbnails.fromMap(snippet['thumbnails']);
  // final VideoDetails details = VideoDetails.fromMap(json['contentDetails']);
  // final VideoMetaData metaData = VideoMetaData.fromMap(snippet);

  return VideoModel(
    id: id,
    title: title,
    description: description,
    // thumbnails: thumbnails,
    // contentDetails: details,
    // metaData: metaData,
  );
}
VideoModel _videoModelFromMap(Map<String, dynamic> json) {
  final String id = json['id'];
  final Map<String, dynamic> snippet = json['snippet'];

  final String title = snippet['title'];
  final String description = snippet['description'];
  // final VideoThumbnails thumbnails =
  //     VideoThumbnails.fromMap(snippet['thumbnails']);
  // final VideoDetails details = VideoDetails.fromMap(json['contentDetails']);
  // final VideoMetaData metaData = VideoMetaData.fromMap(snippet);

  return VideoModel(
    id: id,
    title: title,
    description: description,
    // thumbnails: thumbnails,
    // contentDetails: details,
    // metaData: metaData,
  );
}

// class VideoMetaData {
//   final String categoryId;
//   final String defaultLanguage;
//
//   VideoMetaData({
//     required this.categoryId,
//     required this.defaultLanguage,
//   });
//
//   factory VideoMetaData.fromMap(Map<String, dynamic> json) =>
//       _metaDataFromMap(json);
//
//   @override
//   String toString() {
//     return 'categoryId: $categoryId\ndefaultLanguage: $defaultLanguage';
//   }
//
//   /// final String liveBroadcastContent; // this can be added if necessary
// }
//
// VideoMetaData _metaDataFromMap(Map<String, dynamic> json) {
//   return VideoMetaData(
//     categoryId: json['categoryId'],
//     defaultLanguage: json['defaultLanguage'],
//   );
// }
//
// class VideoDetails {
//   final String duration;
//   final String definition;
//   final String caption;
//
//   VideoDetails({
//     required this.duration,
//     required this.definition,
//     required this.caption,
//   });
//
//   @override
//   String toString() =>
//       'duration: $duration\ndefinition: $definition\ncaption: $caption';
//
//   factory VideoDetails.fromMap(Map<String, dynamic> json) =>
//       _videoDetailsFromMap(json);
// }
//
// VideoDetails _videoDetailsFromMap(Map<String, dynamic> json) {
//   return VideoDetails(
//     duration: json['duration'],
//     definition: json['definition'],
//     caption: json['caption'],
//   );
// }
//
// class VideoThumbnails {
//   final VideoThumbnail defaultTh;
//   final VideoThumbnail mediumTh;
//   final VideoThumbnail highTh;
//   final VideoThumbnail? standardTh;
//
//   VideoThumbnails({
//     required this.defaultTh,
//     required this.mediumTh,
//     required this.highTh,
//     this.standardTh,
//   });
//
//   @override
//   String toString() =>
//       '\tdefault: $defaultTh\n\tmedium: $mediumTh\n\thigh: $highTh\n\tstandard: $standardTh';
//
//   factory VideoThumbnails.fromMap(Map<String, dynamic> json) =>
//       _thumbnailsFromMap(json);
// }
//
// VideoThumbnails _thumbnailsFromMap(Map<String, dynamic> json) {
//   return VideoThumbnails(
//     defaultTh: VideoThumbnail.fromMap(json['default']),
//     mediumTh: VideoThumbnail.fromMap(json['medium']),
//     highTh: VideoThumbnail.fromMap(json['high']),
//   );
// }
//
// class VideoThumbnail {
//   final String url;
//   final int width;
//   final int height;
//
//   VideoThumbnail({
//     required this.url,
//     required this.width,
//     required this.height,
//   });
//
//   @override
//   String toString() => '\t\turl: $url\n\t\twidth: $width\n\t\theight: $height';
//
//   factory VideoThumbnail.fromMap(Map<String, dynamic> json) =>
//       _videoThumbnailFromMap(json);
// }
//
// VideoThumbnail _videoThumbnailFromMap(Map<String, dynamic> json) {
//   return VideoThumbnail(
//     url: json['url'],
//     width: json['width'],
//     height: json['height'],
//   );
// }
