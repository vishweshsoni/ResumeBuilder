class User{
    var id;
    var user_id;
    User({this.id,this.user_id});
    User.fromJson(Map<String,dynamic> json){
        id=json['id'];
        user_id=json['user_id'];
    }
    Map<String,dynamic> toJson(){
        final Map<String,dynamic> data= new Map<String,dynamic>();
        data['id']=this.id;
        data['user_id']=this.user_id;
        return data;
    }
}