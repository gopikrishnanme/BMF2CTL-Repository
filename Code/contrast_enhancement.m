function newImg = contrast_enhancement(img, VddOrg,VddNew)

    hsvImg = rgb2hsv(img);
    b = VddNew/VddOrg;
    V = hsvImg(:,:,3);
    n = size(V);
    newV = zeros(n);
    for i = 1:n(1)
        for j = 1:n(2)
            newV(i,j) = min(1,V(i,j)/b);
        end
    end
    
    newImg = im2uint8(hsv2rgb(cat(3, hsvImg(:,:,1), hsvImg(:,:,2), newV)));
    
end