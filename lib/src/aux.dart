// Black Unicorn Wallpapers by Alexander Abraham, The Black Unicorn.
// Licensed under the MIT license.

List<dynamic> buildWallpaperList(Map<String, dynamic> userData){
  List<dynamic> result = [];
  for (int i = 0; i < userData.length; i++){
    String key = userData.keys.elementAt(i);
    List<dynamic> pictureList = userData[key];
    result = result + pictureList;
  }
  return result;
}
