function [ uv, ori ] = get_uv_orientation( filename )

I  = imread(filename);
I=rgb2gray(I);

se = offsetstrel('ball',10,10);
erodedI = imerode(I,se);
dilatedI = imdilate(erodedI,se);

level = graythresh(dilatedI);
BW = imcomplement(imbinarize(dilatedI,level));

stats = regionprops(BW,'Centroid','Orientation','Area');
len = length(stats);

index = 1;
for i = 1 : len
    % filter the object with the area
    if stats(i).Area > 1000
        % re-order the object based on the centroid
        uv(index,:) = stats(i).Centroid;
        ori(index,1) = stats(i).Orientation;
        index = index + 1;
    end
end

end

