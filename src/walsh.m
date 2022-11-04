% ���� Walsh����ͨ�ú���
% ����N��ʾWalsh��������,��N����2����ʱ,ͨ���������ȡ��ʹ������Walsh����Ϊ2����
function [walsh]=walsh(N)
    M = ceil(log2(N));
    wn = 0;
    for i = 1:M
        w2n = [wn,wn;wn,~wn];
        wn = w2n;
    end
    wn(wn == 0) = -1;
    walsh = int8(wn);
end