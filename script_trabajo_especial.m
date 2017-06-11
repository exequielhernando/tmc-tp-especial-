% Inicializamos los errores epsilon
tic
i=1;
while i<=3
  if i==1
    epsilon = 0.1;
  elseif i==2
    epsilon = 0.01;
    
  else
    epsilon = 0.001;
  end 
  i++;
  
  % Calculamos la probabilidad del experimento
  [probabilidad, todas_las_probabilidades] = calcular_probabilidad_dos_fallos_seguidos(epsilon);
  
  % Mostramos por pantalla la probabilidad que nos dio el experimento
  fprintf('La probabilidad de exito es: %d\n', probabilidad);

  % Graficamos como fue evolucionando la probabilidad iteracion a iteracion
  figure, plot(todas_las_probabilidades);
  hold on
  plot(ones(size(todas_las_probabilidades)) * 0.5, '--');
  xlabel('Numero de iteracion');
  ylabel('Probabilidad');
  ylim([0 1]);
  legend('Evolucion de la probabilidad', 'Probabilidad analitica');

  %desvios estandar de las probabilidades parciales en las primeras 20 y las ultimas 20 iteraciones
   
  desvio_estandar_primeros_veinte = std(todas_las_probabilidades(1:20))
  desvio_estandar_ultimos_veinte = std(todas_las_probabilidades(end-20:end))
 tiempo_ejecucion=toc;
 fprintf('El tiempo de ejecucion es: %d\n', tiempo_ejecucion);

 end