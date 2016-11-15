% compress an image using svd

pic = double(imread('test3.jpg'));

% split the image into 3 separate channels, r g b.
r = pic(:,:,1);
g = pic(:,:,2);
b = pic(:,:,3);

% csvd compress 
cr = csvd_q5_part2(double(r));
cb = csvd_q5_part2(double(g));
cg = csvd_q5_part2(double(b));

% concatenate the three channels together after compression
final = cat(3, cr, cg, cb);

% write compressed image to file
imwrite(uint8(final), 'compressed3.jpg');