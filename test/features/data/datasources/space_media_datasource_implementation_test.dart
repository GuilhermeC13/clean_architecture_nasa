import 'package:clean_architecture_nasa/core/http_client/http_client.dart';
import 'package:clean_architecture_nasa/core/usecase/errors/exceptions.dart';
import 'package:clean_architecture_nasa/core/utils/converters/date_to_string_converter.dart';
import 'package:clean_architecture_nasa/core/utils/keys/nasa_api_keys.dart';
import 'package:clean_architecture_nasa/features/data/datasources/endpoints/nasa_endpoints.dart';
import 'package:clean_architecture_nasa/features/data/datasources/space_media_datasource.dart';
import 'package:clean_architecture_nasa/features/data/datasources/space_media_datasource_implementation.dart';
import 'package:clean_architecture_nasa/features/data/models/space_media_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/space_media_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late SpaceMediaDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = SpaceMediaDatasourceImplementation(client);
  });

  final tDateTime = DateTime(2022, 08, 18);
  final urlExpected = NasaEndpoints.apod(
      NasaApiKeys.apiKey, DateToStringConverter.convert(tDateTime));

  test('should call the get method with correct url', () async {
    // Arrange
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
    // act
    await datasource.getSpaceMediaFromDate(tDateTime);
    // Assert
    verify(() => client.get(urlExpected));
  });

  test('shoudl return a SpaceMediaModel when is successful', () async {
    // Arrange
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
    const expectedMap = SpaceMediaModel(
        explanation:
            "The annual Perseid meteor shower was near its peak on August 13. As planet Earth crossed through streams of debris left by periodic Comet Swift-Tuttle meteors rained in northern summer night skies. But even that night's nearly Full Moon shining near the top of this composited view couldn't hide all of the popular shower's meteor streaks. The image captures some of the brightest perseid meteors in many short exposures recorded over more than two hours before the dawn. It places the shower's radiant in the heroic constellation of Perseus just behind a well-lit medieval tower in the village of Sant Llorenc de la Muga, Girona, Spain. Observed in medieval times, the Perseid meteor shower is also known in Catholic tradition as the Tears of St. Lawrence, and festivities are celebrated close to the annual peak of the meteor shower. Joining the Full Moon opposite the Sun, bright planet Saturn also shines in the frame at the upper right.",
        media_type: "image",
        title: "Full Moon Perseids",
        url: "https://apod.nasa.gov/apod/image/2208/perseids2022jcc2k800.jpg");
    // act
    final result = await datasource.getSpaceMediaFromDate(tDateTime);

    // Assert
    expect(result, expectedMap);
  });

  test('should throw a ServerException when not successful', () async {
    // Arrange
    when(() => client.get(any())).thenAnswer((_) async =>
        HttpResponse(data: 'Something went wrong', statusCode: 400));
    // act
    final result = datasource.getSpaceMediaFromDate(tDateTime);
    // Assert
    expect(() => result, throwsA(ServerException()));
  });
}
