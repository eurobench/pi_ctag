    % ----------------------------------------------------------------------- %
    % The tedSR  API is a toolkit for scalable performance metrics and        %
    % simulation. See http://eurobench2020.eu/ and the NOTICE file            %
    % for more information. TedSR is developed at Fundación para la Promoción %
    % de la Automoción en Galicia. CTAG, and supported by European Comission  %
    % H2020 Progamme under TestEd FTP Eurobench.			%
    %                                                                         %
    % Copyright (c) 2019-2020 CTAG and the authors                            %
    % Author(s): Jawad Masood & Federico Macció                               %
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
    % rangeofMotionLP.m                                                              %
    % Author(s): Jawad Masood						      %
    % ----------------------------------------------------------------------- %
clear,clc, close all

% We need to check the following code before
DatosSubjects =load(sprintf (".\\tests\\data\\input\\%sa%s.txt", subject,run));

% EXTRAER DATOS DE ETIQUETAS, MAXIMOS Y MINIMOS DE CADA EJE Y ARTICULACION

for i=2:length(DatosSubjects.data(1,:))  
  Datos_Maximos_Minimos{1,i-1} = max(DatosSubjects.data(:,i));  % Datos Maximos
  Datos_Maximos_Minimos{2,i-1} = min(DatosSubjects.data(:,i));  % Datos Minimos
end


% We will include more code here to check the complaince of target joint angles with the relevant standard. Work in progress.

% PLOTEAR


for i=1:length(Datos_Maximos_Minimos)
    hold on 
    plot(i,Datos_Maximos_Minimos{1,i},'r*'); % Valores maximos de color rojo
    plot(i,Datos_Maximos_Minimos{2,i},'g*'); % Valores minimos de color verde 
end
