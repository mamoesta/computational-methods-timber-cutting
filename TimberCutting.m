% Determining the path
%cepath='/Applications/MATLAB.app/compecon/'; 
%path([cepath 'cetools;' cepath 'cedemos'],path);

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
  fspace = fundefn('spli',n,0,sbar);                    % function space
  snodes = funnode(fspace);                             % state collocaton nodes
  mart = fspace.parms{1}{:};
  soph = snodes(:,1);
  henry = int16(1);
  %disp(mart)
  %disp(soph)
  %disp(henry)
  %feval(splibas,mart,soph,);
  %funbasx(fspace,snodes);
  lookup(snodes,snodes,3);
  