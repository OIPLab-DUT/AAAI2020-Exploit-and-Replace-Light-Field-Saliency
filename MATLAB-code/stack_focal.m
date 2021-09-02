clc;clear;close all;
%
%
inpath = 'E:\New\Focal\Focal_c\';
outpath = 'E:\New\Focal\Focal_c_concat\';
if ~exist(outpath)
    mkdir(outpath)
end
in_dir = dir(inpath);
for i =1:length(in_dir)-2
    i
    imgname = in_dir(i+2).name;
    name(i) = str2num(imgname(1:4));
    name_cell{i} = imgname;
    
end
name_unique = unique(name);
for i=1:length(name_unique)
    i

    img_inde = find(name==name_unique(i));
    imgname = name_cell{img_inde(1)};
    img_name = [inpath imgname];
    ii = imread(img_name);
    [row, cos, ~] = size(ii);
    img = uint8(zeros(256, 256, 12));

    assert(length(img_inde)==12, 'focal stask is not equal to 12');
    for j=1:length(img_inde)
        
        imgname = name_cell{img_inde(j)};
        img_name = [inpath imgname]
        ii = imread(img_name);
        ii = imresize(ii, [256, 256]);
        img(:,:,j*3-2:j*3) = ii;
    end
    out_name=[outpath imgname(1:4) '.mat'];
    save(out_name, 'img');
end