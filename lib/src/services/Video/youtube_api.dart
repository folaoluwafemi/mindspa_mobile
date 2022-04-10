import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mindspa_mobile/src/app/app.locator.dart';
import 'package:mindspa_mobile/src/app/app.logger.dart';
import 'package:mindspa_mobile/src/core/constant/youtube_api_strings.dart';
import 'package:mindspa_mobile/src/core/utilities/keys.dart';
import 'package:mindspa_mobile/src/models/video/video_model.dart';
import 'package:mindspa_mobile/src/services/Video/video_api.dart';
import 'package:mindspa_mobile/src/services/base/failure.dart';

class YoutubeApi implements VideoApi {
  final Client client = Client();
  final _log = getLogger('YoutubeApi');
  String nextPageToken = '';
  String prevPageToken = '';

  ///parent topic for all types of music

  @override
  Future<Response> getResponse(
    bool isVideoList, {

    /// for video and  search
    String part = 'snippet',
    String pageToken = '',

    /// for video only
    String chart = '',

    /// for search only
    String topicId = '',
    String q = '',
  }) async {
    String urlHead = scheme + subDomain + secondLevel + topLevel + path;

    Uri videoListUrl = Uri.parse(urlHead + '/videos?part=$part&chart=$chart');
    Uri videoSearchUrl = Uri.parse(urlHead +
        '/search?part=snippet&pageToken=$pageToken&safeSearch=strict&topicId=$topicId&type=video&q=$q&key=$API_KEY');

    Uri url = (isVideoList) ? videoListUrl : videoSearchUrl;

    return await client.get(url, headers: {
      'Authorization': 'Bearer $API_KEY',
      'Accept': 'application/json',
    });
  }

  @override
  Future<List<VideoModel>> getVideos() async {
    try {
      Response response = await getResponse(true,
          chart: 'mostPopular', part: 'snippet,status,id,contentDetails');

      if (response.statusCode != 200) {
        _log.d(response.body);
        return Future.error(
            Failure('unable to get data at this moment'), StackTrace.current);
      }

      Map<String, dynamic> result = jsonDecode(response.body);

      nextPageToken = result['nextPageToken'];
      prevPageToken = result['prevPageToken'];

      List<Map<String, dynamic>> rawVideos = result['items'];

      List<VideoModel> videos = [];

      for (var elements in rawVideos) {
        VideoModel video = VideoModel.fromMap(elements);
        videos.add(video);
        _log.d(video);
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
  Future<List<VideoModel>> searchVideos({
    String q = '',
    String topicId = '',
  }) async {
    try {
      Response response = await getResponse(false, q: q, topicId: topicId);

      if (response.statusCode != 200) {
        return Future.error(
            Failure('unable to get data at this moment'), StackTrace.current);
      }

      Map<String, dynamic> rawSearchResult = jsonDecode(response.body);

      nextPageToken = rawSearchResult['nextPageToken'];
      prevPageToken = rawSearchResult['prevPageToken'];

      List<Map<String, dynamic>> rawVideoList = rawSearchResult['items'];
      List<VideoModel> videoList = [];

      for (var element in rawVideoList) {
        videoList.add(VideoModel.fromSearchMap(element));
      }

      return videoList;
    } on SocketException {
      throw Failure('check internet connection and try again');
    } on FormatException {
      throw Failure('format exception');
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}
