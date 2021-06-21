clc;clear

I = rgb2gray(imread('cs.png'));
imshow(I);
N=25;
Inorm = (I/255);
world = zeros(N,N);
hold on
for i=1:(100/N):100
    for j=1:(100/N):100
        if min(min(Inorm(j:j+(100/N)-1, i:i+(100/N)-1)))==0
            hold on
            fill([i i+(100/N)-1 i+(100/N)-1 i],[j j j+(100/N)-1 j+(100/N)-1],'r', 'facealpha', 0.7);
            world(1+floor(i/(100/N)), 1+floor(j/(100/N)))=1;     
            text(i-1+(100/N)/2,j-1+(100/N)/2, '1');
            hold off
        else
            hold on
            fill([i i+(100/N)-1 i+(100/N)-1 i],[j j j+(100/N)-1 j+(100/N)-1],'g', 'facealpha', 0.1);
            world(1+floor(i/(100/N)), 1+floor(j/(100/N)))=0;
            hold off
        end        
    end
end
hold off
%define pixel connectivity
%neighbors = [1 0;1 1;0 1;-1 1;-1 0;-1 -1; 0 -1;1 -1];
neighbors = [1 0;0 1;-1 0; 0 -1];
%brushfire
counter = 1;
while min(min(world))==0 
    for i=1:N
        for j=1:N            
            if world(i,j)==counter
               %scan each neighbor
               for n=1:size(neighbors,1)
                   if i+neighbors(n,1)>0 && j+neighbors(n,2)>0 &&...
                      i+neighbors(n,1)<=N && j+neighbors(n,2)<=N    
                       if world(i+neighbors(n,1), j+neighbors(n,2))==0
                           world(i+neighbors(n,1), j+neighbors(n,2)) = ...
                               world(i, j)+1;
                             % write the values of pixels
                            hold on
                            text( (100/N)*(i+neighbors(n,1))-(100/N)/2,...
                                (100/N)*(j+neighbors(n,2))-...
                                (100/N)/2, num2str(world((i+neighbors(n,1)), (j+neighbors(n,2)))));
                            hold off
                       end
                   end
               end

            end            
        end
    end
    
    counter = counter + 1;
end

%% Potential Function 
Q_goal = floor([20,7]);
dstar = 3;
zeta = 4;
eta = 20;
Q_star = 10;
world = flip(world');
[gradx,grady] = gradient(world);
delta_U_rep = zeros(N,N,2);
delta_U_att = zeros(N,N,2);

for i = 1:N
    for j = 1:N
        Q = [j,i];        %Current Position
        
        %%Attractive Potential
        if norm(Q_goal - Q) < dstar
            U_att(i,j) = 0.5*zeta*(norm(Q_goal - Q))^2;
            delta_U_att(i,j,:) = zeta*(Q - Q_goal);
        else
            U_att(i,j) = (dstar*zeta*norm(Q_goal - Q)) - (0.5*zeta*(dstar^2));
            delta_U_att(i,j,:) = dstar*zeta*(Q - Q_goal)/norm(Q_goal-Q);
        end

        %%Repulsive Potential
        Dq = world(i,j);
        if Dq == 1
            delta_U_att(i,j,:) = 0;
        end 
        
        gradDq = [gradx(i,j),grady(i,j)];
        if world(i,j) <= Q_star
            U_rep(i,j) = 0.5*eta*(((1/Dq) - (1/Q_star))^2);
            delta_U_rep(i,j,:) = eta*((1/Q_star)-(1/Dq))*(1/Dq^2)*gradDq;
        else 
            U_rep(i,j) = 0;
            delta_U_rep(i,j,:) = 0;
        end
         
        U(i,j) = U_rep(i,j) + U_att(i,j);
        grad(i,j,:) = delta_U_att(i,j,:)+delta_U_rep(i,j,:);
        
    end
end

%% Gradient Descent
qstart = [21,21];
i = 0;
dir = [grad(qstart(2),qstart(1),1),grad(qstart(2),qstart(1),2)];
epsilon = 0.1;
q = qstart;
alpha = 0.1;
while norm(dir) > epsilon 
    dir = [grad(round(q(2)),round(q(1)),1),grad(round(q(2)),round(q(1)),2)]
    q = q - alpha*dir;
    p(i+1,:) = round(q);
    i = i + 1;
    %norm(dir)
    Q = [round(q(1)),round(q(2))]
    pause(0)
end 

%% Plotting
figure(2)
subplot(1,2,1);
[X,Y] = meshgrid(1:N,1:N);
surf(X,Y,U)


subplot(1,2,2);
quiver(grad(:,:,1),grad(:,:,2))
axis([1 N 1 N]);
hold on 
plot(qstart(1),qstart(2),'*')
plot(Q_goal(1),Q_goal(2),'*')
plot(p(:,1),p(:,2),'+')
hold off
