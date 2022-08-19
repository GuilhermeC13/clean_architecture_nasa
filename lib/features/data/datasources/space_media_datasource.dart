import 'package:clean_architecture_nasa/features/data/models/space_media_model.dart';

abstract class SpaceMediaDatasource {
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date);
}
