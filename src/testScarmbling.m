%���������ڲ��Լ��ţ�ȥ��ģ���ܷ���������
function testScarmbling()
    %M���з����������Զ�������ͷ���ϵ��
    Mseq = MseqGen(5,67); %���������õ�m����
    raw = tripleGen(1e6);
    afterScarmb = scarmbling(raw,Mseq);
    res = deScarmbling(afterScarmb,Mseq);
    [trueNum,accuracy] = compare(raw,res);
    fprintf("��ȷ��Ԫ����:%d\n��ȷ��:%f\n",trueNum,accuracy);    
end