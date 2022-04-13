import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mindspa_mobile/src/core/utilities/keys.dart';
import 'package:mindspa_mobile/src/services/Video/video_api.dart';

import '../../app/app.logger.dart';
import '../../core/constant/youtube_api_strings.dart';
import '../../models/video/video_model.dart';
import '../base/failure.dart';

class YoutubeApi implements VideoApi {
  final Client client = Client();
  final _log = getLogger('YoutubeApi');
  String _searchNextPageToken = '';
  String _videosNextPageToken = '';

  @override
  Future<Response> getResponse(
    bool isVideoList, {

    /// for video and  search
    String part = 'snippet',

    /// for video only
    String chart = '',

    /// for search only
    String topicId = lifestyleTopic,
    String q = '',
  }) async {
    String urlHead = scheme + subDomain + secondLevel + topLevel + path;
    Uri videoListUrl = Uri.parse(
        urlHead + '/videos?part=$part&maxResult=10&pageToken=$_videosNextPageToken&chart=$chart&key=$API_KEY');
    Uri videoSearchUrl = Uri.parse(urlHead +
        '/search?part=snippet&pageToken=$_searchNextPageToken&safeSearch=strict&topicId=$topicId&type=video&q=$q&key=$API_KEY');

    Uri url = (isVideoList) ? videoListUrl : videoSearchUrl;

    return await client.get(url, headers: {
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
      _videosNextPageToken = result['nextPageToken'];
      List<dynamic> rawVideos = result['items'] as List<dynamic>;

      List<VideoModel> videos = [];

      for (var element in rawVideos) {
        try {
          VideoModel video = VideoModel.fromMap(element);
          videos.add(video);
          _log.d(video);
        } catch (e) {
          throw Failure(e.toString());
        }
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
      _searchNextPageToken = rawSearchResult['nextPageToken'];
      List<dynamic> rawVideoList = rawSearchResult['items'] as List<dynamic>;
      List<VideoModel> videoList = [];
      for (var element in rawVideoList) {
        videoList.add(VideoModel.fromSearchMap(element));
      }
      _log.d(videoList);
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
