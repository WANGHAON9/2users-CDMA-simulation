function testTurb()
    user1 = genBipolar(1000);
    [user1new,~] = selfCopy(user1,5);
    res = deTurb(user1new,5);
    [trueNum,accuracy] = compare(user1,res);
    fprintf("��ȷ��Ԫ����:%d\n��ȷ��:%f\n",trueNum,accuracy); 
end