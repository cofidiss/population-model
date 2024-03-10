
 clear 
 clear all
% y=C1.Y?l +C2; ?eklinde olsun
%A=[2016,1;2017,1;2018,1;2019,1];

% y=C1.Y?l^2+C2.Y?l +C3; ?eklinde olsun
%A=[2009^2,2009,1;2010^2,2010,1;2011^2,2011,1;2012^2,2012,1;2013^2,2013,1;2014^2,2014,1;2015^2,2015,1;2016^2,2016,1;2017^2,2017,1;2018^2,2018,1;2019^2,2019,1];

A=[2016,1;2017,1;2018,1;2019,1];
b = [422964/78741053;426662/79814871;426449/80810525;435941/82003882];
%b = [369703/71517100;366471/72561312;376162/73722988;376520/74724269;373041/75627384;391091/76667864;405528/77695904;422964/78741053;426662/79814871;426449/80810525;435941/82003882];
[xolen,flag,relres,iter,resvec,lsvec]  = lsqr(A,b,1e-20,100);
years =2016:2019;
contyears = years(1):0.1:2019;
modelData = xolen(1)*contyears  + xolen(2) ;
% error hesaplama
relativeresidualerror =  norm(b-A*xolen)/norm(b) ;
plot(years,b,"or",'MarkerSize',12,'LineWidth',2);
hold on
plot(contyears,modelData,'MarkerSize',12,'LineWidth',2);
ylim([min(b)*0.9, max(b)*1.1]);
hold off


xticks(years);

title("  Ölen Kiþi Sayýsýnýn Bir Önceki Yýlýn Nüfusuna Oraný");
xlabel("Yýl");
ylabel(" Ölen Kiþi Oraný");
legend('Data Noktalarý','Model Eðrisi','Location','northwest')

annotation('textbox', [0.5, 0.2, 0.1, 0.1], 'String',  sprintf('norm(error) / norm(b) = %f', relativeresidualerror))



%{

olumsayisi=[369703,366471,376162,376520,373041,391091,405528,422964,426662,426449,435941];
boxplot(olumsayisi)
ylabel('Ölüm Sayýsý')
title('2009-2019 Arasý Ölümlerin Kutu Grafiði')
 xlabel('2009-2019 Arasý Ölümler')
%}
 


function [nufusguess] = nufustahmini(yearToGuess,referenceYear,referenceyearnufus)
%{
guess= [];
for year = 2017:2080
 guess = [guess, nufustahmini(year,2016,79814871)] 
end
guess = guess.';
string(guess)
%}


A = [(referenceYear+1);1];


Xdogum=[-0.000745910825872277;1.52061535886091].';
Xolum = [-2.34937833022207e-05;0.0527263267816436].';
Xdisagoc =[0.000613348307733550;-1.23406170880923].';
Xicegoc = [99948.6999999972;-201121063.999994].';

while (yearToGuess - referenceYear)>0  
    
degisim =((Xdogum*A - Xolum*A - Xdisagoc*A)*referenceyearnufus + Xicegoc*A);
referenceyearnufus = referenceyearnufus + round(degisim);
referenceYear = referenceYear + 1;
A = [(referenceYear+1);1];

end

nufusguess = referenceyearnufus;

end



clear all 
clear
% y=C1.Y?l +C2; ?eklinde olsun
%A=[2016,1;2017,1;2018,1;2019,1];

% y=C1.Y?l^2+C2.Y?l +C3; ?eklinde olsun
A=[2016,1;2017,1;2018,1;2019,1];



b= [380921;466333;577457;677042];
[xicegoc,flag,relres,iter,resvec,lsvec]  = lsqr(A,b,1e-20,100);
years =[2016,2017,2018,2019];
contyears = 2016:0.1:2019;
modelData = xicegoc(1)*contyears + xicegoc(2) ;
% error hesaplama
relativeresidualerror =  norm(b-A*xicegoc)/norm(b) ;
plot(years,b,"or",'MarkerSize',12,'LineWidth',2);
hold on
plot(contyears,modelData,'MarkerSize',12,'LineWidth',2);
ylim([min(b)*0.9, max(b)*1.1]);
hold off


xticks(years);

title("   Türkiye'ye Gelen Göç Sayýsýnýn Yýllara Göre Deðiþimi");
xlabel("Yýl");
ylabel("Türkiye'ye Gelen Göç Sayýsý");
legend('Data Noktalarý','Model Eðrisi','Location','northwest')

annotation('textbox', [0.5, 0.2, 0.1, 0.1], 'String',  sprintf('norm(error) / norm(b) = %f', relativeresidualerror))



%{


icgocsayisi=[380921;466333;577457;677042];
boxplot(icgocsayisi)
ylabel('Ýçe Göç Sayýsý')
title('2016-2019 Arasý Ýçe Göçlerin Kutu Grafiði')
 xlabel('2016-2019 Arasý Ýçe Göçler')
%}

clear all 
clear
% y=C1.Y?l +C2; ?eklinde olsun
%A=[2016,1;2017,1;2018,1;2019,1];

% y=C1.Y?l^2+C2.Y?l +C3; ?eklinde olsun
%A=[2009^2,2009,1;2010^2,2010,1;2011^2,2011,1;2012^2,2012,1;2013^2,2013,1;2014^2,2014,1;2015^2,2015,1;2016^2,2016,1;2017^2,2017,1;2018^2,2018,1;2019^2,2019,1];
A=[2016,1;2017,1;2018,1;2019,1];

b=[1315423/78741053;1298451/79814871;1253981/80810525;1186560/82003882];
%b= [1266751/72561312;1261169/73722988;1252812/74724269;1294605/75627384;1297505/76667864;1351088/77695904;1336908/78741053;1315423/78741053;1298451/79814871;1253981/80810525;1186560/82003882];
[xdogan,flag,relres,iter,resvec,lsvec]  = lsqr(A,b,1e-20,100);
years =2016:2019;
contyears = years(1):0.1:2019;
modelData = xdogan(1)*contyears+ xdogan(2);
% error hesaplama
relativeresidualerror =  norm(b-A*xdogan)/norm(b) ;
plot(years,b,"or",'MarkerSize',12,'LineWidth',2);
hold on
plot(contyears,modelData,'MarkerSize',12,'LineWidth',2);
ylim([min(b)*0.9, max(b)*1.1]);
hold off


xticks(years);
title("  Doðan Bebek Sayýsýnýn Bir Önceki Yýlýn Nüfusuna Oraný");
xlabel("Yýl");
ylabel(" Doðan Bebek Oraný");
legend('Data Noktalarý','Model Eðrisi','Location','northwest')

annotation('textbox', [0.5, 0.2, 0.1, 0.1], 'String',  sprintf('norm(error) / norm(b) = %f', relativeresidualerror))





%{
dogumsayisi=[1266751,1261169,1252812,1294605,1297505, 1351088,1336908,  1315423,1298451,1253981,1186560];
boxplot(dogumsayisi)
ylabel('Doðum Sayýsý')
title('2009-2019 Arasý Doðumlarýn Kutu Grafiði')
 xlabel('2009-2019 Arasý Doðumlar')

%}
 
 
clear all 
clear


% y=C1.Y?l +C2; ?eklinde olsun
%A=[2016,1;2017,1;2018,1;2019,1];

% y=C1.Y?l^2+C2.Y?l +C3; ?eklinde olsun
A=[2016,1;2017,1;2018,1;2019,1];



b= [177960/78741053;253640/79814871;323918/80810525;330289/82003882];
[xdisagoc,flag,relres,iter,resvec,lsvec]  = lsqr(A,b,1e-20,100);
years =[2016,2017,2018,2019];
contyears = 2016:0.1:2019;
modelData = xdisagoc(1)*contyears + xdisagoc(2) ;
% error hesaplama
relativeresidualerror =  norm(b-A*xdisagoc)/norm(b) ;
plot(years,b,"or",'MarkerSize',12,'LineWidth',2);
hold on
plot(contyears,modelData,'MarkerSize',12,'LineWidth',2);
ylim([min(b)*0.9, max(b)*1.1]);
hold off
xticks(years);
title("   Türkiye'den Giden Göç Sayýsýnýn Bir Önceki Yýlýn Nüfusuna Oraný");
xlabel("Yýl");
ylabel("Türkiye'den Giden Göç Oraný");
legend('Data Noktalarý','Model Eðrisi','Location','northwest')

annotation('textbox', [0.5, 0.2, 0.1, 0.1], 'String',  sprintf('norm(error) / norm(b) = %f', relativeresidualerror))






%{


nufus=[72561312;73722988;74724269;75627384;76667864;77695904;78741053;79814871;80810525;82003882];
boxplot(nufus)
ylabel('Nüfus')
title('2008-2018 Arasý Nüfusun Kutu Grafiði')
 xlabel('2008-2018 Arasý Nüfus')


%}

clear all
close all
clc

% y=C1.Y?l +C2; ?eklinde olsun
%A=[2016,1;2017,1;2018,1;2019,1];

% y=C1.Y?l^2+C2.Y?l +C3; ?eklinde olsun
A=[2016^2,2016,1;2017^2,2017,1;2018^2,2018,1;2019^2,2019,1];



b= [422964/78741053;426662/79814871;426449/80810525;435941/82003882];
[x,flag,relres,iter,resvec,lsvec]  = lsqr(A,b);
years =[2016,2017,2018,2019];

fittedData = A*x;

% error hesaplama
relativeresidualerror =  norm(b-A*x)/norm(b) ;

plot(years,b,"o",years,fittedData);
ylim([min(b)*0.9, max(b)*1.1]);

xticks(years);
title(' Olen Kisi Sayisinin Bir Onceki Yilin Nufusuna Orani');
xlabel("Yil");
ylabel("Olum Orani");







 
 


