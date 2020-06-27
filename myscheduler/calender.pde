//ツェラーの公式
int zeller(int year, int month) {
  int dayflag;//ツェラー計算結果
  if (month<3) {
    month+=12;
    year--;
  }
  dayflag=(1+(month+1)*26/10+(year%100)+(year%100)/4+year/400-2*year/100)%7;
  dayflag-=1;
  if (dayflag<0) dayflag+=7;
  return dayflag;
}

void dispcalender() {
  int clx=50, cly=180;//カレンダー文字
  fill(0);
  textSize(52);
  //年月日時間
  text(now(), 30, 120);
  text(nowday(), 20, 70);
  textSize(32);
  //月を指定///////////////////////////////////////////////////
  switch(month) {
  case 1:
    montharray=new int[31];
    fill(0);
    text("January", clx, cly);
    break;
  case 2:
    montharray=new int[28];
    fill(0);
    text("Febrary", clx, cly);
    break;
  case 3:
    montharray=new int[31];
    fill(0);
    text("March", clx, cly);
    break;
  case 4:
    montharray=new int[30];
    fill(0);
    text("April", clx, cly);
    break;
  case 5:
    montharray=new int[31];
    fill(0);
    text("May", clx, cly);
    break;
  case 6:
    montharray=new int[30];
    fill(0);
    text("June", clx, cly);
    break;
  case 7:
    montharray=new int[31];
    fill(0);
    text("July", clx, cly);
    break;
  case 8:
    montharray=new int[31];
    fill(0);
    text("August", clx, cly);
    break;
  case 9:
    montharray=new int[30];
    fill(0);
    text("September", clx, cly);
    break;
  case 10:
    montharray=new int[31];
    fill(0);
    text("October", clx, cly);
    break;
  case 11:
    montharray=new int[30];
    fill(0);
    text("November", clx, cly);
    break;
  case 12:
    montharray=new int[31];
    fill(0);
    text("December", clx, cly);
    break;
  }

  //月に日付を入れる/////////////////////////////////////////////////
  for (int i=0; i<montharray.length; i++) {
    montharray[i]=i+1;
  }
  //
  if (month==0) {
    month=12;
    year--;
  }
  if (month==13) {
    month=1;
    year++;
  }
  //カレンダー表示///////////////////////////////////////////////
  for (int i=0; i<montharray.length; i++) {
    fill(255);

    //今日に色塗る
    if (i+1==day()&&month==month()&&year==year()) {
      fill(200, 200, 0);
    }

    //ツェラーパターンによる座標変化
    if (zeller(year, month)==0) {
      cx=30+(i%7)*(cw+2);
      cy=230+(i/7)*(ch+2);
    }
    if (zeller(year, month)==1) {
      if (i<=5) {
        cx=30+(i%6)*(cw+2)+(cw+2)*1;
        cy=230+(i/6)*(ch+2);
      } else {
        cx=30+((i+1)%7)*(cw+2);
        cy=230+((i+1)/7)*(ch+2);
      }
    }
    if (zeller(year, month)==2) {
      if (i<=4) {
        cx=30+(i%5)*(cw+2)+(cw+2)*2;
        cy=230+(i/5)*(ch+2);
      } else {
        cx=30+((i+2)%7)*(cw+2);
        cy=230+((i+2)/7)*(ch+2);
      }
    }
    if (zeller(year, month)==3) {
      if (i<=3) {
        cx=30+(i%4)*(cw+2)+(cw+2)*3;
        cy=230+(i/4)*(ch+2);
      } else {
        cx=30+((i+3)%7)*(cw+2);
        cy=230+((i+3)/7)*(ch+2);
      }
    }
    if (zeller(year, month)==4) {
      if (i<=2) {
        cx=30+(i%3)*(cw+2)+(cw+2)*4;
        cy=230+(i/3)*(ch+2);
      } else {
        cx=30+((i+4)%7)*(cw+2);
        cy=230+((i+4)/7)*(ch+2);
      }
    }
    if (zeller(year, month)==5) {
      if (i<=1) {
        cx=30+(i%2)*(cw+2)+(cw+2)*5;
        cy=230+(i/2)*(ch+2);
      } else {
        cx=30+((i+5)%7)*(cw+2);
        cy=230+((i+5)/7)*(ch+2);
      }
    }
    if (zeller(year, month)==6) {
      if (i<=0) {
        cx=30+(i%1)*(cw+2)+(cw+2)*6;
        cy=230+(i/1)*(ch+2);
      } else {
        cx=30+((i+6)%7)*(cw+2);
        cy=230+((i+6)/7)*(ch+2);
      }
    }

    //四角
    rect(cx, cy, cw, ch);
    fill(0);

    //日付
    text(i+1, cx, cy+30);
  }
  //その他/////////////////////////////////////////////////////
  fill(255);
  textSize(24);

  //ボタン
  rect(370, 30, 70, 50);
  rect(10, 160, 25, 25);
  rect(260, 160, 25, 25);

  //年
  fill(0);
  text(year, 20, 150);
  //ボタン上テキスト
  text("HOME", 370, 60);
  //曜日
  fill(255, 0, 0);
  text("SUN", 35, 220);
  fill(0, 0, 255);
  text("SAT", 410, 220);
  fill(0);
  text("MON", 90, 220);
  text("TUE", 160, 220);
  text("WED", 220, 220);
  text("THU", 280, 220);
  text("FRI", 350, 220);
}
