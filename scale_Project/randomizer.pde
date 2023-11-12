void randomize(){

    StringList knobInventory;
        knobInventory = new StringList();
        knobInventory.append("kA");
        knobInventory.append("kB");
        knobInventory.append("kC");
        knobInventory.append("kD");
        knobInventory.append("kE");
        knobInventory.append("kF");
        knobInventory.append("kG");
        //println("Normal button list:" + buttonInventory);
        knobInventory.shuffle();
        println("shuffled buttonlist:" + knobInventory);


    StringList scaleInventory;
        scaleInventory = new StringList();
        scaleInventory.append("Modstand ud af step");
        scaleInventory.append("Kraft ind i step");
        scaleInventory.append("Range");
        scaleInventory.append("Stepstørrelse");
        scaleInventory.append("Ustabil");
        //println("Normal scale list:" + scaleInventory);
        scaleInventory.shuffle();
        println("Shuffled scale list:" + scaleInventory);
}