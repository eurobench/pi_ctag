    % ----------------------------------------------------------------------- %
    % The tedSR  API is a toolkit for scalable performance metrics and        %
    % simulation. See http://eurobench2020.eu/ and the NOTICE file            %
    % for more information. TedSR is developed at Fundación para la Promoción %
    % de la Automoción en Galicia. CTAG, and supported by European Commission %
    % H2020 Progamme under TestEd FTP Eurobench.			      %
    %                                                                         %
    % Copyright (c) 2019-2020 CTAG and the authors                            %
    % Author(s): Jawad Masood      	                                      %
    %                                                                         %
    % Licensed under the Apache License, Version 2.0 (the "License");         %
    % you may not use this file except in compliance with the License.        %
    % You may obtain a copy of the License at                                 %
    % http://www.apache.org/licenses/LICENSE-2.0.                             %
    %                                                                         %
    % Unless required by applicable law or agreed to in writing, software     %
    % distributed under the License is distributed on an "AS IS" BASIS,       %
    % WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or         %
    % implied. See the License for the specific language governing            %
    % permissions and limitations under the License.                          %
    % ----------------------------------------------------------------------- %
    %                                                                         %
    % computePI.m                                                             %
    %                                                                         %
    % ----------------------------------------------------------------------- %
    %                                                                         %
    % GNU Octave, version 5.1.0 Copyright (C) 2018 John W. Eaton and others.  %
    % This is free software; see the source code for copying conditions.      %
    % There is ABSOLUTELY NO WARRANTY; not even for MERCHANTABILITY or        %
    % FITNESS FOR A PARTICULAR PURPOSE.                                       %
    % Octave was configured for "x86_64-w64-mingw32".                         %
    % Additional information about Octave is available at                     %
    % https://www.octave.org                                                  %
    % Please contribute if you find this software useful.                     %
    % For more information, visit https://www.octave.org/get-involved.html    %
    % Read https://www.octave.org/bugs.html to learn how to submit bug        %
    % reports.                                                                %
    % ----------------------------------------------------------------------- %

function result = computePI(csv_file, result_dir)

format longG;

%csv_file = "../tests/data/input/subject_01_run_01_chrono.csv";
%result_dir = "../tests/data/output";

disp(["Input parameters: ", csv_file, " ", result_dir])
    isOctave = exist('OCTAVE_VERSION', 'builtin') ~= 0;

if isOctave
  disp('Using Octave')
  pkg load signal;
  pkg load mapping;
  pkg load statistics;
  pkg load io;
else
  disp('Using Matlab')
  endif


rawData = csv2cell(csv_file, ',');
header = rawData(1, :);
taskTime = cell2mat(rawData(2:end, 1));
entryTime = taskTime(1, 1);
exitTime = taskTime(length(taskTime), 1);
taskCompletionTime = (exitTime - entryTime)/(1000);

% Sub-task completion algo may be added depending on resources

totalResult = [taskCompletionTime];

% EB sop for saving the data to the output folder

[filepath, name, ext] = fileparts(csv_file);

filename = strcat(result_dir, "/", "pi_chrono", ".yaml");
store_scalar(filename, totalResult);

endfunction