clear all;

%Service times in hours
filenameBreadbrd = 'TraceC-Breadbrd.txt';
TBreadbrd = importdata(filenameBreadbrd);
filenameDesign = 'TraceC-Design.txt'; 
TDesign = importdata(filenameDesign);
filenameSoftware = 'TraceC-Software.txt';
TSoftware = importdata(filenameSoftware);
filenameSpec = 'TraceC-Spec.txt';
TSpec = importdata(filenameSpec);
filenameTest = 'TraceC-Test.txt';
TTest = importdata(filenameTest);
N = length(TBreadbrd);

%Fitting different distributions to service times of Breadbrd using the method of moments
st = TBreadbrd;
figure;
figure_handle = gcf;
figure_handle.Name = 'BreadBrd';
plot(sort(st),[1:N]/N);
hold on;
t = [0:0.1:max(st)];

%Exponential
moment1 = mean(st);
lambdaExpBreadbrd = 1/moment1;
yexp = @(t) 1-exp(-lambdaExpBreadbrd*t);
plot(t, yexp(t));

%Uniform
cmoment2 = mean((st-moment1).^2);
syms a b;
sol = solve([(a+b)/2==moment1, (a-b)^2/12==cmoment2], [a,b]);
aBreadbrd=double(min(sol.a));
bBreadbrd=double(max(sol.b));
yunif = @(t) max(0, min(1, (t-aBreadbrd) ./ (bBreadbrd-aBreadbrd)));
plot(t, yunif(t));

%Hyper-exponential
sigma = sqrt(cmoment2);
cvBreadBrd = sigma/moment1;
moment2 = mean(st.^2);
moment3 = mean(st.^3);
syms lambda1 lambda2 p1;
sol2 = solve([(p1/lambda1)+(1-p1)/lambda2==moment1, (p1/lambda1^2)+(1-p1)/lambda2^2==moment2/2, (p1/lambda1^3)+(1-p1)/lambda2^3==moment3/6], [lambda1,lambda2,p1]);
lambda1HypBreadbrd = sol2.lambda1(1);
lambda2HypBreadbrd = sol2.lambda2(1);
p1HypBreadbrd = sol2.p1(1);
fprintf(1, "Breadbrd step in Hyper-exponential distribution with: Lambda 1 = %g, Lambda 2 = %g, P1 = %g\n", lambda1HypBreadbrd, lambda2HypBreadbrd, p1HypBreadbrd);
p2HypBreadbrd=1-p1HypBreadbrd;
yHypexp = @(t) 1-(p1HypBreadbrd.*exp(-lambda1HypBreadbrd.*t) + (p2HypBreadbrd.*exp(-lambda2HypBreadbrd.*t)));
plot(t, yHypexp(t));

%We don't have to test other distributions because the Hyper-exponential fits very well with the samples.

axis([0 max(st) 0 1]);
legend('Trace', 'Exponential', 'Uniform', 'Hyper-exponential', 'Location','southeast');
hold off;

%Fitting different distributions to service times of Software using the method of moments
st = TSoftware;
figure;
figure_handle = gcf;
figure_handle.Name = 'Software';
plot(sort(st),[1:N]/N);
hold on;
t = [0:0.1:max(st)];

%Exponential
moment1 = mean(st);
lambdaExpSoftware = 1/moment1;
yexp = @(t) 1-exp(-lambdaExpSoftware*t);
plot(t, yexp(t));

%Uniform
cmoment2 = mean((st-moment1).^2);
syms a b;
sol = solve([(a+b)/2==moment1, (a-b)^2/12==cmoment2], [a,b]);
aSoftware=double(min(sol.a));
bSoftware=double(max(sol.b));
yunif = @(t) max(0, min(1, (t-aSoftware) ./ (bSoftware-aSoftware)));
plot(t, yunif(t));

%Hyper-exponential
sigma = sqrt(cmoment2);
cvSoftware = sigma/moment1;
moment2 = mean(st.^2);
moment3 = mean(st.^3);
syms lambda1 lambda2 p1;
sol2 = solve([(p1/lambda1)+(1-p1)/lambda2==moment1, (p1/lambda1^2)+(1-p1)/lambda2^2==moment2/2, (p1/lambda1^3)+(1-p1)/lambda2^3==moment3/6], [lambda1,lambda2,p1]);
lambda1HypSoftware = sol2.lambda1(1);
lambda2HypSoftware = sol2.lambda2(1);
p1HypSoftware = sol2.p1(1);
fprintf(1, "Software step in Hyper-exponential distribution with: Lambda 1 = %g, Lambda 2 = %g, P1 = %g\n", lambda1HypSoftware, lambda2HypSoftware, p1HypSoftware);
p2HypSoftware=1-p1HypSoftware;
yHypexp = @(t) 1-(p1HypSoftware.*exp(-lambda1HypSoftware.*t) + (p2HypSoftware.*exp(-lambda2HypSoftware.*t)));
plot(t, yHypexp(t));

%We don't have to test other distributions because the Hyper-exponential fits very well with the samples.

axis([0 max(st) 0 1]);
legend('Trace', 'Exponential', 'Uniform', 'Hyper-exponential', 'Location','southeast');
hold off;

%Fitting different distributions to service times of Design using the method of moments
st = TDesign;
figure;
figure_handle = gcf;
figure_handle.Name = 'Design';
plot(sort(st),[1:N]/N);
hold on;
t = [0:0.1:max(st)];

%Exponential
moment1 = mean(st);
lambdaExpDesign = 1/moment1;
yexp = @(t) 1-exp(-lambdaExpDesign*t);
plot(t, yexp(t));

%Uniform
cmoment2 = mean((st-moment1).^2);
syms a b;
sol = solve([(a+b)/2==moment1, (a-b)^2/12==cmoment2], [a,b]);
aDesign=double(min(sol.a));
bDesign=double(max(sol.b));
yunif = @(t) max(0, min(1, (t-aDesign) ./ (bDesign-aDesign)));
plot(t, yunif(t));

%Hyper-exponential
moment2 = mean(st.^2);
moment3 = mean(st.^3);
syms lambda1 lambda2 p1;
sol2 = solve([(p1/lambda1)+(1-p1)/lambda2==moment1, (p1/lambda1^2)+(1-p1)/lambda2^2==moment2/2, (p1/lambda1^3)+(1-p1)/lambda2^3==moment3/6], [lambda1,lambda2,p1]);
lambda1HypDesign = sol2.lambda1(1);
lambda2HypDesign = sol2.lambda2(1);
p1HypDesign = sol2.p1(1);
p2HypDesign=1-p1HypDesign;
yHypexp = @(t) 1-(p1HypDesign.*exp(-lambda1HypDesign.*t) + (p2HypDesign.*exp(-lambda2HypDesign.*t)));
plot(t, yHypexp(t));

%Erlang
sigma = sqrt(cmoment2);
cvDesign = sigma/moment1;
kDesign = round(1/(cvDesign^2));
lambdaErlangDesign = kDesign/moment1;
fprintf(1, "Design step in Erlang distribution with: k = %g, Lambda = %g\n", kDesign, lambdaErlangDesign);
syms i;
yErlang = @(t) (1-symsum((1/factorial(i)).*(exp(-lambdaErlangDesign*t).*((lambdaErlangDesign*t).^i)),i,0,kDesign-1));
plot(t, yErlang(t));

%We don't have to test other distributions because the Erlang distribution fits very well with the samples.

axis([0 max(st) 0 1]);
legend('Trace', 'Exponential', 'Uniform', 'Hyper-exponential', 'Erlang', 'Location','southeast');
hold off;

%Fitting different distributions to service times of Specification using the method of moments
st = TSpec;
figure;
figure_handle = gcf;
figure_handle.Name = 'Specification';
plot(sort(st),[1:N]/N);
hold on;
t = [0:0.1:max(st)];

%Exponential
moment1 = mean(st);
lambdaExpSpec = 1/moment1;
yexp = @(t) 1-exp(-lambdaExpSpec*t);
plot(t, yexp(t));

%Uniform
cmoment2 = mean((st-moment1).^2);
syms a b;
sol = solve([(a+b)/2==moment1, (a-b)^2/12==cmoment2], [a,b]);
aSpec=double(min(sol.a));
bSpec=double(max(sol.b));
yunif = @(t) max(0, min(1, (t-aSpec) ./ (bSpec-aSpec)));
plot(t, yunif(t));

%Hyper-exponential
moment2 = mean(st.^2);
moment3 = mean(st.^3);
syms lambda1 lambda2 p1;
sol2 = solve([(p1/lambda1)+(1-p1)/lambda2==moment1, (p1/lambda1^2)+(1-p1)/lambda2^2==moment2/2, (p1/lambda1^3)+(1-p1)/lambda2^3==moment3/6], [lambda1,lambda2,p1]);
lambda1HypSpec = sol2.lambda1(1);
lambda2HypSpec = sol2.lambda2(1);
p1HypSpec = sol2.p1(1);
p2HypSpec=1-p1HypSpec;
yHypexp = @(t) 1-(p1HypSpec.*exp(-lambda1HypSpec.*t) + (p2HypSpec.*exp(-lambda2HypSpec.*t)));
plot(t, yHypexp(t));

%Erlang
sigma = sqrt(cmoment2);
cvSpec = sigma/moment1;
kSpec = round(1/(cvSpec^2));
lambdaErlangSpec = kSpec/moment1;
fprintf(1, "Specification step in Erlang distribution with: k = %g, Lambda = %g\n", kSpec, lambdaErlangSpec);
syms i;
yErlang = @(t) (1-symsum((1/factorial(i)).*(exp(-lambdaErlangSpec*t).*((lambdaErlangSpec*t).^i)),i,0,kSpec-1));
plot(t, yErlang(t));

%We don't have to test other distributions because the Erlang fits very well with the samples.

axis([0 max(st) 0 1]);
legend('Trace', 'Exponential', 'Uniform', 'Hyper-exponential', 'Erlang', 'Location','southeast');
hold off;

%Fitting different distributions to service times of Test using the method of moments
st = TTest;
figure;
figure_handle = gcf;
figure_handle.Name = 'Test';
plot(sort(st),[1:N]/N);
hold on;
t = [0:0.1:max(st)];

%Exponential
moment1 = mean(st);
cmoment2 = mean((st-moment1).^2);
sigma = sqrt(cmoment2);
cvTest = sigma/moment1;
lambdaExpTest = 1/moment1;
fprintf(1, "Test step in Exponential distribution with: Lambda = %g\n", lambdaExpTest);
yexp = @(t) 1-exp(-lambdaExpTest*t);
plot(t, yexp(t));

%We don't have to test other distributions because the Exponential one has the standard deviation that is almost 1: cvTest= 1.00467

axis([0 max(st) 0 1]);
legend('Trace', 'Exponential', 'Location','southeast');
hold off;