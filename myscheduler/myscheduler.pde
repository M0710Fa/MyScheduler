String baseURL = "http://weather.livedoor.com/forecast/webservice/json/v1?city=";
String city = "017010";
String title;
JSONArray forecasts;
//フォント
PFont Font;

int page=0;//ページ

//月と年
int month=month();
int year=year();

//カレンダー用
int cx, cy;
int cw=60, ch=55;
int[] montharray=new int[0];

//todoリスト用
String todo[];
boolean doflag[]=new boolean[20];

//タイマー用
int t0 = 0;

void setup() {
  size(480, 640);
  //天気予報
  JSONObject w = loadJSONObject(baseURL + city);
  title = w.getString("title");
  forecasts = w.getJSONArray("forecasts");
  //フォント
  Font=loadFont("MS-Gothic-32.vlw");
  //todoリストをロード
  todo=loadStrings("data/todo.txt");
  for (int i=0; i<=todo.length-1; i++) {
    doflag[i]=false;
  }
}

void mouseClicked() {
  //カレンダー////////////////////////////////////////////
  if (page==1) {
    //日付
    if (mouseY>160&&mouseY<185) {
      if (mouseX>10&&mouseX<35) {
        month--;
      }
      if (mouseX>260&&mouseX<285) {
        month++;
      }
    }
    //ホームに戻る
    if (mouseX>370&&mouseX<440&&mouseY>30&&mouseY<80) {
      page=0;
    }
  }

  //ホーム画面///////////////////////////////////////////////////////////
  if (page==0) {
    //todoリスト
    if (mouseX>70&&mouseX<90) {
      for (int i=0; i<=todo(); i++) {
        if (mouseY>40*(i+1)+170&&mouseY<40*(i+1)+190) {
          if (doflag[i]==false) {
            doflag[i]=true;
          } else doflag[i]=false;
        }
      }
    }
    //ホームのボタン
    if (mouseX>0&&mouseX<240) {
      if (mouseY>500&&mouseY<570) {
        page=1;
      }
      if (mouseY>570&&mouseY<640) {
        page=3;
      }
    }
    if (mouseX>240&&mouseX<480) {
      if (mouseY>500&&mouseY<570) {
        page=4;
      }
      if (mouseY>570&&mouseY<640) {
        exit();
      }
    }
  }
  //天気予報////////////////////////////////////
  if (page==3) {
    //ホームに戻る
    if (mouseX>370&&mouseX<440&&mouseY>430&&mouseY<480) {
      page=0;
    }
  }
  //タイマー/////////////////////////////////////
  if (page==4) {
    if ((mouseX > 50 && mouseX < 400) &&
      (mouseY > 330 && mouseY < 500)) {
      t0 = millis();
    }
    //ホームに戻る
    if (mouseX>370&&mouseX<440&&mouseY>30&&mouseY<80) {
      page=0;
    }
  }
}

void draw() {
  background(192);
  switch(page) {
  case 0:
    disphome();
    break;
  case 1:
    dispcalender();
    break;
  case 3:
    dispweather();
    break;
  case 4:
    disptimer();
    break;
  }
  //日をまたいだらフラグをなおす
  if (second()==0&&minute()==0&&hour()==0) {
    for (int i=0; i<=todo.length-1; i++) {
      doflag[i]=false;
    }
  }
}
