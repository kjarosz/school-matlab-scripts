function trian = trianglePulse(center, width, x)
    trian = zeros(1, length(x));
    slope = 1/(width/2);
    a = center - width/2;
    b = center + width/2;
    for i = 1:length(x)
        sample = x(i);
        if sample == center
            trian(i) = 1;
        elseif sample >= a && sample < center
            trian(i) = (sample - a)*slope;
        elseif sample <= b && sample > center
            trian(i) = (sample - center)*(-slope) + 1;
        end
    end
end
