import 'dart:async';

import 'package:flutter/services.dart';

class FlutterArcfacePlugin {
  static const MethodChannel _channel = const MethodChannel('flutter_arcface_plugin');

  ///激活SDK.
  ///[ak]: APP KEY
  ///[sk]: SDK KEY
  static Future<int> active(String ak, String sk) async {
    assert(ak != null && ak.isNotEmpty);
    assert(sk != null && sk.isNotEmpty);
    final int activeCode = await _channel.invokeMethod('active', {'ak': ak, 'sk': sk});
    return activeCode;
  }

  ///提取人脸特征.
  static Future<dynamic> extract() async {
    final dynamic result = await _channel.invokeMethod('extract');
    return result;
  }

  ///人脸识别，返回相识度[0~1.0].
  ///[srcFeatureData] 经过BASE64编码后的源人脸特征.
  ///[similarThreshold] 相似度阀值.
  static Future<double> recognize(String srcFeatureData, double similarThreshold) async {
    assert(srcFeatureData != null && srcFeatureData.isNotEmpty);
    assert(similarThreshold != null && similarThreshold > 0.0);
    final double similar = await _channel.invokeMethod(
        'recognize', {'src_feature': srcFeatureData, 'similar_threshold': similarThreshold});
    return similar;
  }
}
