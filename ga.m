

N = 200;
Pc = 0.99;
Pm = 0.005;
ITER = 400;
m = 3; %tedad moteghayer ha
BS=[30 30 30];
L = sum(BS);
Lo=[0 14.7 0];
Hi=[15.1 94.2 5371];
Population = round(rand(N,L));% jamiat tasadofi avalie


best_so_far = [];
Average_fitness = [];
for it = 1:ITER
    
   [real_val] =chrome_decode(Population,N,L,BS,m,Lo,Hi);
   [selection_probability,fit,ave_fit,max_fit,opt_sol] =fit_eval(real_val,N,m);
   if it==1
       best_so_far(it) = max_fit;
       final_sol = opt_sol;
   elseif max_fit < best_so_far(it-1)
       best_so_far(it)=max_fit;
       final_sol = opt_sol;
   else
       best_so_far(it) = best_so_far(it-1)
   end
   Average_fitness(it) = ave_fit;
   
   [mating_pool] = g_roulette_wheel(Population,N,selection_probability);
   [new_pop] = g_crossover(mating_pool,Pc,N,L);
   [Population] = g_mutation(new_pop,Pm,N,L);
end
display('final solution   optimum fiteness');
result=[final_sol,best_so_far(end)]
x=1:ITER;
plot(x,best_so_far,'k',x,Average_fitness,'-k');
xlabel('generation');
ylabel('fitness function');
legend('best-so-far','average fitness');
   
    


