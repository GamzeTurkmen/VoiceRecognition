% demos for HMM 
d=5;
k = 2;
n = 16;
[x, model] = hmmRnd(d, k, n);
%%
z = hmmViterbi(x,model);
%%
[alpha,llh] = hmmFilter(x,model);
%%
[gamma,alpha,beta,c] = hmmSmoother(x,model);
%%
[model, llh] = hmmEm(x,k);
plot(llh)