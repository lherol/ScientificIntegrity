/*
 * This macro subtracts the background, thresholds and measures the area fraction
 * 
 * 2019-10-09: created, lh
 * 2019-10-10: deleted stuff, lh
 */

// clean up workspace
run("Close All");

// laod data
// run("Cell Colony (31K)");
open("C:/Users/laura/Desktop/Cell_Colony.jpg");

// binary options to dark 
run("Options...", "iterations=1 count=1 black");

// subtract backgoround
run("Subtract Background...", "rolling=100 light sliding");

// threshold
setAutoThreshold("Otsu");
setOption("Blackground", true);
run("Convert to Mask");

// Measure
run("Set Measurements...", "area_fraction display redirect=None decimal=3");
run("Analyze Particles...", "  show=Masks summarize");
