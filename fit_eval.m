function [selection_probability,fit,ave_fit,max_fit,opt_sol] = fit_eval(real_val,N,m)
 for(i=1:N)
        x=real_val(i,:);
        temp1=400*(x(1)^0.9);
        temp2=22*((-14.7+x(2))^1.2);
        temp3=x(3)+1000;
        fit(i)=(temp1+temp2+temp3);
    end
    selection_probability=1-(fit/sum(fit));
    ave_fit=mean(fit);
    [max_fit,max_loc]=min(fit);
    opt_sol=real_val(max_loc,:);
return;

