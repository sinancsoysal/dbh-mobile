import '../../../../../dtos/remote/dbh_api/topics/settings/role_claim_dto.dart';
import '../../../../base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_result_of_enumerable_of_role_claim_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfRoleClaimDto
    implements BaseResponseModel<List<RoleClaimDto>> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final List<RoleClaimDto>? data;
  ApiResultOfEnumerableOfRoleClaimDto({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });
  factory ApiResultOfEnumerableOfRoleClaimDto.fromJson(
          Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfRoleClaimDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ApiResultOfEnumerableOfRoleClaimDtoToJson(this);
}
