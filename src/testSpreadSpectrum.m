%���������ڲ�����Ƶ������ģ���Ƿ���������
%ע����Ƶ�������Ե���˫������
%function testSpreadSpectrum()
    raw = genBipolar(1e4);
    walshCode = walsh(64);
    afterDSSS = spreadSpectrum(raw,walshCode,4,2);
    res= deSpreadSpectrum(afterDSSS,walshCode,4,2);
    [trueNum,accuracy] = compare(raw,res);
    fprintf("��ȷ��Ԫ����:%d\n��ȷ��:%f\n",trueNum,accuracy); 
%end