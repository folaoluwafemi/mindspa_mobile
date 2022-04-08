import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mindspa_mobile/src/models/video/video_model.dart';
import 'package:mindspa_mobile/src/services/Video/video_api.dart';
import 'package:mindspa_mobile/src/services/base/failure.dart';

class YoutubeApi implements VideoApi {
  final Client client = Client();

  @override
  Future<List<VideoModel>> getVideos() async {
    try {
      Uri url = Uri.parse(
          'https://www.googleapis.com/youtube/v3/videos?part=snippet,status,id,contentDetails&chart=mostPopular');

      Response response = await client.get(url);

      if (response.statusCode != 200) {
        return Future.error(
            Failure('unable to get data at this moment'), StackTrace.current);
      }

      Map<String, dynamic> result = jsonDecode(response.body);

      List<Map<String, dynamic>> rawVideos = result['items'];
      List<VideoModel> videos = [];

      for (var elements in rawVideos) {
        videos.add(VideoModel.fromMap(elements));
      }

      return videos;
    } on SocketException {
      throw Failure('check internet connection and try again');
    } on FormatException {
      throw Failure('format exception');
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  getVideosByCategory() {}

  @override
  getVideosById() {}

  @override
  searchVideos() {
    // TODO: implement searchVideos
    throw UnimplementedError();
  }

  @override
  userAuth() {}
}
