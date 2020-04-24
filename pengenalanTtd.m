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
input = [dA(1,:)' dM(1,:)' dV(1,:)'];
target = [1 0 0;0 1 0;0 0 1];
net = newp(input,target);
net.trainParam.epochs = 100;
for k = 1:10
    input = [dA(k,:)' dM(k,:)' dV(k,:)'];
    target = [1 0 0;0 1 0;0 0 1];
    net = train(net,input,target);
end
output=sim(net, dataVinni(:,1))
