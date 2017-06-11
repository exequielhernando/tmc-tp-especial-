
function [probabilidad, todas_las_probabilidades] = calcular_probabilidad_dos_fallos_seguidos(epsilon)

  % Inicializo las variables que necesito
  probabilidad_anterior = 0; 
  probabilidad_actual = 1;  
  exitos = 0;
  total_de_casos = 0;
  todas_las_probabilidades = [];
  
  
  % Mientras el algoritmo no converge
  while ~converge(probabilidad_anterior, probabilidad_actual, epsilon, total_de_casos)
  
    % La probabilidad anterior es la probabilidad actual
    probabilidad_anterior = probabilidad_actual;
  
    % Arrojo la moneda
    experimento1 = my_mex_service(36628183);
    experimento2=my_mex_service(36628183);
      
    % Actualizo la cantidad de tiradas
    total_de_casos = total_de_casos+ 1;
    
    % Chequeo de qué lado cayó
    if ((experimento1==0)&&(experimento2)==0)
      exitos = exitos + 1;
    end
    
    % Calculo la probabilidad actual
    probabilidad_actual = exitos / total_de_casos;
    
    % Esto es solamente para poder hacer el grafico ----------------------------
    todas_las_probabilidades = cat(1, todas_las_probabilidades, probabilidad_actual);
    % --------------------------------------------------------------------------
        
  end
  
  % Devuelvo la probabilidad actual
  probabilidad = probabilidad_actual;

end



