clc
clear

% Build Fuzzy System

fis = mamfis("Name", "Fuzzy Controller");

% Define Inputs

fis = addInput(fis, [-1 1], "Name", "E");
fis = addInput(fis, [-1 1], "Name", "dE");

% Define Input Memberships

fis = addMF(fis,"E","trimf",[-1 -1 -3/4],"Name","NV");
fis = addMF(fis,"E","trimf",[-1 -3/4 -2/4],"Name","NL");
fis = addMF(fis,"E","trimf",[-3/4 -2/4 -1/4],"Name","NM");
fis = addMF(fis,"E","trimf",[-2/4 -1/4 0],"Name","NS");
fis = addMF(fis,"E","trimf",[-1/4 0 1/4],"Name","ZR");
fis = addMF(fis,"E","trimf",[0 1/4 2/4],"Name","PS");
fis = addMF(fis,"E","trimf",[1/4 2/4 3/4],"Name","PM");
fis = addMF(fis,"E","trimf",[2/4 3/4 1],"Name","PL");
fis = addMF(fis,"E","trimf",[3/4 1 1],"Name","PV");


fis = addMF(fis,"dE","trimf",[-1 -1 -2/3],"Name","NL");
fis = addMF(fis,"dE","trimf",[-1 -2/3 -1/3],"Name","NM");
fis = addMF(fis,"dE","trimf",[-2/3 -1/3 0],"Name","NS");
fis = addMF(fis,"dE","trimf",[-1/3 0 1/3],"Name","ZR");
fis = addMF(fis,"dE","trimf",[0 1/3 2/3],"Name","PS");
fis = addMF(fis,"dE","trimf",[1/3 2/3 1],"Name","PM");
fis = addMF(fis,"dE","trimf",[2/3 1 1],"Name","PL");

% Define Output and Membership

fis = addOutput(fis, [-1 1], "Name", 'dU');

fis = addMF(fis,"dU","trimf",[-1 -1 -3/4],"Name","NV");
fis = addMF(fis,"dU","trimf",[-1 -3/4 -2/4],"Name","NL");
fis = addMF(fis,"dU","trimf",[-3/4 -2/4 -1/4],"Name","NM");
fis = addMF(fis,"dU","trimf",[-2/4 -1/4 0],"Name","NS");
fis = addMF(fis,"dU","trimf",[-1/4 0 1/4],"Name","ZR");
fis = addMF(fis,"dU","trimf",[0 1/4 2/4],"Name","PS");
fis = addMF(fis,"dU","trimf",[1/4 2/4 3/4],"Name","PM");
fis = addMF(fis,"dU","trimf",[2/4 3/4 1],"Name","PL");
fis = addMF(fis,"dU","trimf",[3/4 1 1],"Name","PV");

% Define rules

fuzzyLogicDesigner(fis);