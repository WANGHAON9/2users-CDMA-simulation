%���������ڽ���
%userCode:��Ҫ�������û���Ԫ
%PNseq:������Ƶ�������
%gain:��Ƶ����
%phase:�û���Ƶ����λ
function res = deSpreadSpectrum(userCode,PNseq,gain,phase)
    [lineSize,~] = size(PNseq);
    PN = PNseq(phase:lineSize,:);
    PN = [PN;PNseq(1:phase-1,:)];
    temps = bitMultiple(userCode,PN(:)');
    %������matlab��һ��Сbug,������������Ϊ����,�ҵ�Ҫ��������
    %��Ϊ����,����Ҫ���з�д��ȡת�þ���
    temps = reshape(temps,gain,length(temps)/gain);
    temps = temps';
    %�����ڶ���,��Ԫ�о�
    res = ones(1,length(temps(:))/gain);
    for i = 1:length(temps(:))/gain
        if sum(temps(i,:)) < 0
            res(i) = -1;
        end
    end
end