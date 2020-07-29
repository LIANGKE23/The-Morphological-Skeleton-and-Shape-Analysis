% Purpose::
%        to do the Shape Analysis isolate distinct objects and find
%        minimum bounding rectangle(MBR) enclosing each distinct 
%        object.To Find which object is the most complex in 'match 1'
%
% Processing Flow::
%        1. Pre-process the image
%        2. Finding the object in image
%        3. Compute the size distribution and pectrum.
%        4. Make a table on the complexity
% Authors::
%       Lindsey Schwartz, Ke Liang, Xilun Liu
% Date::
%       02/21/2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Isolate Clover
X = imread('match1.gif');
L = bwlabel(X,4);
[r, c] = find(L==1);
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
Clover = imcrop(X,[ (minY-6) (minX-6) (maxY-minY+12)  (maxX-minX+12)])
NumofB = 0:19;
sizeDistribution = zeros(1,20)
n=1
SizeDis = 0;
[M,N] = size(Clover)
for x = 1:M
    for y= 1:N
        if Clover(x,y) == 1
                SizeDis = SizeDis+1;
        end
    end
end
sizeDistribution(1,n) = SizeDis
flag = 1
while flag == 1
    TestX = imopen(Clover,strel('square',3+(2*(n-1))))
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
Complexity_1 = 0
for x= 1:n
    Complexity_1 = Complexity_1 - pectrum(x)*log10(pectrum(x))
end
figure,plot(NumofB,sizeDistribution,'r.'),title('size Distribution of Clover')
figure,plot(NumofB,pectrum,'r.'),title('pectrum of Clover')
[M,N] = size(Clover);
for x = 1:M
    for y= 1:N
        if Clover(x,y)==1
                Clover(x,y) = 255;
        end
    end
end
figure,imshow(Clover),title('Isolate Clover')

%%Isolated Steer
X = imread('match1.gif');
L = bwlabel(X,4);
[r, c] = find(L==2);
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
Steer = imcrop(X,[ (minY-6) (minX-6) (maxY-minY+12)  (maxX-minX+12)])
NumofB = 0:19;
sizeDistribution = zeros(1,20)
n=1
SizeDis = 0;
[M,N] = size(Steer)
for x = 1:M
    for y= 1:N
        if Steer(x,y) == 1
                SizeDis = SizeDis+1;
        end
    end
end
sizeDistribution(1,n) = SizeDis
flag = 1
while flag == 1
    TestX = imopen(Steer,strel('square',3+(2*(n-1))))
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
Complexity_2 = 0
for x= 1:n
    Complexity_2 = Complexity_2 - pectrum(x)*log10(pectrum(x))
end
figure,plot(NumofB,sizeDistribution,'r.'),title('size Distribution of Steer')
figure,plot(NumofB,pectrum,'r.'),title('pectrum of Steer')
[M,N] = size(Steer);
for x = 1:M
    for y= 1:N
        if Steer(x,y)==1
                Steer(x,y) = 255;
        end
    end
end
figure,imshow(Steer),title('Isolate Steer')

%%Isolated Plane
X = imread('match1.gif');
L = bwlabel(X,4);
[r, c] = find(L==3);
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
Plane = imcrop(X,[ (minY-6) (minX-6) (maxY-minY+12)  (maxX-minX+12)])
NumofB = 0:19;
sizeDistribution = zeros(1,20)
n=1
SizeDis = 0;
[M,N] = size(Plane)
for x = 1:M
    for y= 1:N
        if Plane(x,y) == 1
                SizeDis = SizeDis+1;
        end
    end
end
sizeDistribution(1,n) = SizeDis
flag = 1
while flag == 1
    TestX = imopen(Plane,strel('square',3+(2*(n-1))))
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
Complexity_3 = 0
for x= 1:n
    Complexity_3 = Complexity_3 - pectrum(x)*log10(pectrum(x))
end
figure,plot(NumofB,sizeDistribution,'r.'),title('size Distribution of Plane')
figure,plot(NumofB,pectrum,'r.'),title('pectrum of Plane')
[M,N] = size(Plane);
for x = 1:M
    for y= 1:N
        if Plane(x,y)==1
                Plane(x,y) = 255;
        end
    end
end
figure,imshow(Plane),title('Isolate Plane')

%%Isolated Spade
X = imread('match1.gif');
L = bwlabel(X,4);
[r, c] = find(L==4);
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
Spade = imcrop(X,[ (minY-6) (minX-6) (maxY-minY+12)  (maxX-minX+12)])
NumofB = 0:19;
sizeDistribution = zeros(1,20)
n=1
SizeDis = 0;
[M,N] = size(Spade)
for x = 1:M
    for y= 1:N
        if Spade(x,y) == 1
                SizeDis = SizeDis+1;
        end
    end
end
sizeDistribution(1,n) = SizeDis
flag = 1
while flag == 1
    TestX = imopen(Spade,strel('square',3+(2*(n-1))))
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
Complexity_4 = 0
for x= 1:n
    Complexity_4 = Complexity_4 - pectrum(x)*log10(pectrum(x))
end
figure,plot(NumofB,sizeDistribution,'r.'),title('size Distribution of Spade')
figure,plot(NumofB,pectrum,'r.'),title('pectrum of Spade')
[M,N] = size(Spade);
for x = 1:M
    for y= 1:N
        if Spade(x,y)==1
                Spade(x,y) = 255;
        end
    end
end
figure,imshow(Spade),title('Isolate Spade')

%%table of complexity
table({'Clover';'Steer';'Plane';'Spade'},[Complexity_1;Complexity_2;Complexity_3;Complexity_4],'VariableNames',{'Name' 'Complexity'})