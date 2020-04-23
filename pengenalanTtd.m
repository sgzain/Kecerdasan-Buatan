clear all;
addpath('data ttd/afif');
load afif.mat
dataAfif = data;
load mutiara.mat
dataMutiara = data;
load vinni.mat
dataVinni = data;
dV = dataVinni';
dA=dataAfif';
dM = dataMutiara';
input = [dA;dM;dV]';
target = zeros(30,30);
target(1:10,1:10)=1;
target(11:20,11:20)=1;
target(21:30,21:30)=1;
net = newp(input,target);
net.trainParam.epochs = 100;
net = train(net,input,target);
output=sim(net, dataVinni(:,3))