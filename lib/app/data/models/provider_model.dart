// note you have to hardcode this part
// for example => (part 'classname.g.dart');
// class name must be in lower case

/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class ProviderModel {
  String? ENTITYID;
  String? ENTITYTYPEID;
  String? ENTITYTYPENAME;
  String? ENTITYNAME;
  String? ENTITYDESCRIPTION;
  String? ENTITYREGNO;

  ProviderModel({this.ENTITYID, this.ENTITYTYPEID, this.ENTITYTYPENAME, this.ENTITYNAME, this.ENTITYDESCRIPTION, this.ENTITYREGNO});

  ProviderModel.fromJson(Map<dynamic, dynamic> json) {
    ENTITYID = json['ENTITY_ID'];
    ENTITYTYPEID = json['ENTITY_TYPE_ID'];
    ENTITYTYPENAME = json['ENTITY_TYPE_NAME'];
    ENTITYNAME = json['ENTITY_NAME'];
    ENTITYDESCRIPTION = json['ENTITY_DESCRIPTION'];
    ENTITYREGNO = json['ENTITY_REG_NO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ENTITY_ID'] = ENTITYID;
    data['ENTITY_TYPE_ID'] = ENTITYTYPEID;
    data['ENTITY_TYPE_NAME'] = ENTITYTYPENAME;
    data['ENTITY_NAME'] = ENTITYNAME;
    data['ENTITY_DESCRIPTION'] = ENTITYDESCRIPTION;
    data['ENTITY_REG_NO'] = ENTITYREGNO;
    return data;
  }
}


