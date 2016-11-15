% compress an image using svd

pic = double(imread('test2.jpg'));

% split the image into 3 separate channels, r g b.
r = pic(:,:,1);
g = pic(:,:,2);
b = pic(:,:,3);

% csvd compress 
cr = csvd_q5_part1(double(r));
cb = csvd_q5_part1(double(g));
cg = csvd_q5_part1(double(b));

% concatenate the three channels together after compression
final = cat(3, cr, cg, cb);

% write compressed image to file
imwrite(uint8(final), 'compressed2.jpg');