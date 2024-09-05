clc
clear

% Build Fuzzy System

fis = mamfis("Name", "Fuzzy Controller");

% Define Inputs

fis = addInput(fis, [0 1], "Name", "d_v");
fis = addInput(fis, [0 1], "Name", "d_h");
fis = addInput(fis, [-180 180], "Name", "theta");

% Define Input Memberships

fis = addMF(fis,"d_v","trimf",[0 0 1/4],"Name","VS");
fis = addMF(fis,"d_v","trimf",[0 1/4 2/4],"Name","S");
fis = addMF(fis,"d_v","trimf",[1/4 2/4 3/4],"Name","M");
fis = addMF(fis,"d_v","trimf",[2/4 3/4 1],"Name","L");
fis = addMF(fis,"d_v","trimf",[3/4 1 1],"Name","VL");

fis = addMF(fis,"d_h","trimf",[0 0 1/4],"Name","VS");
fis = addMF(fis,"d_h","trimf",[0 1/4 2/4],"Name","S");
fis = addMF(fis,"d_h","trimf",[1/4 2/4 3/4],"Name","M");
fis = addMF(fis,"d_h","trimf",[2/4 3/4 1],"Name","L");
fis = addMF(fis,"d_h","trimf",[3/4 1 1],"Name","VL");

fis = addMF(fis,"theta","trimf",[-180 -180 -90],"Name","NL");
fis = addMF(fis,"theta","trimf",[-180 -90 0],"Name","NS");
fis = addMF(fis,"theta","trimf",[-90 0 90],"Name","ZR");
fis = addMF(fis,"theta","trimf",[0 90 180],"Name","PS");
fis = addMF(fis,"theta","trimf",[90 180 180],"Name","PL");

% Define Output and Membership

fis = addOutput(fis, [-130 130], "Name", 'd_theta');

fis = addMF(fis,"d_theta","trimf",[-130 -130 -65],"Name","NL");
fis = addMF(fis,"d_theta","trimf",[-130 -65 0],"Name","NS");
fis = addMF(fis,"d_theta","trimf",[-65 0 65],"Name","ZR");
fis = addMF(fis,"d_theta","trimf",[0 65 130],"Name","PS");
fis = addMF(fis,"d_theta","trimf",[65 130 130],"Name","PL");

% Define rules

fuzzyLogicDesigner(fis);