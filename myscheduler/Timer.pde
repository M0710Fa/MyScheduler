void disptimer() {
  int t = millis()-t0;
  float timer = 180 - t / 1000.0;
  textSize(125);
  background(127);
  show_button();

  if (timer > 0) {
    textSize(125);
    text(timer, 10, 300);
  } else {
    textFont(Font);
    text("時間が経ちました", 40, 300);
  }
}

void show_button() {
  fill(255);
  rect(50, 330, 350, 170);
  rect(370, 30, 70, 50);
  fill(0);
  text("reset", 70, 450);
  textSize(24);
  text("HOME", 370, 60);
}
