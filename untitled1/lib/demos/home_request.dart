import 'http_request.dart';
class HomeRequest {
  static requestMovieList(int start) async {
    // 1.构建URL
    final movieURL = "http://47.97.202.211:16666/user/loginAccount";
    // 2.发送网络请求获取结果
    final result = await LYHttpRequest.request(movieURL);

    print("result is $result");
  }
}

