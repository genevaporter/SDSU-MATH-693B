%%% Homework 1, Math 693B, Numerical PDEs
%%% Geneva Porter, SDSU, 2/13/2020

clear
clc

h = [1/10, 1/20, 1/40];
h_title = ['10th'; '20th'; '40th'];
lambda = [0.8, 1.6,];


for z=1:length(h)
    
    space = -1:h(z):3;
        
    %%%%%%%%%%%%%%%%%%%%% scheme A: forward time, backward space scheme 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    k1 = lambda(1)*h(z);
    t1 = 0:k1:2.4;
    u1 = zeros(length(t1), length(space));
    v1 = zeros(length(t1), length(space)); % exact solution
    
    for i = 1:length(t1)
        if i == 1 % this condition creates the first row at time = 0
            for j = 1:length(space)
                if abs(space(j)) <= 0.5
                    u1(i,j) = (cos(pi*(space(j)))).^2;
                else
                    u1(i,j) = 0;
                end
            end
        else % this condition uses the scheme for the rest of the rows
            for j = 1:length(space)
                if j == 1 % boundary condition u(t,-1) = 0
                    u1(i,j) = 0;
                else % implementing scheme
                    u1(i,j) = u1(i-1,j)*(1-lambda(1)) - ...
                              u1(i-1, j-1)*lambda(1);
                end
            end 
        end
        for j = 1:length(space) % exact solution
            if abs(space(j)) <= 0.5
                v1(i,j) = (cos(pi*(space(j)-t1(i)))).^2;
            else
                v1(i,j) = 0;
            end
        end
    end
    
    figure(1)
    clf
    axes; 
        title(["Forward time, backwards space, \lambda = 0.8, h = " + h(z)...
               " at t = " + t1(1)]); 
        xlabel("x");      
        ylabel("u(t,x)")   
    video_file1 = strcat('a_forward_time_backward_space_h_one_', ...
                         h_title(z,:), '.avi');
    image_file1 = strcat('a_forward_time_backward_space_h_one_', ...
                         h_title(z,:), '.png');
    video_object1 = VideoWriter(video_file1);
    open(video_object1);
    for y = 1:length(t1) 
        title(["Forward time, backwards space, \lambda = 0.8, h = " + h(z)...
               " at t = " + t1(y)]); 
        xlabel("x");      
        ylabel("u(t,x)")
        p(1) = plot(space,v1(y,:), '.k'); hold on;
        p(2) = plot(space,u1(y,:), 'r');
        set(gca, 'xlim', [-1,3], 'ylim', [-1,1.5]);
        legend('Exact Solution','Approximate Solution');
        current_frame = getframe(gcf);
        writeVideo(video_object1, current_frame);
        if t1(y) == 2.4
            saveas(gcf,image_file1);
        end
        delete(p)     
    end
    close(video_object1);
    
    %%%%%%%%%%%%%%%%%%%%% scheme B: forward time, central space scheme 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    k2 = k1; 
    t2 = t1;
    u2 = zeros(length(t2), length(space));
    
    for i = 1:length(t2)
        if i == 1 % this condition creates the first row at time = 0
            for j = 1:length(space)
                if abs(space(j)) <= 0.5
                    u2(i,j) = (cos(pi*(space(j)))).^2;
                else
                    u2(i,j) = 0;
                end
            end
        else % this condition uses the scheme for the rest of the rows
            for j = 1:length(space)
                if j == 1 % boundary condition u(t,-1) = 0
                    u2(i,j) = 0;
                elseif j ~= length(space) % implementing scheme
                    u2(i,j) = u2(i-1,j) - 0.5*lambda(1)*...
                              (u2(i-1,j+1) - u2(i-1,j-1));
                else % boundary at u(t,3)
                    u2(i,j) = u2(i,j-1);
                end
            end 
        end
    end
    
    clf
    axes;    
    video_file2 = strcat('b_forward_time_central_space_h_one_', ...
                         h_title(z,:), '.avi');
    image_file2 = strcat('b_forward_time_central_space_h_one_', ...
                         h_title(z,:), '.png');
    video_object2 = VideoWriter(video_file2);
    open(video_object2);
    for y = 1:length(t2) 
        title(["Forward time, central space, \lambda = 0.8, h = " + h(z)...
               " at t = " + t2(y)]); 
        xlabel("x");      
        ylabel("u(t,x)")
        p(1) = plot(space,v1(y,:), '.k'); hold on;
        p(2) = plot(space,u2(y,:), 'r');
        set(gca, 'xlim', [-1,3], 'ylim', [-1,1.5]);
        legend('Exact Solution','Approximate Solution');
        current_frame = getframe(gcf);
        writeVideo(video_object2, current_frame);
        if t2(y) == 2.4
            saveas(gcf,image_file2);
        end
        delete(p)     
    end
    close(video_object2);
    
    %%%%%%%%%%%%%%%%%%%%% scheme C: Lax-Friedrichs scheme 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    k3 = lambda(2)*h(z);
    t3 = 0:k3:2.4;
    u3 = zeros(length(t3), length(space));
    v3 = zeros(length(t3), length(space)); % exact solution
    
    for i = 1:length(t3)
        if i == 1 % this condition creates the first row at time = 0
            for j = 1:length(space)
                if abs(space(j)) <= 0.5
                    u3(i,j) = (cos(pi*(space(j)))).^2;
                else
                    u3(i,j) = 0;
                end
            end
        else % this condition uses the scheme for the rest of the rows
            for j = 1:length(space)
                if j == 1 % boundary condition u(t,-1) = 0
                    u3(i,j) = 0;
                elseif j ~= length(space) % implementing scheme
                    u3(i,j) = u3(i-1,j+1)*0.5*(1-lambda(2)) + ...
                              u3(i-1,j-1)*0.5*(1+lambda(2));
                else % boundary at u(t,3)
                    u3(i,j) = u3(i,j-1);
                end
            end 
        end
        for j = 1:length(space) % exact solution
            if abs(space(j)) <= 0.5
                v3(i,j) = (cos(pi*(space(j)-t3(i)))).^2;
            else
                v3(i,j) = 0;
            end
        end
    end
    
    clf
    axes;    
    video_file3 = strcat('c_lax_friedrichs_h_one_', ...
                         h_title(z,:), '.avi');
    image_file3 = strcat('c_lax_friedrichs_h_one_', ...
                         h_title(z,:), '.png');
    video_object3 = VideoWriter(video_file3);
    open(video_object3);
    for y = 1:length(t3) 
        title(["Lax-Friedrichs, \lambda = 1.6, h = " + h(z)...
               " at t = " + t3(y)]); 
        xlabel("x");      
        ylabel("u(t,x)")
        p(1) = plot(space,v3(y,:), '.k'); hold on;
        p(2) = plot(space,u3(y,:), 'r');
        set(gca, 'xlim', [-1,3], 'ylim', [-1,1.5]);
        legend('Exact Solution','Approximate Solution');
        current_frame = getframe(gcf);
        writeVideo(video_object3, current_frame);
        if t3(y) == 2.4
            saveas(gcf,image_file3);
        end
        delete(p)     
    end
    close(video_object3);
    
    %%%%%%%%%%%%%%%%%%%%% scheme D: Leapfrog scheme     
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    k4 = k1;
    t4 = t1;
    u4 = zeros(length(t4), length(space));
    v4 = zeros(length(t4), length(space)); % exact solution
    
    for i = 1:length(t4)
        if i == 1 % this condition creates the first row at time = 0
            for j = 1:length(space)
                if abs(space(j)) <= 0.5
                    u4(i,j) = (cos(pi*(space(j)))).^2;
                else
                    u4(i,j) = 0;
                end
            end
        else % this condition uses the scheme for the rest of the rows
            for j = 1:length(space)
                if j == 1 % boundary condition u(t,-1) = 0
                    u4(i,j) = 0;
                elseif j ~= length(space) % implementing scheme
                    u4(i,j) = u4(i-1,j)*(1-lambda(1)) - ...
                              u4(i-1, j-1)*lambda(1);
                else % boundary at u(t,3)
                    u4(i,j) = u4(i,j-1);
                end
            end 
        end

    end
    
    clf
    axes;    
    video_file4 = strcat('d_leapfrog_h_one_', ...
                         h_title(z,:), '.avi');
    image_file4 = strcat('d_leapfrog_h_one_', ...
                         h_title(z,:), '.png');
    video_object4 = VideoWriter(video_file4);
    open(video_object4);
    for y = 1:length(t4) 
        title(["Leapfrog, \lambda = 0.8, h = " + h(z)...
               " at t = " + t4(y)]); 
        xlabel("x");      
        ylabel("u(t,x)")
        p(1) = plot(space,v1(y,:), '.k'); hold on;
        p(2) = plot(space,u4(y,:), 'r');
        set(gca, 'xlim', [-1,3], 'ylim', [-1,1.5]);
        legend('Exact Solution','Approximate Solution');
        current_frame = getframe(gcf);
        writeVideo(video_object4, current_frame);        
        if t4(y) == 2.4
            saveas(gcf,image_file4);
        end
        delete(p)     
    end
    close(video_object4);
    
end