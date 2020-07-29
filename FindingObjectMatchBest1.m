% Purpose::
%        to do the Shape Analysis isolate distinct objects and find
%        minimum bounding rectangle(MBR) enclosing each distinct 
%        object.To Find which object in 'match 3' best matches in the object
%        in 'match 1'.
%
% Processing Flow::
%        1. Pre-process the image
%        2. Finding the object in 2 image
%        3. Compute the size distribution and pectrum.
%        4. Compute the complexity
%        5. Compute the distance and find the smallest distance 
%        6. Refinding the object in match 3 with gets smallese distance 
% Authors::
%       Lindsey Schwartz, Ke Liang, Xilun Liu
% Date::
%       02/21/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = inputdlg('number of L: L=1 for Clover;L=2 for Steer;L=3 for Plane;L=4 for Spade');
B = str2num(cell2mat(A));
X = imread('match1.gif');
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
X = imread('match3.gif');
L = bwlabel(X,8);
distance=[]
for k=1:4 
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
for i=1:4
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
if B==1
subplot(1,2,1)
figure(1),imshow(Object1),title('Clover in match 1')
hold on
subplot(1,2,2)
figure(1),imshow(Object2),title('Clover in match 3')
table({'L=1';'L=2';'L=3';'L=4'},[distance(1);distance(2);distance(3);distance(4)],'VariableNames',{'Name' 'distance'})
figure(2),plot(NumofB,pectrum2,'r.'),title('pectrum of Clover in match 3')
end
if B==2
subplot(1,2,1)
figure(1),imshow(Object1),title('Steer in match 1')
hold on
subplot(1,2,2)
figure(1),imshow(Object2),title('Steer in match 3')
table({'L=1';'L=2';'L=3';'L=4'},[distance(1);distance(2);distance(3);distance(4)],'VariableNames',{'Name' 'distance'})
figure(2),plot(NumofB,pectrum2,'r.'),title('pectrum of Steer in match 3')
end
if B==3
subplot(1,2,1)
figure(1),imshow(Object1),title('Plane in match 1')
hold on
subplot(1,2,2)
figure(1),imshow(Object2),title('Plane in match 3')
table({'L=1';'L=2';'L=3';'L=4'},[distance(1);distance(2);distance(3);distance(4)],'VariableNames',{'Name' 'distance'})
figure(2),plot(NumofB,pectrum2,'r.'),title('pectrum of Plane in match 3')
end
if B==4
subplot(1,2,1)
figure(1),imshow(Object1),title('Spade in match 1')
hold on
subplot(1,2,2)
figure(1),imshow(Object2),title('Spade in match 3')
table({'L=1';'L=2';'L=3';'L=4'},[distance(1);distance(2);distance(3);distance(4)],'VariableNames',{'Name' 'distance'})
figure(2),plot(NumofB,pectrum2,'r.'),title('pectrum of Spade in match 3')
end

