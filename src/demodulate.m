function res = demodulate(input,carrier)
%������ʵ�ֶԽ����źŵĽ��
%ԭ��:���ԱȽ�
%input:��������ź�
%carrier:�ز��ź�

%��λѭ�����
res_bitMultiple = bitMultiple(input,carrier);
%�������
res_arrayGroupSum = arrayGroupSum(res_bitMultiple,length(carrier));
%{
    ���������û���1��-1����һ��(������������)��
    �������Ϊ1��-1�ĸ���Ϊ1/4��0�ĸ���Ϊ1/2��
    Ϊ�˴����㣬���ݴ����������Ƶ���Ϊ��̬�ֲ���
    �Ӷ�������̬�ֲ������ܶȼ�����ֵ��
%}
%���㷽��
res_var = var(input);
%����ƽ����
res_mean = mean(input);
%�������Ϊ1/4ʱ����ֵ��С�ڸ���ֵ�о�Ϊ-1����ֵ
threshhold_negative = norminv(1/4,res_mean,res_var);
%�������Ϊ3/4ʱ����ֵ�����ڸ���ֵ�о�Ϊ1����ֵ
threshhold_postive = norminv(3/4,res_mean,res_var);
res = zeros(1,length(res_arrayGroupSum));
for i = 1:length(res_arrayGroupSum)
    if res_arrayGroupSum(i) > threshhold_postive
        res(i) = 1;
    elseif res_arrayGroupSum(i) < threshhold_negative
        res(i) = -1;
    end
end
end