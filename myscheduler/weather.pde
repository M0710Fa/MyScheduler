void dispweather() {
  background(192);
  fill(0);
  text(title, 10, 30);
  for (int i = 0; i < forecasts.size(); i++) {
    JSONObject f = forecasts.getJSONObject(i);
    String s = f.getString("dateLabel") + ":" + f.getString("telop");
    JSONObject t = f.getJSONObject("temperature");
    if (!t.isNull("min")) {
      String d = t.getJSONObject("min").getString("celsius");
      s = s + ", min:" + d;
    }
    if (!t.isNull("max")) {
      String d = t.getJSONObject("max").getString("celsius");
      s = s + ", max:" + d;
    }
    textFont( Font );
    text(s, 10, 100 + 50 * i);
  }
  //ホームに戻るよう
  fill(255);
  rect(370, 430, 70, 50);
  fill(0);
  textSize(24);
  text("HOME", 380, 460);
}
