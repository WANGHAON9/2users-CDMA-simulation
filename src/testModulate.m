%���������ڲ���BPSK��������ģ���ܷ���������
function testModulate()
    carrier = 10*sin(0:pi/32:2*pi-pi/32);
    raw = tripleGen(1e6);
    afterModu = myModulate(raw,carrier);
    res = demodulate(afterModu,carrier);
    [trueNum,accuracy] = compare(raw,res);
    fprintf("��ȷ��Ԫ����:%d\n��ȷ��:%f\n",trueNum,accuracy);   
end