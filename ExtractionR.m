
% main program



% extraction of conductances with only V
% by  oversampling's method

%% ....... Initialize

clc                                 % remove screen
clear                             % remove workspace


% initialize the interface graphic
       plottools('on')              
       propertyeditor('on')     
        plotbrowser('on')         



%% ....... structures

GGG = {};           %  graphics
TTT = {};           % f data and results
PPP = {};            % parameters of cell and parameters of algorithm

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%                                    ALGORITHME of VOLTAGE in OVERSAMPLING

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ....... enter of data

                     

                                                %parameter of cell
                         para = load('data/exemple4/Parametres.dat');

                     %              Note : The units of data is in SI
                         tt = load('data/exemple4/tt.dat');% time
                         gge = load('data/exemple4/gge.dat');% synapses excitators
                         ggi = load('data/exemple4/ggi.dat');% synapses inhibitors
             
                        
%                          
                   PPP.gl = para(1);%; %conductance leak [S]
                   PPP.Ee = para(2) ;  PPP.Ei= para(3); PPP.El= para(4); % potential inverse [V]
                   PPP.cap=para(5);        % capacity of soma [F]

                  limita = para(6); limitb =para(7);    %threshold singularities (see line 101) 
                  
                  PPP.Initial = para(8); % Voltage at time = 0;
                  
                  

%% ....... calcul voltage in oversampling                

                        oversampling = 4 ;                                                   % oversampling
                       [GGG] =  signalR(oversampling,gge,ggi,tt,PPP);  %voltage im oversampling

  
                       TTT = GGG; % transfert in structure TTT

                       % comparison voltage normal in voltage in  oversampling
                      GGG.g =1; 
                      graphR(GGG)
                      

 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%                                                               ALGORITHME of EXTRACTION     
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       
%% ....... organization vector voltage and time and extractions 

%                     This limits of dimension of vectors is necessary. This depend of the order approximation
%                      Here is 2
                  
                       Npoints= 2 ;  % quantity of  points
                          dim    =  length(GGG.tta);       
                               for n=1: dim-Npoints
                                   vva(n,1) =  GGG.vva(n);  %base vv           
                                   tta(n,1) =   GGG.tta(n);
                               end 
               
                       TTT.tta = tta(:,1);  %  time
                       TTT.vva = vva(:,1);  % Vm

%                 extractions of conductances and preconductances                                
                 [GGG TTT ] = algorithmeR(TTT,PPP,Npoints,limita, limitb); % voir ligne 55 et 56
    

%% ....... graphics
                                  

                                  %extraction of preconductances
                                 GGG.g = 2; 
                                 graphR(GGG);
                                 
                                 % extraction of conductances
                                 GGG.g=3; % extraction of conductances
                                 graphR(GGG)
                                 
                                 % singularities and preconductances
                                 GGG.g=4; 
                                 graphR(GGG)

                                   
      

                   