%{
    ������������������������������о����ƶ�ͨ��ʱ������ȶ������ʵ�Ӱ��
�����������˫�����룬Ȼ�󾭹���Ƶ�����ţ�BPSK���ƣ��Ӹ�˹�����������
Ȼ��ģ����ն˵Ľ����ȥ�ţ��������о���
    ͨ���ȽϽ��ն��о������ԭ������Ԫ������������ʣ�����ͨ��ϵͳ�ķ���
�Լ�������-����ȵı仯���ߵĻ���.
2019/11/22(����)
    �ڵ�ǰ�汾�У�����˶������&������������BPSK�����ز�����仯���仯
������о����ܡ���Ϊʵ�ʷ��֣�֮ǰ�Ĵ��������߻���-20dB��0dB������ƽ������
ʵ���Ų鷢�����ز���������µġ�����о�������֣����С��0.4ʱ��ϵͳ�޷�����
�������������������ں�����������ȵ����ӳ��ַ������ͣ�
^-^��Ҫ�õ������ߣ�ֻ�����ز����Ϊ1��ʱ��^-^,��Ȼ������������ӣ�������������ƽ��������ȷ�Χ��Խ��
ͬʱ���ִ���0.6�����߻�����ཻ��ĳһ�㣬����ǰͬ�������������ߵ������ʵͣ����ڽ����
***ͬ�ȵ�����������С�������ʷ����ͣ�����***
    �ڱ��汾�У�walsh�����������Ԫ����������Ƶ��û��ʹ��ǰһ��ľ����ȡ������
����˹��Ȱ�ķ��ϸ��������⣬��ǰ��Ľ�ȡ�汾ǡǡ˵�����ϸ������Ա�ϵͳӰ������
��Ӱ�첢���Ǻܴ󣬵�ȴ����ʹ��ϵͳ���ڸ��͵��������¹�����
    ���ˣ������Ѿ�����10�ΰ汾������
2019/12/1(����)
    �ڶ��δ�磬�Գ��ֲ���ƽ�����⣬������ʦ˵ϵͳ����̫���ˣ���ʵ��ϵͳ����������
���߲�Ӧ���������Ӱ�죬���ڴ��ٶԴ������޸ģ������������źŵ�ƽ�����ʣ���Ϊ��3
����������awgn������awgn��������źŵĹ�����Ϊ0dBW���������߻����غϡ���0.2��0.4
��������δ�����
    ���ˣ������11�ΰ汾����
2019/12/2(����)
    ��ʮ���ε�����
    ������Ϊʲô�����0.2��0.4ʱ��ϵͳ�޷�����������ԭ������Ϊ
bitMultiple��������������ʽת������int8�����¾��ȴ���ʧ�棡��ʱת����ʽ��Ϊ
�ڴ�ռ��������ٶ������㣬������췢�����˸��Ż����޸ĺ󣬷����ز��������ϵͳ
�����������߼�����Ӱ�졣
    ���⣬�������Ҳ�����޸ģ�����������Զ������о���ֵ�������֮ǰ��Ϊ�趨��ֵ
�ľ��ޣ���ֵ������̬�ֲ����㷨�����demodulate������ע�͡�
2020/7/1(����)
    i7-4790:ʵ������9.8��/�ֻ� @1280*2&1280��Ԫ20&10��Ƶ����
    ��ʮ���ε�����
    ������ź���ֻʹ����M���е�һ�е����⡣
2022/1/21(����)
    i7-12700K:ʵ������ 2.4��/�ֻ� @1280*2&1280��Ԫ20&10��Ƶ����
    Module����������ΪmyModule����ֹ��Matlab�ڽ�����������bug
    �޸�testModulate����������row��Ԫ���ȣ���ֹ��Ԫ����Ƶ�뱻������bug
2022/4/28(����)
%}
clear variable;
close all;

mulTimes = 5;  %�ֻش���

walshOrder = 64;    %walsh��Ľ��������������Ƶ����

N1 = 1280*2;   %�û�1��Ԫ����
N2 = 1280;   %�û�2��Ԫ����

user1SPgain = 10;  %�û�1����Ƶ����
user2SPgain = 20;  %�û�2����Ƶ����

%��¼�����û���walsh��λ,ע����λ������1��64֮��ȡֵ
%�����û���ȡֵ����һ��
user1Phase = 2; %�û�1����λ
user2Phase = 16; %�û�2����λ

%����ʹ�õ�m���еĲ���
mOrder = 5; %����5��
feedBack = 67;%����ϵ��67

%����ʱ��������ڵĲ�������
samplePiont = 4;

%������Ҫʹ�õ�walsh��
walshCode = walsh(walshOrder);

%��Ե����ܵ������Ż�����ȡ��ʱ�任ȡ�ռ��˼·
maxSnr = 20;    %���Ե���������
minSnr = -20;   %���Ե���С�����
div = 1;      %����ȵĳ��Բ���
maxTime = (maxSnr-minSnr)/div;  %���Դ���
timesUser1Acc = zeros(mulTimes,maxTime);
timesUser2Acc = zeros(mulTimes,maxTime);

%����˫������Ƭ
user1 = genBipolar(N1);
user2 = genBipolar(N2);   

%��Ƶ
spread1 = spreadSpectrum(user1,walshCode,user1SPgain,user1Phase);
spread2 = spreadSpectrum(user2,walshCode,user2SPgain,user2Phase);

%����
Mseq1 = MseqGen(mOrder,feedBack); %�û�1�����õ�m����
Mseq1 = Mseq1(:);
Mseq2 = MseqGen(mOrder,feedBack); %�û�2�����õ�m����
Mseq2 = Mseq2(:);
user1scarm = scarmbling(spread1,Mseq1);
user2scarm = scarmbling(spread2,Mseq2);

maxAmp = 1.2;    %���Ե�����ز����
minAmp = 0.2;   %���Ե���С�ز����
divAmp = 0.2;      %�ز�����ĳ��Բ���
maxTimesAmp = floor((maxAmp-minAmp)/divAmp);  %������Դ���

ampRecords1 = zeros(maxTimesAmp,maxTime);
ampRecords2 = zeros(maxTimesAmp,maxTime);

for amp = 1:maxTimesAmp %���Բ�ͬ���ز�����µ�����
    
    fprintf('Ŀǰ���ڵ�%d�����\n',amp);

    %����BPSK
    %�����ز�,���û�ʹ��ͬһ���ز�
    carrier = (minAmp + divAmp*(amp-1))*sin(0:(pi/samplePiont):(2*pi-2*pi/samplePiont));
    user1modulate = myModulate(user1scarm,carrier);
    user2modulate = myModulate(user2scarm,carrier);
    
    %�����ز�����
    power = powerCnt(carrier);
    for times = 1:mulTimes

        fprintf('Ŀǰ���ڵ�%d���ֻ�\n',times);

        user1Acc = zeros(1,maxTime);
        user2Acc = zeros(1,maxTime);

        parfor index = 1:maxTime 
            snr = minSnr + (index-1)*div; %���ڷ����ź��ϵĸ�˹�����������(dBW)
                        
            %ͨ����˹�ŵ�����Ӹ�˹����
            user1send = awgn(user1modulate,snr,power);
            user2send = awgn(user2modulate,snr,power);

            %���շ�
            receive = user1send + user2send; %�յ�����������ź�

            %���
            demodulateRes = demodulate(receive,carrier);

            %ȥ��
            user1Descarm = deScarmbling(demodulateRes,Mseq1);
            user2Descarm = deScarmbling(demodulateRes,Mseq2);

            %����
            user1deDS = deSpreadSpectrum(user1Descarm,walshCode,user1SPgain,user1Phase);
            user2deDS = deSpreadSpectrum(user2Descarm,walshCode,user2SPgain,user2Phase);

            %����������
            [~,user1Accuracy] = compare(user1,user1deDS);
            [~,user2Accuracy] = compare(user2,user2deDS);
            user1Acc(index) = 1-user1Accuracy;
            user2Acc(index) = 1-user2Accuracy;
        end
        timesUser1Acc(times,:) = user1Acc;
        timesUser2Acc(times,:) = user2Acc;
    end
    %�ܽ�ͳ�ƶ��ʵ��Ľ��
    for i = 1:maxTime
        user1Acc(i) = mean(timesUser1Acc(:,i));
        user2Acc(i) = mean(timesUser2Acc(:,i));
    end
    ampRecords1(amp,:) = user1Acc;
    ampRecords2(amp,:) = user2Acc;
end

%������������ȵı仯����
figure(1);
X1 = (minSnr:div:maxSnr-div);
semilogy(X1,ampRecords1(5,:),'b');
xlabel('�����(dB)');
ylabel('������');
title('������������ȵı仯����');
hold on;
semilogy(X1,ampRecords2(5,:),'g');
legend('�û�1(��Ƶ����10)','�û�2(��Ƶ����20)');

%�û�1�����ͬ��������������ȵı仯����
figure(2);
for i = 1:maxTimesAmp
    semilogy(X1,ampRecords1(i,:));
    hold on;
end
xlabel('�����(dB)');
ylabel('������');
title('�û�1�����ͬ��������������ȵı仯����');
legend('0.2','0.4','0.6','0.8','1.0');

%�û�2�����ͬ��������������ȵı仯����
figure(3);
for i = 1:maxTimesAmp
    semilogy(X1,ampRecords2(i,:));
    hold on;
end
xlabel('�����(dB)');
ylabel('������');
title('�û�2�����ͬ��������������ȵı仯����');
legend('0.2','0.4','0.6','0.8','1.0');