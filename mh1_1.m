clc;
clear all;

%假设E、EC和U的论域：{-6,-5,…,-1,0,1,…,5,6}；E、EC和U定义了7个语言值{NB，NM，NS，Z，PS，PM，PB}；
Input1_Terms=[1,2,3,4,5,6,7];
Input2_Terms=[1,2,3,4,5,6,7];
Output_Terms=[1,2,3,4,5,6,7];

%各语言值的隶属函数采用三角函数
Input1_Terms_Membership=[1,0.5,0,0,0,0,0,0,0,0,0,0,0;
                        0,0.5,1,0.5,0,0,0,0,0,0,0,0,0;
                        0,0,0,0.5,1,0.5,0,0,0,0,0,0,0;
                        0,0,0,0,0,0.5,1,0.5,0,0,0,0,0;
                        0,0,0,0,0,0,0,0.5,1,0.5,0,0,0;
                        0,0,0,0,0,0,0,0,0,0.5,1,0.5,0;
                        0,0,0,0,0,0,0,0,0,0,0,0.5,1];
Input2_Terms_Membership=Input1_Terms_Membership;
Output_Terms_Membership=Input1_Terms_Membership;

%将语言值按顺序编号，NB、NM、NS、Z、PS、PM、PB分别对应1、2、3、4、5、6、7号。
Rule=[1,1,1,1,2,4,4;
      1,1,1,1,2,4,4;
      2,2,2,2,4,5,5;
      2,2,3,4,5,6,6;
      3,3,4,6,6,6,6;
      4,4,6,7,7,7,7;
      4,4,6,7,7,7,7];

for i=1:169
    for j=1:13
        R(i,j)=0;
    end
end

for Input1_Terms_Index=1:7
    for Input2_Terms_Index=1:7
        Output_Terms_Index=Rule(Input1_Terms_Index,Input2_Terms_Index );

        A=Input1_Terms_Membership(Input1_Terms_Index,:);
        B=Input2_Terms_Membership(Input2_Terms_Index,:);
        C=Output_Terms_Membership(Output_Terms_Index,:);
        
        for i=1:13
            for j=1:13
                R1(i,j)=min(A(i),B(j));
            end
        end

        R2=[ ];
        for k=1:13
            R2=[R2;R1(k,:)'];
        end

        for i=1:169
            for j=1:13
                R3(i,j)=min(R2(i),C(j));
            end
        end
      
        R=max(R,R3); 
    end
end



for Input1_value_index=1:13
    for Input2_value_index=1:13
        
        Input1_value_membership=Input1_Terms_Membership(:,Input1_value_index);
        [Max_Input1_value,Max_Input1_index]=max(Input1_value_membership);
        
        Ad=Input1_Terms_Membership(Max_Input1_index,:);
        
        Input2_value_membership=Input2_Terms_Membership(:,Input2_value_index);
        [Max_Input2_value,Max_Input2_index]=max(Input2_value_membership);
        
        Bd=Input2_Terms_Membership(Max_Input2_index,:);
        
        for i=1:13
            for j=1:13
                Rd1(i,j)=min(Ad(i),Bd(j));
            end
        end
        Rd2=[ ];
        for k=1:13
            Rd2=[Rd2,Rd1(k,:)];
        end
        for j=1:13
            Cd(j)=max(min(Rd2',R(:,j)));
        end
        sum1=0;
        sum2=0;
        for i=1:13
            sum1=sum1+Cd(i);
            sum2=sum2+Cd(i)*(i-7);
        end
        OUT=round(sum2/sum1);
        Fuzzy_Table(Input1_value_index,Input2_value_index)=OUT;
    end
end


save('mh1-1.mat','Fuzzy_Table');


