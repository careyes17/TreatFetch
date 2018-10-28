import ddf.minim.*;

PImage lawn;
PImage pup;
PImage pup2;
PImage pup3;
PImage pup4;
PImage pup4Hidden;
PImage bone;
PImage smallbone;
PImage smalldrybone;
PImage logo;
PImage pupChoice;
Minim minim;
AudioPlayer ambientsound;
AudioPlayer crunch;
AudioPlayer dropsound;
//SoundFile ambientsound;
//SoundFile crunch;
//SoundFile dropsound;

float moveX = random(width - 40);
int moveY = 0;
int gamemode = 0;
int score = 0;
int dryBoneCount = 0;
int highScore = 0;
String pupVariable = "data/pup.png";
int pupHeight = 350;
int oldScore = score;
int hiddenDog1 = 0;
String[] highscoretxt;
int[] scores = new int[3];
int count = 0;
int playCount = 0;

void setup() {
  size(500, 500);
  frameRate(60);
  lawn = loadImage("data/lawn.jpg");
  pup = loadImage("data/pup.png");
  pup2 = loadImage("data/pup2.png");
  pup3 = loadImage("data/pup3.png");
  pup4 = loadImage("data/pup4.png");
  pup4Hidden = loadImage("data/pup4Hidden.png");
  bone = loadImage("data/bone.png");
  smallbone = loadImage("data/smallbone.png");
  smalldrybone = loadImage("data/smalldrybone.png");
  logo = loadImage("data/logo.png");
  pupChoice = loadImage(pupVariable);
  minim = new Minim(this);
  ambientsound = minim.loadFile("ambientnoise.mp3");
  crunch = minim.loadFile("crunch.mp3");
  dropsound = minim.loadFile("dropsound.mp3");
  //ambientsound = new SoundFile(this, "ambientnoise.mp3");
  //crunch = new SoundFile(this, "crunch.mp3");
  //dropsound = new SoundFile(this, "dropsound.mp3");
  highscoretxt  = loadStrings("data/highscore.txt");
  highScore = parseInt(highscoretxt[0]);
  if (highScore >= 50) {
  hiddenDog1 = 2;
  }
}

void mouseClicked() {
  if (gamemode == 5) {
    if (mouseX > 350 && mouseX < 350 + 140 && mouseY > 6.5 && mouseY < 36) {
      gamemode = 4;
    }
    if (mouseX > 22.6667 && mouseX < 202.6667 && mouseY > 15 && mouseY < 195 && hiddenDog1 > 0) {
      gamemode = 1;
      pupHeight = 340;
      pupChoice = loadImage("data/pup4.png");
    }
  }
  if (gamemode == 2) {
    if (mouseX > width/2 - 95 && mouseX < width/2 + 95 && mouseY > height/1.7 && mouseY < height/1.7 + 55) { 
      gamemode = 1;
      score = 0;
      dryBoneCount = 0;
      if (hiddenDog1 == 1) {
        hiddenDog1 = 2;
      }
    }
    if (hiddenDog1 == 1) {
      if (mouseX > width/2 - 115 && mouseX < width/2 + 115 && mouseY > height/1.145 && mouseY < height/1.145 + 70) { 
        gamemode = 6;
        score = 0;
        dryBoneCount = 0;
        hiddenDog1 = 2;
      }
    }
    if (mouseX > width/2 - 115 && mouseX < width/2 + 115 && mouseY >  height/1.35 && mouseY <  height/1.35 + 55) {
      gamemode = 4;
      score = 0;
      dryBoneCount = 0;
      if (hiddenDog1 == 1) {
        hiddenDog1 = 2;
      }
    }
  }
  if (gamemode == 0) {
    if (mouseX > width/2 - 95 && mouseX < width/2 + 95 && mouseY > height/1.7 && mouseY < height/1.7 + 55) { 
      ambientsound.loop();
      ambientsound.setGain(0.15);
      //ambientsound.amp(0.15);
      //ambientsound.rate(0.9);
      delay(250);
      gamemode = 4;
    }
  }
  if (gamemode == 3) {
    if (mouseX > 22.6667 && mouseX < 202.6667 && mouseY > height/3.44 && mouseY < height/3.44 + 165) { 
      gamemode = 1;
      pupHeight = 340;
      pupChoice = loadImage("data/pup.png");
    }
    if (mouseX > 341.6667 && mouseX < 506.6667 && mouseY > height/2.7 && mouseY < height/2.7 + 180) {
      gamemode = 1;
      pupHeight = 330;
      pupChoice = loadImage("data/pup2.png");
    }
    if (mouseX > (width/2) - 90 && mouseX < (width/2) + 90 && mouseY > height/1.6 && mouseY < height/1.6 + 180) { 
      gamemode = 1;
      pupHeight = 320;
      pupChoice = loadImage("data/pup3.png");
    }
    if (mouseX > 350 && mouseX < 350 + 140 && mouseY > 6.5 && mouseY < 36) {
      gamemode = 6;
    }
  }
}

void draw() {
  frameRate(60);
  if (gamemode == 4) {
    cursor();
    gamemode = 3;
  }
  if (gamemode == 6) {
    cursor();
    gamemode = 5;
  }
  if (gamemode == 5) {
    cursor();
    image(lawn, 0, 0);
    if (hiddenDog1 == 0) {
      image(pup4Hidden, 26.6667, 15);
      if (mouseX > 22.6667 && mouseX < 202.6667 && mouseY > 15 && mouseY < 195) {
        fill(0);
        rect(51.6667, 180, 140, 27.5);
        fill(255);
        textSize(23);
        textAlign(CENTER);
        text("???", 121.6667, 201.5);
      }
    }
    if (hiddenDog1 > 0) {
      image(pup4, 26.6667, 15);
    }

    if (mouseX > 22.6667 && mouseX < 202.6667 && mouseY > 15 && mouseY < 195 && hiddenDog1 > 0) {
      fill(0);
      rect(51.6667, 180, 140, 27.5);
      fill(255);
      textSize(23);
      textAlign(CENTER);
      text("Tuti", 121.6667, 201.5);
    }
    fill(0);
    rect(350, 6.5, 136, 27.5);
    fill(255);
    textSize(23);
    textAlign(CENTER);
    text("Last Page", 420, 27.5);
  }
  if (gamemode == 3) {
    cursor();
    image(lawn, 0, 0);
    fill(0);
    rect(width/2 - 95, height/3.82, 190, 55);
    fill(255, 255, 255);
    textSize(23);
    textAlign(CENTER);
    text("Select a Dog!", width/2, height / 3);

    image(pup, 26.6667, height/3.44);

    if (mouseX > 22.6667 && mouseX < 202.6667 && mouseY > height/3.44 && mouseY < height/3.44 + 165) {
      fill(0);
      rect(26.6667, height/3.44 + 160, 140, 27.5);
      fill(255);
      textSize(23);
      textAlign(CENTER);
      text("Ralph", 96.6667, height/3.44 + 182);
    }

    image(pup2, 326.6667, height/2.7);

    if (mouseX > 341.6667 && mouseX < 506.6667 && mouseY > height/2.7 && mouseY < height/2.7 + 180) {
      fill(0);
      rect(351.6667, height/2.7 + 175, 140, 27.5);
      fill(255);
      textSize(23);
      textAlign(CENTER);
      text("Louis", 421.6667, height/2.7 + 197);
    }

    image(pup3, (width/2) - 90, height/1.6);

    if (mouseX > (width/2) - 90 && mouseX < (width/2) + 90 && mouseY > height/1.6 && mouseY < height/1.6 + 180) {
      fill(0);
      rect((width/2) - 240, height/1.6 + 140, 140, 27.5);
      fill(255);
      textSize(23);
      textAlign(CENTER);
      text("Hyperion", (width/2) - 170, height/1.6 + 161.6);
    }
    fill(0);
    rect(350, 6.5, 136, 27.5);
    fill(255);
    textSize(23);
    textAlign(CENTER);
    text("More Dogs!", 420, 27.5);
  }
  if (gamemode == 0) {
    cursor();
    image(lawn, 0, 0);
    image(logo, width/2 - 229.5, height/4);
    fill(0);
    rect(width/2 - 95, height/1.7, 190, 55);
    fill(255, 255, 255);
    textSize(23);
    textAlign(CENTER);
    text("Start Game!", width/2, height / 1.52);
  }
  if (gamemode == 2) {
    cursor();
    image(lawn, 0, 0);
    if (hiddenDog1 == 1) {
      fill(0);
      rect(width/2 - 115, height/1.145, 230, 55);
      fill(255, 255, 255);
      textSize(23);
      textAlign(CENTER);
      text("New Dog Unlocked!", width/2, height /1.145 + 35);
    }
    fill(0);
    rect(width/2 - 120, height/3, 240, 90);
    fill(255, 255, 255);
    textSize(23);
    textAlign(CENTER);
    text("score: " + score, width/2, height / 2.5);
    text("high score: " + highScore, width/2, height / 2.14);
    fill(0);
    rect(width/2 - 95, height/1.7, 190, 55);
    fill(255, 255, 255);
    textSize(23);
    textAlign(CENTER);
    text("Play Again!", width/2, height / 1.52);
    fill(0);
    rect(width/2 - 115, height/1.35, 230, 55);
    fill(255, 255, 255);
    textSize(23);
    textAlign(CENTER);
    text("Select Another Dog", width/2, height /1.35 + 35);
    fill(0);
    rect(450, 8, 40, 40);
    fill(255, 255, 255);
    textSize(23);
    textAlign(CENTER);
    text("RS", 471, 37);
    if (mouseX > 450 && mouseX < 490 && mouseY > 8 && mouseY < 48) {
        fill(0);
        rect(width/2 - 120, height/3, 240, 90);
        fill(255, 255, 255);
        textSize(20);
        textAlign(CENTER);
        text("Recent Scores", width/2, height/3 + 20);
        textSize(20);
        textAlign(CENTER);
        text("" + scores[0], width/2, height/3 + 42);
        if (playCount > 1) {
        textSize(20);
        textAlign(CENTER);
        text("" + scores[1], width/2, height/3 + 62);
        }
        if (playCount > 2) {
        textSize(20);
        textAlign(CENTER);
        text("" + scores[2], width/2, height/3 + 82);
        }
      }
  }
  if (gamemode == 1) {
    cursor();
    background(0);
    image(lawn, 0, 0);
    fill(255, 255, 255);
    image(bone, moveX - 15, moveY - 15);
    //moveY += 5 + (score/3);
    moveY += 3.5 + (score/8);
    if (moveY > 490) {
      moveY = 0;
      moveX = random(width - 40);
      dryBoneCount++;
      dropsound.rewind();
      dropsound.play();
      dropsound.setGain(0.3);
      //dropsound.amp(0.3);
    }
    if (mouseX > moveX -90 && mouseX < moveX +140 && pupHeight  +40 > moveY && pupHeight + 40 < moveY + 40) {
      moveY = 0;
      moveX = random(width - 40);
      score++;
      crunch.rewind();
      crunch.play();
      crunch.setGain(0.7);
      //crunch.amp(0.7);
    }
    if (dryBoneCount > 2) {
      if (count == 1 && playCount == 1) {
      scores[1] = scores[0];
      scores[0] = score;
      }
      if (count == 2 || playCount > 2) {
      scores[2] = scores[1];
      scores[1] = scores[0];
      scores[0] = score;
      }
      if (count == 0 && playCount == 0) {
      scores[0] = score;
      }
      count++;
      if (count > 2) {
      count = 0;
      }
      playCount++;
      gamemode = 2;
    }
    if (score > highScore) {
      highScore = score;
      highscoretxt[0] = highScore + "";
      saveStrings("data/highscore.txt", highscoretxt);
      if (hiddenDog1 != 2 && highScore >= 50) {
        hiddenDog1 = 1;
      }
    }
    int borderIncrease = 0;
    if (score >= 10) {
      borderIncrease = 17;
    }
    if (score >= 100) {
      borderIncrease = 34;
    }
    if (score >= 1000) {
      borderIncrease = 51;
    }
    image(smallbone, 0, 0);
    image(smallbone, 35, 0);
    image(smallbone, 70, 0);
    if (dryBoneCount >= 1) {
      image(smalldrybone, 0, 0);
    }
    if (dryBoneCount >= 2) {
      image(smalldrybone, 35, 0);
    }
    if (dryBoneCount >= 3) {
      image(smalldrybone, 70, 0);
    }
    image(pupChoice, mouseX - 90, pupHeight);
    fill(0);
    rect(width/2 - ((90 + borderIncrease) / 2), -15, 90 + borderIncrease, 40);
    fill(255, 255, 255);
    textSize(23);
    textAlign(CENTER);
    text("score: " + score, width/2, 20);
  }
}