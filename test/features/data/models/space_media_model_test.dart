import 'dart:convert';

import 'package:clean_architecture_nasa/features/data/models/space_media_model.dart';
import 'package:clean_architecture_nasa/features/domain/entities/space_media_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/space_media_mock.dart';

void main() {
  final tSpaceMediaModel = SpaceMediaModel(
    explanation:
        "The annual Perseid meteor shower was near its peak on August 13. As planet Earth crossed through streams of debris left by periodic Comet Swift-Tuttle meteors rained in northern summer night skies. But even that night's nearly Full Moon shining near the top of this composited view couldn't hide all of the popular shower's meteor streaks. The image captures some of the brightest perseid meteors in many short exposures recorded over more than two hours before the dawn. It places the shower's radiant in the heroic constellation of Perseus just behind a well-lit medieval tower in the village of Sant Llorenc de la Muga, Girona, Spain. Observed in medieval times, the Perseid meteor shower is also known in Catholic tradition as the Tears of St. Lawrence, and festivities are celebrated close to the annual peak of the meteor shower. Joining the Full Moon opposite the Sun, bright planet Saturn also shines in the frame at the upper right.",
    media_type: "image",
    title: "Full Moon Perseids",
    url: "https://apod.nasa.gov/apod/image/2208/perseids2022jcc2k800.jpg",
  );

  test('should be a subclass of SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('shoudl return a valid model', () {
    // Arrange
    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);
    // act
    final result = SpaceMediaModel.fromJson(jsonMap);
    // Assert
    expect(result, tSpaceMediaModel);
  });

  test('should return a json map containing the proper data', () {
    // Arrange
    final expectedMap = {
      "explanation":
          "The annual Perseid meteor shower was near its peak on August 13. As planet Earth crossed through streams of debris left by periodic Comet Swift-Tuttle meteors rained in northern summer night skies. But even that night's nearly Full Moon shining near the top of this composited view couldn't hide all of the popular shower's meteor streaks. The image captures some of the brightest perseid meteors in many short exposures recorded over more than two hours before the dawn. It places the shower's radiant in the heroic constellation of Perseus just behind a well-lit medieval tower in the village of Sant Llorenc de la Muga, Girona, Spain. Observed in medieval times, the Perseid meteor shower is also known in Catholic tradition as the Tears of St. Lawrence, and festivities are celebrated close to the annual peak of the meteor shower. Joining the Full Moon opposite the Sun, bright planet Saturn also shines in the frame at the upper right.",
      "media_type": "image",
      "title": "Full Moon Perseids",
      "url": "https://apod.nasa.gov/apod/image/2208/perseids2022jcc2k800.jpg"
    };
    // act
    final result = tSpaceMediaModel.toJson();
    // Assert
    expect(result, expectedMap);
  });
}
