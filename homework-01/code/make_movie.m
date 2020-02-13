function make_movie(h, lambda, scheme, u, v)
%MAKE_MOVIE Summary of this function goes here
%   Detailed explanation goes here

    k = lambda*h;
    t = 0:k:2.4;
    space = -1:h:3;


    if h == 1/10
        h_title = '10th';
    elseif h == 1/20
        h_title = '20th';
    elseif h == 1/40
        h_title = '40th';
    end

    figure(1)
    clf
    axes;        
    ylabel("u(t,x)") 
        
        switch scheme
            case 'a'                  
                video_file = strcat('a_forward_time_backward_space_1_', ...
                                    h_title, '.avi');
                image_file = strcat('a_forward_time_backward_space_1_', ...
                                    h_title, '.png');
                disp("Forward time, backwards space, " ...
                       + "h = " + h);
            case 'b'
                video_file = strcat('b_forward_time_central_space_1_', ...
                                    h_title, '.avi');
                image_file = strcat('b_forward_time_central_space_1_', ...
                                    h_title, '.png');
                disp("Forward time, central space, " ...
                       + "h = " + h)
            case 'c'
                video_file = strcat('c_lax_friedrichs_1_', ...
                                    h_title, '.avi');
                image_file = strcat('c_lax_friedrichs_1_', ...
                                    h_title, '.png');
                disp("Lax-Friedrichs, h = " + h);
            case 'd'
                video_file = strcat('d_leapfrog_1_', ...
                                    h_title, '.avi');
                image_file = strcat('d_leapfrog_1_', ...
                                    h_title, '.png'); 
                disp("Leapfrog, h = " + h);
        end
        
    video_object = VideoWriter(video_file);
    open(video_object);
    for y = 1:length(t)  
        switch scheme
            case 'a'
                title(["Forward time, backwards space, \lambda = 0.8 " ...
                       + ", h = " + h "."], 'fontsize', 16)
            case 'b'
                title(["Forward time, central space, \lambda = 0.8 " ...
                       + ", h = " + h "."], 'fontsize', 16)
            case 'c'
                title(["Lax-Friedrichs, \lambda = 1.6, h = " + h "."],...
                       'fontsize', 16)
            case 'd'
                title(["Leapfrog, \lambda = 0.8, h = " + h "."],...
                       'fontsize', 16)
        end
        xlabel(["x at time t = " + t(y)], 'fontsize', 16);      
        ylabel("u(t,x)", 'fontsize', 16)
        p(1) = plot(space,v(y,:), '.k'); hold on;
        p(2) = plot(space,u(y,:), 'r');
        set(gca, 'xlim', [-1,3], 'ylim', [-1,1.5]);
        legend('Exact Solution','Approximate Solution');
        current_frame = getframe(gcf);
        writeVideo(video_object, current_frame);
        if t(y) == 2.4
            saveas(gcf,image_file);
            disp("Error = " + [max(v(y,:)) - max(u(y,:))]);
            disp(" ");
        end
        delete(p)     
    end
    close(video_object);
end

