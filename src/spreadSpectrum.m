%��Ƶ����
%userCode:��Ҫ��Ƶ���û���Ԫ
%PNseq:������Ƶ�������
%gain:��Ƶ����
%phase:�û���Ƶ����λ
function res = spreadSpectrum(userCode,PNseq,gain,phase)
    %���ȶ���Ԫ������������
    [~,userCode2] = selfCopy(userCode,gain);
    %������Ƶ�������
    [lineSize,~] = size(PNseq);
    %����Ƶ�������������,ʹ����λλ�ڵ�һ��
    PN = PNseq(phase:lineSize,:);
    PN = [PN;PNseq(1:phase-1,:)];
    res = bitMultiple(userCode2,PN(:)');
end