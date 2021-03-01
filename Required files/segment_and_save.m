function output = segment_and_save(filename,save_path,i)
    img = imread(filename);
    img = rgb2gray(img);
    ent = entropyfilt(img);
    ent = rescale(ent);
    mask = imbinarize(ent);
    se = strel('disk', 3);
    mask = imclose(mask, se);
    mask = imfill(mask, 'holes');
    img = imadjust(img .* uint8(mask));
    
    maskRed = bwpropfilt(mask, 'area', 1);
    maskBlue =  bwpropfilt(mask, 'area', [20 Inf]);
    imgRed = imadjust(img .* uint8(maskRed));
    imgBlue = imadjust(img .* uint8(maskBlue));
    
    output = cat(3, imgRed, imgRed.*imgBlue, imgBlue);
    
    imwrite(output,[save_path,'/frame',num2str(i, '%03d'),'.tif']);
end