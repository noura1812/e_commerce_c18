import 'package:dio/dio.dart';
import 'package:e_commerce_c18/core/network/endpoints.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkDependency {
  // @preResolve
  Dio get dio {
    Dio _dio = Dio(BaseOptions(baseUrl: Endpoints.baseUrl));
    _dio.interceptors.add(NetworkInterceptor());

    return _dio;
  }
}

class NetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest

    print('--REQUEST--');
    print('-URL:-${options.path}--');
    print('-DATA:-${options.data}--');
    print('-HEADERS:-${options.headers}--');
    print('--END--');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse

    super.onResponse(response, handler);
    print('--RESPOSE--');
    print('-URL:-${response.realUri}--');
    print('-DATA:-${response.data}--');
    print('-HEADERS:-${response.headers}--');
    print('--END--');
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    print('--ERROR--');
    print('-URL:-${err.response?.realUri}--');

    print('-DATA:-${err.response?.data}--');
    print('-HEADERS:-${err.response?.headers}--');
    print('--END--');
    super.onError(err, handler);
  }
}
