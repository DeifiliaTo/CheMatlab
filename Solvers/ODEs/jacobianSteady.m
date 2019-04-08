function j = jacobianSteady(x, CA0, k, tau)
    
    j = zeros(length(x), length(x))
    h = zeros(length(x),1);
    for i = 1:length(j)
        h(i) = 0.001;
        j(:, i) = (-fnevalSteady(x+2*h, CA0, k, tau)+8*fnevalSteady(x+h, CA0, k, tau)-8*fnevalSteady(x-h, CA0, k, tau)+fnevalSteady(x-2*h, CA0, k, tau))/(12*max(h));
        h(i) = 0;
    end
end