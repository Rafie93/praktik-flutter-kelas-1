import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class S3Service {
  final Dio _dio = Dio();

  Future<String?> uploadFile(File file, String fileName) async {
    await dotenv.load();

    final awsAccessKey = dotenv.env['AWS_ACCESS_KEY_ID'];
    final awsSecretKey = dotenv.env['AWS_SECRET_ACCESS_KEY'];
    final region = dotenv.env['AWS_REGION'];
    final bucketName = dotenv.env['AWS_BUCKET_NAME'];

    try {
      // Generate pre-signed URL (alternatif: gunakan API Gateway/Lambda)
      final preSignedUrl = await _getPreSignedUrl(
        fileName: fileName,
        awsAccessKey: awsAccessKey!,
        awsSecretKey: awsSecretKey!,
        region: region!,
        bucketName: bucketName!,
      );

      // Upload file menggunakan pre-signed URL
      await _dio.put(
        preSignedUrl,
        data: await file.readAsBytes(),
        options: Options(
          headers: {
            'Content-Type': 'image/jpeg', // Sesuaikan dengan tipe file
          },
        ),
      );

      return 'https://$bucketName.s3.$region.amazonaws.com/$fileName';
    } catch (e) {
      print('Error uploading to S3: $e');
      return null;
    }
  }

  Future<String> _getPreSignedUrl({
    required String fileName,
    required String awsAccessKey,
    required String awsSecretKey,
    required String region,
    required String bucketName,
  }) async {
    final now = DateTime.now().toUtc();
    final expiry = now.add(const Duration(minutes: 5)).toUtc();

    final canonicalUri = '/$bucketName/$fileName';
    final canonicalQueryString = '';
    final canonicalHeaders = 'host:$bucketName.s3.$region.amazonaws.com\n';
    const signedHeaders = 'host';

    final payloadHash = 'UNSIGNED-PAYLOAD';
    final credentialScope =
        '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}/$region/s3/aws4_request';

    final canonicalRequest = '''
          PUT
          $canonicalUri
          $canonicalQueryString
          $canonicalHeaders
          $signedHeaders
          $payloadHash
          ''';

    final stringToSign = '''
          AWS4-HMAC-SHA256
          ${now.toIso8601String().substring(0, 19).replaceAll(RegExp(r'[^\dT]'), '')}Z
          $credentialScope
          ${_sha256Hash(canonicalRequest)}
          ''';

    final signingKey = _getSignatureKey(awsSecretKey, now, region, 's3');
    final signature = _hmacSha256(signingKey, stringToSign);

    return 'https://$bucketName.s3.$region.amazonaws.com/$fileName?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=${Uri.encodeComponent('$awsAccessKey/$credentialScope')}&X-Amz-Date=${now.toIso8601String().substring(0, 19).replaceAll(RegExp(r'[^\dT]'), '')}Z&X-Amz-Expires=300&X-Amz-SignedHeaders=$signedHeaders&X-Amz-Signature=$signature';
  }

  String _sha256Hash(String input) {
    // Implementasi SHA256 (gunakan package crypto)
    return input; // Ganti dengan implementasi sebenarnya
  }

  List<int> _hmacSha256(List<int> key, String message) {
    // Implementasi HMAC-SHA256 (gunakan package crypto)
    return []; // Ganti dengan implementasi sebenarnya
  }

  List<int> _getSignatureKey(
      String key, DateTime date, String region, String service) {
    // Implementasi kunci signature
    return []; // Ganti dengan implementasi sebenarnya
  }
}
