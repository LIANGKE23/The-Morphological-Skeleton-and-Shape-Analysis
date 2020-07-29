% Purpose::
%        to explore Morphological Skeleton and the Partital
%        Restruction of X2B,X3B,X4B by using 'Square',
%        'RHOMBUS'and 'VEC045' structuring elements.
%
% Processing Flow::
%        1. Pre-process the image
%        2. Using the structuring element B to find the skeleton
%        3. To restruct t with 2B,3B and 4B.
%        4. Do the process on both 'Penn256' and 'bear'
% Authors::
%       Lindsey Schwartz, Ke Liang, Xilun Liu
% Date::
%       02/21/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%skeleton and reconstruction with Square as structuring element for penn256
X = imread('penn256.gif');
[M,N] = size(X);
structureE = [1,1,1,
    1,1,1,
    1,1,1]
B = strel(structureE)
FinalImage1 = X - imopen(X,B)
flag = 1
n=1
while flag ==1
        Num = n
        erodeNB = X
        while (Num>0)
             erodeNB = imerode(erodeNB,B)
             Num = Num-1
        end
    TestX = erodeNB
    flag = 0;
    for x = 1:M
     for y = 1:N
          if TestX(x,y) == 1
               flag = 1 ;
          end
     end
    end
    if flag == 1 
        FinalImage1 = FinalImage1 + (erodeNB - imopen(erodeNB,B));
         SK = erodeNB - imopen(erodeNB,B)
            Num = n
            while (Num>0)
                SK = imdilate(SK,B)
                Num = Num-1
            end
        if n==2
            X2b = SK        
        end
        if n>2
            X2b = SK + X2b
        end
        if n==3
            X3b = SK        
        end
        if n>3
            X3b = SK + X3b
        end
        if n==4
            X4b = SK        
        end
        if n>4
            X4b = SK + X4b
        end
        n= n+1      
    end  
end
X2b=X2b+FinalImage1
X3b=X3b+FinalImage1
X4b=X4b+FinalImage1
for x = 1:M
    for y= 1:N
        if FinalImage1(x,y)==1
                FinalImage1(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X2b(x,y)>0
               X2b(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X3b(x,y)>0
               X3b(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X4b(x,y)>0
               X4b(x,y) = 255;
        end
    end
end
figure, imshow(FinalImage1), title('skeleton with square as structuring element for penn256')
figure, imshow(X2b),title('reconstruction with square structuring element for penn256 of level 2')
figure, imshow(X3b),title('reconstruction with square structuring element for penn256 of level 3')
figure, imshow(X4b),title('reconstruction with square structuring element for penn256 of level 4')

%%skeleton and reconstruction  with RHOMBUS as structuring element for penn256
X = imread('penn256.gif');
[M,N] = size(X);
structureE = [0,1,0,
    1,1,1,
    0,1,0]
B = strel(structureE)
FinalImage2 = X - imopen(X,B)
flag = 1
n=1
while flag ==1
        Num = n
        erodeNB = X
        while (Num>0)
             erodeNB = imerode(erodeNB,B)
             Num = Num-1
        end
    TestX = erodeNB
    flag = 0;
    for x = 1:M
     for y = 1:N
          if TestX(x,y) == 1
               flag = 1 ;
          end
     end
    end
    if flag == 1 
        FinalImage2 = FinalImage2 + (erodeNB - imopen(erodeNB,B));
        SK = erodeNB - imopen(erodeNB,B)
            Num = n
            while (Num>0)
                SK = imdilate(SK,B)
                Num = Num-1
            end
        if n==2
            X2b = SK        
        end
        if n>2
            X2b = SK + X2b
        end
        if n==3
            X3b = SK        
        end
        if n>3
            X3b = SK + X3b
        end
        if n==4
            X4b = SK        
        end
        if n>4
            X4b = SK + X4b
        end
        n= n+1      
    end  
end  
X2b=X2b+FinalImage2
X3b=X3b+FinalImage2
X4b=X4b+FinalImage2
for x = 1:M
    for y= 1:N
        if FinalImage2(x,y)==1
                FinalImage2(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X2b(x,y)>0
               X2b(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X3b(x,y)>0
               X3b(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X4b(x,y)>0
               X4b(x,y) = 255;
        end
    end
end
figure, imshow(FinalImage2), title('skeleton with RHOMBUS as structuring element for penn256')
figure, imshow(X2b),title('reconstruction with RHOMBUS structuring element for penn256 of level 2')
figure, imshow(X3b),title('reconstruction with RHOMBUS structuring element for penn256 of level 3')
figure, imshow(X4b),title('reconstruction with RHOMBUS structuring element for penn256 of level 4')

%%skeleton and reconstruction with VEC045 as structuring element for penn256
X = imread('penn256.gif');
[M,N] = size(X);
structureE = [0,0,1,
    0,1,0,
    0,0,0]
B = strel(structureE)
FinalImage3 = X - imopen(X,B)
flag = 1
n=1
while flag ==1
        Num = n
        erodeNB = X
        while (Num>0)
             erodeNB = imerode(erodeNB,B)
             Num = Num-1
        end
    TestX = erodeNB
    flag = 0;
    for x = 1:M
     for y = 1:N
          if TestX(x,y) == 1
               flag = 1 ;
          end
     end
    end
    if flag == 1 
        FinalImage3 = FinalImage3 + (erodeNB - imopen(erodeNB,B));
        SK = erodeNB - imopen(erodeNB,B)
            Num = n
            while (Num>0)
                SK = imdilate(SK,B)
                Num = Num-1
            end
        if n==2
            X2b = SK        
        end
        if n>2
            X2b = SK + X2b
        end
        if n==3
            X3b = SK        
        end
        if n>3
            X3b = SK + X3b
        end
        if n==4
            X4b = SK        
        end
        if n>4
            X4b = SK + X4b
        end
        n= n+1      
    end  
end    
X2b=X2b+FinalImage3
X3b=X3b+FinalImage3
X4b=X4b+FinalImage3
for x = 1:M
    for y= 1:N
        if FinalImage3(x,y)==1
                FinalImage3(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X2b(x,y)>0
               X2b(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X3b(x,y)>0
               X3b(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X4b(x,y)>0
               X4b(x,y) = 255;
        end
    end
end
figure, imshow(FinalImage3), title('skeleton with VEC045 as structuring element for penn256')
figure, imshow(X2b),title('reconstruction with VEC045 structuring element for penn256 of level 2')
figure, imshow(X3b),title('reconstruction with VEC045 structuring element for penn256 of level 3')
figure, imshow(X4b),title('reconstruction with VEC045 structuring element for penn256 of level 4')

%%skeleton and reconstruction with Square as structuring element for bear
X = imread('bear.gif');
[M,N] = size(X);
structureE = [1,1,1,
    1,1,1,
    1,1,1]
B = strel(structureE)
FinalImage4 = X - imopen(X,B)
flag = 1
n=1
while flag ==1
        Num = n
        erodeNB = X
        while (Num>0)
             erodeNB = imerode(erodeNB,B)
             Num = Num-1
        end
    TestX = erodeNB
    flag = 0;
    for x = 1:M
     for y = 1:N
          if TestX(x,y) == 1
               flag = 1 ;
          end
     end
    end
    if flag == 1 
        FinalImage4 = FinalImage4 + (erodeNB - imopen(erodeNB,B));
        SK = erodeNB - imopen(erodeNB,B)
            Num = n
            while (Num>0)
                SK = imdilate(SK,B)
                Num = Num-1
            end
        if n==2
            X2b = SK        
        end
        if n>2
            X2b = SK + X2b
        end
        if n==3
            X3b = SK        
        end
        if n>3
            X3b = SK + X3b
        end
        if n==4
            X4b = SK        
        end
        if n>4
            X4b = SK + X4b
        end
        n= n+1      
    end  
end    
X2b=X2b+FinalImage4
X3b=X3b+FinalImage4
X4b=X4b+FinalImage4
for x = 1:M
    for y= 1:N
        if FinalImage4(x,y)==1
                FinalImage4(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X2b(x,y)>0
               X2b(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X3b(x,y)>0
               X3b(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X4b(x,y)>0
               X4b(x,y) = 255;
        end
    end
end
figure, imshow(FinalImage4), title('skeleton with square as structuring element for bear')
figure, imshow(X2b),title('reconstruction with square structuring element for bear of level 2')
figure, imshow(X3b),title('reconstruction with square structuring element for bear of level 3')
figure, imshow(X4b),title('reconstruction with square structuring element for bear of level 4')

%%skeleton and restruction with RHOMBUS as structuring element for bear
X = imread('bear.gif');
[M,N] = size(X);
structureE = [0,1,0,
    1,1,1,
    0,1,0]
B = strel(structureE)
FinalImage5 = X - imopen(X,B)
flag = 1
n=1
while flag ==1
        Num = n
        erodeNB = X
        while (Num>0)
             erodeNB = imerode(erodeNB,B)
             Num = Num-1
        end
    TestX = erodeNB
    flag = 0;
    for x = 1:M
     for y = 1:N
          if TestX(x,y) == 1
               flag = 1 ;
          end
     end
    end
    if flag == 1 
        FinalImage5 = FinalImage5 + (erodeNB - imopen(erodeNB,B));
                SK = erodeNB - imopen(erodeNB,B)
            Num = n
            while (Num>0)
                SK = imdilate(SK,B)
                Num = Num-1
            end
        if n==2
            X2b = SK        
        end
        if n>2
            X2b = SK + X2b
        end
        if n==3
            X3b = SK        
        end
        if n>3
            X3b = SK + X3b
        end
        if n==4
            X4b = SK        
        end
        if n>4
            X4b = SK + X4b
        end
        n= n+1      
    end  
end    
X2b=X2b+FinalImage5
X3b=X3b+FinalImage5
X4b=X4b+FinalImage5
for x = 1:M
    for y= 1:N
        if FinalImage5(x,y)==1
                FinalImage5(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X2b(x,y)>0
               X2b(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X3b(x,y)>0
               X3b(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X4b(x,y)>0
               X4b(x,y) = 255;
        end
    end
end
figure, imshow(FinalImage5), title('skeleton with RHOMBUS as structuring element for bear ')
figure, imshow(X2b),title('reconstruction with RHOMBUS structuring element for bear of level 2')
figure, imshow(X3b),title('reconstruction with RHOMBUS structuring element for bear of level 3')
figure, imshow(X4b),title('reconstruction with RHOMBUS structuring element for bear of level 4')

%%skeleton and restruction with VEC045 as structuring element for bear
X = imread('bear.gif');
[M,N] = size(X);
structureE = [0,0,1,
    0,1,0,
    0,0,0]
B = strel(structureE)
FinalImage6 = X - imopen(X,B)
flag = 1
n=1
while flag ==1
        Num = n
        erodeNB = X
        while (Num>0)
             erodeNB = imerode(erodeNB,B)
             Num = Num-1
        end
    TestX = erodeNB
    flag = 0;
    for x = 1:M
     for y = 1:N
          if TestX(x,y) == 1
               flag = 1 ;
          end
     end
    end
    if flag == 1 
        FinalImage6 = FinalImage6 + (erodeNB - imopen(erodeNB,B));
                        SK = erodeNB - imopen(erodeNB,B)
            Num = n
            while (Num>0)
                SK = imdilate(SK,B)
                Num = Num-1
            end
        if n==2
            X2b = SK        
        end
        if n>2
            X2b = SK + X2b
        end
        if n==3
            X3b = SK        
        end
        if n>3
            X3b = SK + X3b
        end
        if n==4
            X4b = SK        
        end
        if n>4
            X4b = SK + X4b
        end
        n= n+1      
    end  
end    
X2b=X2b+FinalImage6
X3b=X3b+FinalImage6
X4b=X4b+FinalImage6
for x = 1:M
    for y= 1:N
        if FinalImage6(x,y)==1
                FinalImage6(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X2b(x,y)>0
               X2b(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X3b(x,y)>0
               X3b(x,y) = 255;
        end
    end
end
for x = 1:M
    for y= 1:N
        if X4b(x,y)>0
               X4b(x,y) = 255;
        end
    end
end
figure, imshow(FinalImage6), title('skeleton with VEC045 as structuring element for bear')
figure, imshow(X2b),title('reconstruction with VEC045 structuring element for bear of level 2')
figure, imshow(X3b),title('reconstruction with VEC045 structuring element for bear of level 3')
figure, imshow(X4b),title('reconstruction with VEC045 structuring element for bear of level 4')


