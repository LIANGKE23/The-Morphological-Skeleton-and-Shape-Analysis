% Purpose::
%        to do the Shape Analysis isolate distinct objects and find
%        minimum bounding rectangle(MBR) enclosing each distinct 
%        object.To Find which object in 'shadow1' best matches in the object
%        in 'shadow1rotated'.
%
% Processing Flow::
%        1. Pre-process the image
%        2. Finding the object in 2 image
%        3. Compute the size distribution and pectrum.
%        4. Compute the complexity
%        5. Compute the distance and find the smallest distance 
%        6. Refinding the object and the complementary object
% Authors::
%       Lindsey Schwartz, Ke Liang, Xilun Liu
% Date::
%       02/21/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = inputdlg('number of L: L=1 to 8. 1--black falling down Peanuts;2--white standing position 1 Peanuts;3--white falling down Peanuts;4--black standing position 2 Peanuts;5--black standing position 3 Peanuts;6--white standing position 2 Peanuts;7--black standing position 1 Peanuts;8--white standing position 3 Peanuts');
B = str2num(cell2mat(A));
X = imread('shadow1rotated.gif');
L = bwlabel(X,8);
[r, c] = find(L==B);
rc = [r,c]
[m,n]= size(rc)
minX = 256
maxX = 1
minY= 256
maxY= 1
for x=1:m
    if rc(x,1) < minX
        minX = rc(x,1)
    end
    if rc(x,1) > maxX
        maxX = rc(x,1)
    end
    if rc(x,2) < minY
        minY = rc(x,2)
    end
    if rc(x,2) > maxY
        maxY = rc(x,2)
    end
end
Object1 = imcrop(X,[ (minY-6) (minX-6) (maxY-minY+12)  (maxX-minX+12)])
NumofB = 0:19;
sizeDistribution = zeros(1,20)
n=1
SizeDis = 0;
[M,N] = size(Object1)
for x = 1:M
    for y= 1:N
        if Object1(x,y) == 1
                SizeDis = SizeDis+1;
        end
    end
end
sizeDistribution(1,n) = SizeDis
flag = 1
while flag == 1
    TestX = imopen(Object1,strel('square',3+(2*(n-1))))
    flag = 0;
    for x = 1:M
     for y = 1:N
          if TestX(x,y) == 1
               flag = 1 ;
          end
     end
    end
    if flag == 1
        SizeDis = 0
       for x = 1:M
        for y= 1:N
        if TestX(x,y) == 1
                SizeDis = SizeDis+1;
        end
        end
       end 
        n = n + 1
        sizeDistribution(1,n) = SizeDis
    end  
end
pectrum = zeros(1,20)
for x= 1:n+1
    pectrum(x) = (sizeDistribution(x) - sizeDistribution(x+1))/sizeDistribution(1)
end
pectrum1 = pectrum
X = imread('shadow1.gif');
L = bwlabel(X,8);
distance=[]
for k=1:8 
[r, c] = find(L==k);
rc = [r,c]
[m,n]= size(rc)
minX = 256
maxX = 1
minY= 256
maxY= 1
for x=1:m
    if rc(x,1) < minX
        minX = rc(x,1)
    end
    if rc(x,1) > maxX
        maxX = rc(x,1)
    end
    if rc(x,2) < minY
        minY = rc(x,2)
    end
    if rc(x,2) > maxY
        maxY = rc(x,2)
    end
end
Object2 = imcrop(X,[ (minY-6) (minX-6) (maxY-minY+12)  (maxX-minX+12)])
NumofB = 0:19;
sizeDistribution = zeros(1,20)
n=1
SizeDis = 0;
[M,N] = size(Object2)
for x = 1:M
    for y= 1:N
        if Object2(x,y) == 1
                SizeDis = SizeDis+1;
        end
    end
end
sizeDistribution(1,n) = SizeDis
flag = 1
while flag == 1
    TestX = imopen(Object2,strel('square',3+(2*(n-1))))
    flag = 0;
    for x = 1:M
     for y = 1:N
          if TestX(x,y) == 1
               flag = 1 ;
          end
     end
    end
    if flag == 1
        SizeDis = 0
       for x = 1:M
        for y= 1:N
        if TestX(x,y) == 1
                SizeDis = SizeDis+1;
        end
        end
       end 
        n = n + 1
        sizeDistribution(1,n) = SizeDis
    end  
end
pectrum = zeros(1,20)
for x= 1:n+1
    pectrum(x) = (sizeDistribution(x) - sizeDistribution(x+1))/sizeDistribution(1)
end
pectrum2 = pectrum
Cn = [1.0,0.8,0.6,0.4,0.2,0.1,0.1,0.1,0.1,0.1]
n = 1
distance(k)=0
while n <11
    distance(k) = distance(k) + sqrt(Cn(1,n)*((pectrum1(1,n) - pectrum2(1,n))^2))
    n = n+1
end
end

minvalue=distance(1)
for i=1:8
    if distance(i)<= minvalue
        minvalue=distance(i);
    end
end

if minvalue==distance(1)
    k=1
end
if minvalue==distance(2)
    k=2
end
if minvalue==distance(3)
    k=3
end
if minvalue==distance(4)
    k=4
end
if minvalue==distance(5)
    k=5
end
if minvalue==distance(6)
    k=6
end
if minvalue==distance(7)
    k=7
end
if minvalue==distance(8)
    k=8
end
    
[r, c] = find(L==k);
rc = [r,c]
[m,n]= size(rc)
minX = 256
maxX = 1
minY= 256
maxY= 1
for x=1:m
    if rc(x,1) < minX
        minX = rc(x,1)
    end
    if rc(x,1) > maxX
        maxX = rc(x,1)
    end
    if rc(x,2) < minY
        minY = rc(x,2)
    end
    if rc(x,2) > maxY
        maxY = rc(x,2)
    end
end
Object2 = imcrop(X,[ (minY-6) (minX-6) (maxY-minY+12)  (maxX-minX+12)])
NumofB = 0:19;
sizeDistribution = zeros(1,20)
n=1
SizeDis = 0;
[M,N] = size(Object2)
for x = 1:M
    for y= 1:N
        if Object2(x,y) == 1
                SizeDis = SizeDis+1;
        end
    end
end
sizeDistribution(1,n) = SizeDis
flag = 1
while flag == 1
    TestX = imopen(Object2,strel('square',3+(2*(n-1))))
    flag = 0;
    for x = 1:M
     for y = 1:N
          if TestX(x,y) == 1
               flag = 1 ;
          end
     end
    end
    if flag == 1
        SizeDis = 0
       for x = 1:M
        for y= 1:N
        if TestX(x,y) == 1
                SizeDis = SizeDis+1;
        end
        end
       end 
        n = n + 1
        sizeDistribution(1,n) = SizeDis
    end  
end
pectrum = zeros(1,20)
for x= 1:n+1
    pectrum(x) = (sizeDistribution(x) - sizeDistribution(x+1))/sizeDistribution(1)
end
pectrum2 = pectrum
[M,N] = size(Object1);
for x = 1:M
    for y= 1:N
        if Object1(x,y)==1
                Object1(x,y) = 255;
        end
    end
end
[M,N] = size(Object2);
for x = 1:M
    for y= 1:N
        if Object2(x,y)==1
                Object2(x,y) = 255;
        end
    end
end
a=k
if a==1
    k=5
end
if a==2
    k=3
end
if a==3
    k=2
end
if a==4
    k=7
end
if a==5
    k=1
end
if a==6
    k=8
end
if a==7
    k=4
end
if a==8
    k=6
end
[r, c] = find(L==k);
rc = [r,c]
[m,n]= size(rc)
minX = 256
maxX = 1
minY= 256
maxY= 1
for x=1:m
    if rc(x,1) < minX
        minX = rc(x,1)
    end
    if rc(x,1) > maxX
        maxX = rc(x,1)
    end
    if rc(x,2) < minY
        minY = rc(x,2)
    end
    if rc(x,2) > maxY
        maxY = rc(x,2)
    end
end
Object3 = imcrop(X,[ (minY-6) (minX-6) (maxY-minY+12)  (maxX-minX+12)])
[M,N] = size(Object3);
for x = 1:M
    for y= 1:N
        if Object3(x,y)==1
                Object3(x,y) = 255;
        end
    end
end

if B==1
subplot(1,2,1)
figure(1),imshow(Object1),title('black falling down peanuts in shadow1rotated')
hold on
subplot(1,2,2)
figure(1),imshow(Object2),title('peanuts in shadow1')
figure(2),imshow(Object3),title('complementary peanuts in shadow1')
table({'L=1';'L=2';'L=3';'L=4';'L=5';'L=6';'L=7';'L=8'},[distance(1);distance(2);distance(3);distance(4);distance(5);distance(6);distance(7);distance(8)],'VariableNames',{'Name' 'distance'})
figure(3),plot(NumofB,pectrum1,'r.'),title('pectrum of black falling down peanuts in shadow1rotated')
figure(4),plot(NumofB,pectrum2,'r.'),title('pectrum of black falling down peanuts in shadow1')
end

if B==2
subplot(1,2,1)
figure(1),imshow(Object1),title('white standing position 1 peanuts in shadow1rotated')
hold on
subplot(1,2,2)
figure(1),imshow(Object2),title('peanuts in shadow1 ')
figure(4),imshow(Object3),title('complementary peanuts in shadow1')
table({'L=1';'L=2';'L=3';'L=4';'L=5';'L=6';'L=7';'L=8'},[distance(1);distance(2);distance(3);distance(4);distance(5);distance(6);distance(7);distance(8)],'VariableNames',{'Name' 'distance'})
figure(2),plot(NumofB,pectrum1,'r.'),title('pectrum of white standing in position 1 peanuts in shadow1rotated')
figure(3),plot(NumofB,pectrum2,'r.'),title('pectrum of white standing in position 1 peanuts in shadow1')
end

if B==3
subplot(1,2,1)
figure(1),imshow(Object1),title('white falling down peanuts in shadow1rotated')
hold on
subplot(1,2,2)
figure(1),imshow(Object2),title('peanuts in shadow1')
figure(4),imshow(Object3),title('complementary peanuts in shadow1')
table({'L=1';'L=2';'L=3';'L=4';'L=5';'L=6';'L=7';'L=8'},[distance(1);distance(2);distance(3);distance(4);distance(5);distance(6);distance(7);distance(8)],'VariableNames',{'Name' 'distance'})
figure(2),plot(NumofB,pectrum1,'r.'),title('pectrum of white falling down peanuts in shadow1rotated')
figure(3),plot(NumofB,pectrum2,'r.'),title('pectrum of white falling down peanuts in shadow1')
end

if B==4
subplot(1,2,1)
figure(1),imshow(Object1),title('black standing position 2 peanuts in shadow1rotated')
hold on
subplot(1,2,2)
figure(1),imshow(Object2),title('peanuts in shadow1 ')
figure(4),imshow(Object3),title('complementary peanuts in shadow1')
table({'L=1';'L=2';'L=3';'L=4';'L=5';'L=6';'L=7';'L=8'},[distance(1);distance(2);distance(3);distance(4);distance(5);distance(6);distance(7);distance(8)],'VariableNames',{'Name' 'distance'})
figure(2),plot(NumofB,pectrum1,'r.'),title('pectrum of black standing in position 2 peanuts in shadow1rotated')
figure(3),plot(NumofB,pectrum2,'r.'),title('pectrum of black standing in position 2 peanuts in shadow1')
end

if B==5
subplot(1,2,1)
figure(1),imshow(Object1),title('black standing position 3 peanuts in shadow1rotated')
hold on
subplot(1,2,2)
figure(1),imshow(Object2),title('peanuts in shadow1 ')
figure(4),imshow(Object3),title('complementary peanuts in shadow1')
table({'L=1';'L=2';'L=3';'L=4';'L=5';'L=6';'L=7';'L=8'},[distance(1);distance(2);distance(3);distance(4);distance(5);distance(6);distance(7);distance(8)],'VariableNames',{'Name' 'distance'})
figure(2),plot(NumofB,pectrum1,'r.'),title('pectrum of black standing in position 3 peanuts in shadow1rotated')
figure(3),plot(NumofB,pectrum2,'r.'),title('pectrum of black standing in position 3 peanuts in shadow1')
end

if B==6
subplot(1,2,1)
figure(1),imshow(Object1),title('white standing position 2 peanuts in shadow1rotated')
hold on
subplot(1,2,2)
figure(1),imshow(Object2),title('peanuts in shadow1 ')
figure(4),imshow(Object3),title('complementary peanuts in shadow1')
table({'L=1';'L=2';'L=3';'L=4';'L=5';'L=6';'L=7';'L=8'},[distance(1);distance(2);distance(3);distance(4);distance(5);distance(6);distance(7);distance(8)],'VariableNames',{'Name' 'distance'})
figure(2),plot(NumofB,pectrum1,'r.'),title('pectrum of white standing in position 2 peanuts in shadow1rotated')
figure(3),plot(NumofB,pectrum2,'r.'),title('pectrum of white standing in position 2 peanuts in shadow1')
end

if B==7
subplot(1,2,1)
figure(1),imshow(Object1),title('black standing position 1 peanuts in shadow1rotated')
hold on
subplot(1,2,2)
figure(1),imshow(Object2),title('peanuts in shadow1 ')
figure(4),imshow(Object3),title('complementary peanuts in shadow1')
table({'L=1';'L=2';'L=3';'L=4';'L=5';'L=6';'L=7';'L=8'},[distance(1);distance(2);distance(3);distance(4);distance(5);distance(6);distance(7);distance(8)],'VariableNames',{'Name' 'distance'})
figure(2),plot(NumofB,pectrum1,'r.'),title('pectrum of black standing in position 1 peanuts in shadow1rotated')
figure(3),plot(NumofB,pectrum2,'r.'),title('pectrum of black standing in position 1 peanuts in shadow1')
end

if B==8
subplot(1,2,1)
figure(1),imshow(Object1),title('white standing position 3 peanuts in shadow1rotated')
hold on
subplot(1,2,2)
figure(1),imshow(Object2),title('peanuts in shadow1 ')
figure(4),imshow(Object3),title('complementary peanuts in shadow1')
table({'L=1';'L=2';'L=3';'L=4';'L=5';'L=6';'L=7';'L=8'},[distance(1);distance(2);distance(3);distance(4);distance(5);distance(6);distance(7);distance(8)],'VariableNames',{'Name' 'distance'})
figure(2),plot(NumofB,pectrum1,'r.'),title('pectrum of white standing in position 3 peanuts in shadow1rotated')
figure(3),plot(NumofB,pectrum2,'r.'),title('pectrum of white standing in position 3 peanuts in shadow1')
end