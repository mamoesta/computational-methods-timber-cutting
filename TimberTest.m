% Setting the path
 cepath='/Users/MartyMoesta/Desktop/COMPECON/'; 
 path([cepath 'cetools;' cepath 'cedemos'],path);

% DEMDP03 Timber Cutting Model
  fprintf('\nTHIS IS A TEST\n')
  close all  
  
% ENTER MODEL PARAMETERS
  price =  1;                                           % output price
  k     =  0.2;                                         % replanting cost
  sbar  =  0.5;                                         % carrying capacity
  gamma =  0.1;                                         % growth rate
  delta =  0.95;                                        % discount factor
  
% CONSTRUCT ACTION SPACE
  x = [0;1];            

% PACK MODEL STRUCTURE
  clear model
  model.func = 'mfdp03';                                % reward/transition file
  model.discount = delta;                               % discount factor
  model.actions = x;                                    % model actions 
  model.params = {price k sbar gamma};                  % other parameters

% DEFINE APPROXIMATION SPACE
  n      = 500;                                         % degree of approximation
  fspace = fundefn2('spli',n,0,sbar);                    % function space
  snodes = funnode2(fspace);                             % state collocaton nodes
  
  % Setting the path
 cepath='/Users/MartyMoesta/Desktop/COMPECON/'; 
 path([cepath 'cetools;' cepath 'cedemos'],path);

% DEMDP03 Timber Cutting Model
  fprintf('\nDEMDP03 TIMBER CUTTING PROBLEM\n')
  close all  
  
% ENTER MODEL PARAMETERS
  price =  1;                                           % output price
  k     =  0.2;                                         % replanting cost
  sbar  =  0.5;                                         % carrying capacity
  gamma =  0.1;                                         % growth rate
  delta =  0.95;                                        % discount factor
  
% CONSTRUCT ACTION SPACE
  x = [0;1];            

% PACK MODEL STRUCTURE
  clear model
  model.func = 'mfdp03';                                % reward/transition file
  model.discount = delta;                               % discount factor
  model.actions = x;                                    % model actions 
  model.params = {price k sbar gamma};                  % other parameters

% DEFINE APPROXIMATION SPACE
  n      = 500;                                         % degree of approximation
  fspace = fundefn2('spli',n,0,sbar);                    % function space
  snodes = funnode2(fspace);                             % state collocaton nodes

% SOLVE BELLMAN EQUATION  
  [c,s,v,x,resid] = dpsolve2(model,fspace,snodes);
  
