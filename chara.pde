//人の代わりにチョッパーを使う
//座標、回転角度、拡大率を入力してチョッパーを描画

void chara(float x, float y, float scale) {
  int offsetx = width/2;
  int offsety = height/2;

  pushMatrix();
  translate(x, y);
  scale(scale);
  //rotate(angle);
  translate(-offsetx, -offsety);

  stroke(0); //耳
  strokeWeight(2);
  fill(235, 192, 137);
  beginShape(); //左耳
  curveVertex(x-135, y-165);
  curveVertex(x-135, y-165);
  curveVertex(x-133, y-145);
  curveVertex(x-160, y-115);
  curveVertex(x-180, y-145);
  curveVertex(x-135, y-165);
  curveVertex(x-135, y-165);
  endShape();
  beginShape(); //右耳
  curveVertex(x+150, y-155);
  curveVertex(x+150, y-155);
  curveVertex(x+190, y-145);
  curveVertex(x+170, y-120);
  curveVertex(x+140, y-135);
  curveVertex(x+150, y-155);
  curveVertex(x+150, y-155);
  endShape();
  noStroke();
  fill(178, 131, 115);
  triangle(x-170, y-140, x-155, y-135, x-160, y-130);
  triangle(x+150, y-130, x+180, y-140, x+160, y-125);
  stroke(0);
  line(x-170, y-140, x-155, y-135);
  line(x+150, y-130, x+180, y-140);

  stroke(0); //帽子上
  strokeWeight(2);
  fill(235, 104, 118);
  beginShape();
  curveVertex(x-140, y-275);
  curveVertex(x-140, y-275);
  curveVertex(x-65, y-315);
  curveVertex(x+10, y-335);
  curveVertex(x+85, y-315);
  curveVertex(x+170, y-275); //角
  curveVertex(x+170, y-275);
  vertex(x+170, y-275);
  vertex(x+170, y-275);
  vertex(x+140, y-120); //角
  vertex(x+140, y-120);
  curveVertex(x+270, y-120);
  curveVertex(x+270, y-120);
  curveVertex(x-135, y-120); //角
  curveVertex(x-135, y-120);
  curveVertex(x-135, y-120);
  curveVertex(x-135, y-120);
  curveVertex(x-140, y-275);
  curveVertex(x-140, y-275);
  endShape();

  stroke(0); //帽子のつば
  strokeWeight(2);
  fill(235, 104, 118); 
  beginShape();
  curveVertex(x-200, y-90);
  curveVertex(x-200, y-90);
  curveVertex(x-115, y-165);
  curveVertex(x, y-185);
  curveVertex(x+130, y-155);
  curveVertex(x+210, y-60); //角
  curveVertex(x+210, y-60);
  vertex(x+210, y-60);
  vertex(x+210, y-60);
  vertex(x+185, y-5); //角
  vertex(x+185, y-5);
  curveVertex(x+185, y-5);
  curveVertex(x+185, y-5);
  curveVertex(x, y+30);
  curveVertex(x-190, y-25); //角
  curveVertex(x-190, y-25);
  vertex(x-190, y-25);
  vertex(x-190, y-25);
  vertex(x-200, y-90);
  vertex(x-200, y-90);
  curveVertex(x-200, y-90);
  curveVertex(x-200, y-90);
  endShape();
  stroke(0); //帽子のつば(線)
  strokeWeight(2);
  beginShape();
  curveVertex(x-190, y-25);
  curveVertex(x-190, y-25);
  curveVertex(x-115, y-115);
  curveVertex(x, y-135);
  curveVertex(x+130, y-100);
  curveVertex(x+185, y-5);
  curveVertex(x+185, y-5);
  endShape();

  stroke(0); //×印
  strokeWeight(2);
  fill(255);
  quad(x-45, y-245, x-20, y-275, x+60, y-205, x+40, y-185);
  quad(x-45, y-205, x+50, y-275, x+70, y-250, x-20, y-185);
  noStroke();
  quad(x-43, y-243, x-22, y-273, x+58, y-207, x+38, y-187);

  stroke(0); //左角
  strokeWeight(2);
  fill(168, 122, 72);
  beginShape(); //付け根
  curveVertex(x-170, y-185);
  curveVertex(x-170, y-185);
  curveVertex(x-200, y-175);
  curveVertex(x-130, y-180);
  curveVertex(x-130, y-165);
  curveVertex(x-170, y-155);
  curveVertex(x-190, y-170);
  curveVertex(x-170, y-185);
  curveVertex(x-170, y-185);
  endShape();
  beginShape();
  curveVertex(x-200, y-205);
  curveVertex(x-200, y-205);
  curveVertex(x-185, y-265);
  curveVertex(x-200, y-315); 
  curveVertex(x-190, y-325); //右から2番目頂点
  curveVertex(x-175, y-315);
  curveVertex(x-165, y-330); //一番右頂点
  curveVertex(x-150, y-325);
  curveVertex(x-135, y-290);
  curveVertex(x-135, y-235);
  curveVertex(x-160, y-185);
  curveVertex(x-220, y-165);
  curveVertex(x-265, y-190);
  curveVertex(x-290, y-280);
  curveVertex(x-280, y-290); //1番左頂点
  curveVertex(x-270, y-285);
  curveVertex(x-260, y-303); //左から2番目頂点
  curveVertex(x-245, y-300);
  curveVertex(x-235, y-315); //左から3番目頂点
  curveVertex(x-220, y-303);
  curveVertex(x-215, y-245);
  curveVertex(x-205, y-220);
  curveVertex(x-190, y-235);
  curveVertex(x-190, y-235);
  endShape();
  beginShape(); //右の線
  curveVertex(x-175, y-315);
  curveVertex(x-175, y-315);
  curveVertex(x-160, y-275);
  curveVertex(x-165, y-235);
  curveVertex(x-165, y-235);
  endShape();
  beginShape(); //左から2番目の線
  curveVertex(x-245, y-300);
  curveVertex(x-245, y-300);
  curveVertex(x-240, y-245);
  curveVertex(x-230, y-215);
  curveVertex(x-230, y-215);
  endShape();
  beginShape(); //左の線
  curveVertex(x-270, y-285);
  curveVertex(x-270, y-285);
  curveVertex(x-255, y-225);
  curveVertex(x-245, y-205);
  curveVertex(x-245, y-205);
  endShape();
  stroke(168, 122, 72); //補正
  strokeWeight(5);
  line(x-188, y-170, x-165, y-183);

  stroke(0); //右角
  strokeWeight(2);
  fill(168, 122, 72);
  beginShape(); //付け根
  curveVertex(x+140, y-175);
  curveVertex(x+140, y-175);
  curveVertex(x+170, y-175);
  curveVertex(x+180, y-185);
  curveVertex(x+195, y-175);
  curveVertex(x+180, y-160);
  curveVertex(x+140, y-155);
  curveVertex(x+135, y-170);
  curveVertex(x+140, y-175);
  curveVertex(x+140, y-175);
  endShape();
  beginShape();
  curveVertex(x+205, y-205);
  curveVertex(x+205, y-205);
  curveVertex(x+195, y-225);
  curveVertex(x+200, y-285);
  curveVertex(x+205, y-305); 
  curveVertex(x+195, y-320); //左から2番目頂点
  curveVertex(x+180, y-310);
  curveVertex(x+170, y-320); //一番左頂点
  curveVertex(x+160, y-318);
  curveVertex(x+150, y-275);
  curveVertex(x+160, y-205);
  curveVertex(x+180, y-185);
  curveVertex(x+195, y-175);
  curveVertex(x+240, y-170);
  curveVertex(x+290, y-225);
  curveVertex(x+295, y-275); 
  curveVertex(x+290, y-285); //1番右頂点
  curveVertex(x+280, y-282);
  curveVertex(x+265, y-300); //右から2番目頂点
  curveVertex(x+250, y-295);
  curveVertex(x+240, y-305); //右から3番目頂点
  curveVertex(x+225, y-295);
  curveVertex(x+225, y-245);
  curveVertex(x+220, y-220);
  curveVertex(x+192, y-226);
  curveVertex(x+192, y-226);
  endShape();
  beginShape(); //左の線
  curveVertex(x+180, y-310);
  curveVertex(x+180, y-310);
  curveVertex(x+170, y-255);
  curveVertex(x+170, y-235);
  curveVertex(x+170, y-235);
  endShape();
  beginShape(); //右から2番目の線
  curveVertex(x+250, y-295);
  curveVertex(x+250, y-295);
  curveVertex(x+245, y-235);
  curveVertex(x+236, y-210);
  curveVertex(x+236, y-210);
  endShape();
  beginShape(); //右の線
  curveVertex(x+280, y-282);
  curveVertex(x+280, y-282);
  curveVertex(x+265, y-220);
  curveVertex(x+250, y-195);
  curveVertex(x+250, y-195);
  endShape();
  stroke(168, 122, 72); //補正
  strokeWeight(5);
  line(x+180, y-185, x+190, y-175);
  stroke(0);
  strokeWeight(2);
  fill(139, 135, 132);
  quad(x+155, y-175, x+170, y-175, x+172, y-157, x+158, y-155);
  stroke(0); //輪
  strokeWeight(4);
  point(x+158, y-173);
  point(x+165, y-173);
  point(x+160, y-167);
  point(x+167, y-167);
  point(x+160, y-160);
  point(x+167, y-160);

  stroke(0); //マント
  strokeWeight(2);
  fill(169, 69, 103);
  beginShape();
  vertex(x, y+30);
  vertex(x, y+30);
  vertex(x+50, y+31);
  vertex(x+50, y+31);
  curveVertex(x+50, y+31);
  curveVertex(x+50, y+31);
  curveVertex(x+105, y+105);
  curveVertex(x+130, y+175);
  curveVertex(x+130, y+175);
  vertex(x+130, y+175);
  vertex(x+130, y+175);
  vertex(x+100, y+175);
  vertex(x+100, y+175);
  curveVertex(x+100, y+175);
  curveVertex(x+100, y+175);
  curveVertex(x+85, y+190);
  curveVertex(x+50, y+180);
  curveVertex(x-45, y+195);
  curveVertex(x-80, y+205);
  curveVertex(x-95, y+190);
  curveVertex(x-105, y+180);
  curveVertex(x-105, y+180);
  vertex(x-105, y+180);
  vertex(x-105, y+180);
  vertex(x-125, y+180);
  vertex(x-125, y+180);
  curveVertex(x-125, y+180);
  curveVertex(x-125, y+180);
  curveVertex(x-90, y+95);
  curveVertex(x-30, y+31);
  curveVertex(x-30, y+31);
  endShape();

  //足
  stroke(0); //右足
  strokeWeight(2);
  fill(110, 108, 93);
  beginShape();
  curveVertex(x+38, y+194);
  curveVertex(x+38, y+194);
  curveVertex(x+55, y+215);
  curveVertex(x+30, y+215);
  curveVertex(x+38, y+194);
  curveVertex(x+38, y+194);
  endShape();
  line(x+35, y+197, x+48, y+215);
  fill(227, 181, 129);
  beginShape();
  curveVertex(x+40, y+195);
  curveVertex(x+40, y+195);
  curveVertex(x+35, y+200);
  curveVertex(x+30, y+215);
  curveVertex(x+30, y+215);
  vertex(x+30, y+215);
  vertex(x+30, y+215);
  vertex(x+10, y+215);
  vertex(x+10, y+215);
  curveVertex(x+10, y+215);
  curveVertex(x+10, y+215);
  curveVertex(x+13, y+205);
  curveVertex(x+20, y+180);
  curveVertex(x+25, y+180);
  curveVertex(x+20, y+200);
  curveVertex(x+33, y+195);
  curveVertex(x+40, y+195);
  curveVertex(x+40, y+195);
  endShape();

  stroke(0); //左足
  strokeWeight(2);
  fill(110, 108, 93);
  beginShape();
  curveVertex(x-38, y+195);
  curveVertex(x-38, y+195);
  curveVertex(x-30, y+215);
  curveVertex(x-55, y+215);
  curveVertex(x-38, y+195);
  curveVertex(x-38, y+195);
  endShape();
  line(x-35, y+197, x-45, y+215);
  fill(227, 181, 129);
  beginShape();
  curveVertex(x-38, y+195);
  curveVertex(x-38, y+195);
  curveVertex(x-34, y+200);
  curveVertex(x-30, y+215);
  curveVertex(x-30, y+215);
  vertex(x-30, y+215);
  vertex(x-30, y+215);
  vertex(x-10, y+215);
  vertex(x-10, y+215);
  curveVertex(x-10, y+215);
  curveVertex(x-10, y+215);
  curveVertex(x-10, y+205);
  curveVertex(x-15, y+180);
  curveVertex(x-20, y+180);
  curveVertex(x-18, y+200);
  curveVertex(x-30, y+195);
  curveVertex(x-38, y+195);
  curveVertex(x-38, y+195);
  endShape();

  //胴体
  stroke(0); //胴体(体)
  strokeWeight(2);
  fill(227, 181, 129);
  beginShape();
  curveVertex(x+5, y+45);
  curveVertex(x+5, y+45);
  curveVertex(x+50, y+60);
  curveVertex(x+75, y+95);
  curveVertex(x+80, y+135);
  curveVertex(x+80, y+135);
  vertex(x+80, y+135);
  vertex(x+80, y+135);
  vertex(x, y+133);
  vertex(x-70, y+135);
  vertex(x-70, y+135);
  curveVertex(x-70, y+135);
  curveVertex(x-70, y+135);
  curveVertex(x-75, y+105);
  curveVertex(x-50, y+60);
  curveVertex(x+5, y+45);
  curveVertex(x+5, y+45);
  endShape();
  stroke(0); //胴体(ズボン)
  strokeWeight(2);
  fill(123, 58, 80);
  beginShape();
  curveVertex(x+80, y+135);
  curveVertex(x+80, y+135);
  curveVertex(x+60, y+165);
  curveVertex(x+35, y+180);
  curveVertex(x+10, y+180);
  curveVertex(x+8, y+170);
  curveVertex(x-5, y+170);
  curveVertex(x-10, y+180);
  curveVertex(x-30, y+180);
  curveVertex(x-55, y+155);
  curveVertex(x-70, y+135);
  curveVertex(x-70, y+135);
  vertex(x-70, y+135);
  vertex(x-70, y+135);
  vertex(x, y+133);
  vertex(x+80, y+135);
  vertex(x+80, y+135);
  endShape();

  //手
  stroke(0);
  strokeWeight(2);
  fill(103, 100, 85); //爪
  beginShape();
  curveVertex(x-122, y+110);
  curveVertex(x-122, y+110);
  curveVertex(x-102, y+105);
  curveVertex(x-105, y+130);
  curveVertex(x-122, y+110);
  curveVertex(x-122, y+110);
  endShape();
  beginShape();
  curveVertex(x-105, y+105);
  curveVertex(x-105, y+105);
  curveVertex(x-80, y+110);
  curveVertex(x-95, y+138);
  curveVertex(x-105, y+105);
  curveVertex(x-105, y+105);
  endShape();
  beginShape();
  curveVertex(x+92, y+50);
  curveVertex(x+92, y+50);
  curveVertex(x+110, y+55);
  curveVertex(x+103, y+35);
  curveVertex(x+92, y+50);
  curveVertex(x+92, y+50);
  endShape();
  beginShape();
  curveVertex(x+110, y+55);
  curveVertex(x+110, y+55);
  curveVertex(x+123, y+38);
  curveVertex(x+128, y+60);
  curveVertex(x+110, y+55);
  curveVertex(x+110, y+55);
  endShape();
  fill(227, 181, 129);
  quad(x-45, y+50, x-100, y+90, x-85, y+103, x-35, y+50); //左腕
  quad(x+40, y+50, x+100, y+60, x+100, y+80, x+40, y+55); //右腕
  beginShape(); //左手
  curveVertex(x-122, y+110);
  curveVertex(x-122, y+110);
  curveVertex(x-105, y+90);
  curveVertex(x-90, y+90);
  curveVertex(x-80, y+110);
  curveVertex(x-122, y+110);
  curveVertex(x-122, y+110);
  endShape();
  beginShape(); //右手
  curveVertex(x+92, y+50);
  curveVertex(x+92, y+50);
  curveVertex(x+95, y+80);
  curveVertex(x+115, y+85);
  curveVertex(x+125, y+60);
  curveVertex(x+92, y+50);
  curveVertex(x+92, y+50);
  endShape();
  fill(0);
  ellipse(x+102, y+75, 7, 7) ;
  ellipse(x+112, y+77, 7, 7);

  stroke(0); //マント結び目
  strokeWeight(2);
  fill(255, 159, 173);
  beginShape();
  curveVertex(x+5, y+80);
  curveVertex(x+5, y+80);
  curveVertex(x+68, y+50);
  curveVertex(x, y+35);
  curveVertex(x-57, y+57);
  curveVertex(x+5, y+80);
  curveVertex(x+5, y+80);
  endShape();
  beginShape();
  curveVertex(x+5, y+75);
  curveVertex(x+5, y+75);
  curveVertex(x+25, y+73);
  curveVertex(x+35, y+85);
  curveVertex(x+35, y+90);
  curveVertex(x+20, y+100);
  curveVertex(x+8, y+90);
  curveVertex(x+5, y+75);
  curveVertex(x+5, y+75);
  endShape();
  beginShape();
  curveVertex(x+5, y+75);
  curveVertex(x+5, y+75);
  curveVertex(x-15, y+70);
  curveVertex(x-30, y+80);
  curveVertex(x-20, y+100);
  curveVertex(x+5, y+75);
  curveVertex(x+5, y+75);
  endShape();
  stroke(0);
  strokeWeight(2);
  line(x+5, y+70, x+25, y+85);
  line(x+5, y+70, x+20, y+90);
  line(x+5, y+70, x-20, y+80);
  line(x+5, y+70, x-15, y+85);
  noStroke();
  fill(182, 72, 107);
  quad(x+5, y+70, x+25, y+85, x+20, y+90, x+5, y+70);
  quad(x+5, y+70, x-20, y+80, x-15, y+85, x+5, y+70);
  stroke(0);
  strokeWeight(2);
  fill(255, 159, 173);
  ellipse(x+5, y+75, 20, 20);

  stroke(0); //顔
  strokeWeight(2);
  fill(227, 181, 129);
  beginShape();
  curveVertex(x-130, y-55);
  curveVertex(x-130, y-55);
  curveVertex(x-85, y-95);
  curveVertex(x, y-125);
  curveVertex(x+95, y-95);
  curveVertex(x+140, y-55); //角
  curveVertex(x+140, y-55);
  vertex(x+140, y-55);
  vertex(x+140, y-55);
  vertex(x+110, y+15);
  vertex(x+110, y+15);
  curveVertex(x+110, y+14);
  curveVertex(x+110, y+14);
  curveVertex(x, y+60);
  curveVertex(x-100, y+15); //角
  curveVertex(x-100, y+15);
  vertex(x-100, y+15);
  vertex(x-100, y+15);
  vertex(x-130, y-55);
  vertex(x-130, y-55);
  endShape();

  noStroke(); //顔(影)
  fill(166, 120, 96);
  beginShape();
  curveVertex(x-130, y-54);
  curveVertex(x-130, y-54);
  curveVertex(x-85, y-93);
  curveVertex(x, y-123);
  curveVertex(x+95, y-93);
  curveVertex(x+140, y-54); //角
  curveVertex(x+140, y-54);
  vertex(x+140, y-54);
  vertex(x+140, y-54);
  vertex(x+123, y-14); //角
  vertex(x+123, y-14);
  curveVertex(x+123, y-14);
  curveVertex(x+123, y-14);
  curveVertex(x+60, y-55);
  curveVertex(x, y-65);
  curveVertex(x-55, y-65);
  curveVertex(x-111, y-15); //角
  curveVertex(x-111, y-15);
  vertex(x-111, y-15);
  vertex(x-111, y-15);
  vertex(x-130, y-55);
  vertex(x-130, y-55);
  endShape();

  stroke(0); //目
  fill(255);
  ellipse(x-65, y-32, 52, 52);
  ellipse(x+65, y-35, 52, 52);
  noStroke();
  fill(63, 54, 39);
  ellipse(x-65, y-32, 37, 37);
  ellipse(x+65, y-35, 37, 37);

  stroke(22, 16, 5); //眉毛
  line(x-80, y-75, x-50, y-65);
  line(x+50, y-65, x+80, y-75);

  fill(42, 85, 190); //鼻
  stroke(22, 16, 5);
  strokeWeight(2);
  beginShape();
  curveVertex(x, y);
  curveVertex(x, y);
  curveVertex(x-16, y-15);
  curveVertex(x+14, y-15);
  curveVertex(x, y);
  curveVertex(x, y);
  endShape();

  line(x, y, x, y+15); //口
  stroke(22, 16, 10);
  noFill();
  strokeWeight(2);
  bezier(x, y+15, x-10, y+25, x-30, y+25, x-34, y+10);
  bezier(x, y+15, x+10, y+25, x+30, y+25, x+34, y+10);
  fill(249, 125, 135);
  bezier(x-13, y+22, x-5, y+45, x+5, y+45, x+13, y+22);
  fill(0);
  triangle(x, y+15, x-10, y+21, x+10, y+21);
  popMatrix();
}