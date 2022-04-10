abstract class VideoApi {
  dynamic getResponse(
    bool isVideoList, {
    String chart = '',
    String topicId = '',
    String q = '',
    String pageToken = '',
  });

  dynamic getVideos();

  dynamic searchVideos({
    String q = '',
    String topicId = '',
  });
}
