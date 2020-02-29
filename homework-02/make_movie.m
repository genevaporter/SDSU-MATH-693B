function make_movie(scheme, u, v, time, space)
%MAKE_MOVIE Summary of this function goes here
%   Detailed explanation goes here
    
    figure(1)
    clf
    axes;        
    ylabel("u(t,x), v(t,x)") 
        
        switch scheme
            case 'a'                  
                video_file = strcat('leapfrog_a.avi');
                image_file = strcat('leapfrog_a.png');
                disp("Leapfrog");
            case 'b'
                video_file = strcat('leapfrog_b.avi');
                image_file = strcat('leapfrog_b.png');
                disp("Leapfrog")
            case 'c'
                video_file = strcat('leapfrog_c.avi');
                image_file = strcat('leapfrog_c.png');
                disp("Leapfrog");
            case 'd'
                video_file = strcat('leapfrog_d.avi');
                image_file = strcat('leapfrog_d.png'); 
                disp("Leapfrog");
        end
        
    video_object = VideoWriter(video_file);
    open(video_object);
    for y = 1:length(time)  
        switch scheme
            case 'a'
                title("Leapfrog A", 'fontsize', 16)
            case 'b'
                title("Leapfrog B", 'fontsize', 16)
            case 'c'
                title("Leapfrog C", 'fontsize', 16)
            case 'd'
                title("Leapfrog D", 'fontsize', 16)
        end
        xlabel(["x at time t = " + time(y)], 'fontsize', 16);      
        ylabel("u(t,x), v(t,x)", 'fontsize', 16)
        p(1) = plot(space,u(y,:), 'b'); hold on;
        p(2) = plot(space,v(y,:), 'r');
        set(gca, 'xlim', [0,1], 'ylim', [-3,100]);
        legend('u(t,x)','v(x,t)');
        current_frame = getframe(gcf);
        writeVideo(video_object, current_frame);
        if y == length(time)
            saveas(gcf,image_file);
        end
        delete(p)     
    end
    close(video_object);
end

