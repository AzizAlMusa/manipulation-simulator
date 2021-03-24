function output = draw_bound()
    th = 0:pi/50:2*pi;
    r = 5;
    x = r*cos(th);
    y = r*sin(th);
    plot(x,y);
end

