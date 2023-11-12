class SliderScale {
  float sliderX;
  boolean dragging;
  int numAnchors; 
  float[] anchorX;
  float spacing;
  boolean showSlider;

  SliderScale(int numAnchors) {
    this.numAnchors = numAnchors;
    anchorX = new float[numAnchors];
    dragging = false;
    spacing = 0;
    showSlider = false; // Initially, the slider button is hidden - Changes to true when slider is pressed.
    initializeAnchors();
  }

    // Function to make the anchor points, and space them equally apart. 
  void initializeAnchors() {
    spacing = (width - 200) / (numAnchors - 1);
    for (int i = 0; i < numAnchors; i++) {
      anchorX[i] = map(i, 0, numAnchors - 1, 300 + spacing / 2, width - 300 - spacing / 2); // 300 er omkring slut og start punkt. 
    }
    // Scale lables - hardcoded
    fill(0);
    textSize(16);
    stroke(5);
    textAlign(CENTER, CENTER);
    text("SLET IKKE", spacing, height * 1/3 + 20);
    text("LIDT", spacing, height * 1/3 + 20);
    text("MODERAT", spacing, height * 1/3 + 20);
    text("MEGET", spacing, height * 1/3 + 20);
    text("EKSTREMT", spacing, height * 1/3 + 20);
  }

    // Draw the actual scale in the canvas. 
  void drawScale() {
    float scaleY = height * 1 / 3;
    stroke(0);
    strokeWeight(3);
    line(300, scaleY, width - 300, scaleY); // 300 er hvor den starter og slutter. 

    stroke(0);
    strokeWeight(5);
    line(width * 1/3 ,150, width*2/3,150);


    fill(0);
    for (int i = 0; i < numAnchors; i++) {
      ellipse(anchorX[i], scaleY, 10, 10);
    }

        // Refers to methods under mouse actions in bottum. 
    if (showSlider) {
      fill(150);
      ellipse(sliderX, scaleY, 30, 30);
    }
  }

        //Place the ellipse for marker. 
  void mousePressed() {
    float d = dist(mouseX, mouseY, sliderX, height * 1 / 3);
    if (d < 15) {
      dragging = true;
    }
  }

        // Stops following when released. 
  void mouseReleased() {
    dragging = false;
  }

        // If dragged than change ellipse position to mouseX
  void mouseDragged() {
    if (dragging) {
      sliderX = constrain(mouseX, 300, width - 300);
    }
  }

        // Prints the value to the terminal to follow the state of the program.
  void printSliderValue() {
    int sliderValue = int(map(sliderX, 300, width - 300, 0, 100)); 
    println("Slider Value: " + sliderValue);
    
    // Hide the slider whwn submitting.
    setShowSlider(false);
  }

  void setShowSlider(boolean showSlider) {
    this.showSlider = showSlider;
  }

  void setSliderPosition(float x) {
    sliderX = constrain(x, 100, width - 100);
  }
}
