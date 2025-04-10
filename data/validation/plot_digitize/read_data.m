%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: /home/degoede/SEA/mdo_wd2/data/validation/plot_digitize/permeate_flow.csv
%
% Auto-generated by MATLAB on 19-Nov-2024 13:19:22

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["VarName1", "VarName2"];
opts.VariableTypes = ["double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable("/home/degoede/SEA/mdo_wd2/data/validation/plot_digitize/permeate_flow.csv", opts);

%% Convert to output type
time3_perm = tbl.VarName1;
perm3 = tbl.VarName2;

%% Clear temporary variables
clear opts tbl

%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: /home/degoede/SEA/mdo_wd2/data/validation/plot_digitize/recovery.csv
%
% Auto-generated by MATLAB on 19-Nov-2024 13:20:37

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["VarName1", "VarName2"];
opts.VariableTypes = ["double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable("/home/degoede/SEA/mdo_wd2/data/validation/plot_digitize/recovery.csv", opts);

%% Convert to output type
time3_recovery= tbl.VarName1;
recovery3 = tbl.VarName2;

%% Clear temporary variables
clear opts tbl

%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: /home/degoede/SEA/mdo_wd2/data/validation/plot_digitize/total_flow.csv
%
% Auto-generated by MATLAB on 19-Nov-2024 13:21:30

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["VarName1", "VarName2"];
opts.VariableTypes = ["double", "double"];

% Specify file level propertieVarName2s
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable("/home/degoede/SEA/mdo_wd2/data/validation/plot_digitize/total_flow.csv", opts);

%% Convert to output type
time3_total = tbl.VarName1;
total3 = tbl.VarName2;

%% Clear temporary variables
clear opts tbl

%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: /home/degoede/SEA/mdo_wd2/data/validation/plot_digitize/pressure.csv
%
% Auto-generated by MATLAB on 19-Nov-2024 15:05:56

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["VarName1", "VarName2"];
opts.VariableTypes = ["double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable("/home/degoede/SEA/mdo_wd2/data/validation/plot_digitize/pressure.csv", opts);

%% Convert to output type
time3_pressure = tbl.VarName1;
pressure3 = tbl.VarName2;

%% Clear temporary variables
clear opts tbl