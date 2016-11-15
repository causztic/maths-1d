% compress an image using svd

pic = double(imread('test.jpg'));

% split the image into 3 separate channels, r g b.
r = pic(:,:,1);
g = pic(:,:,2);
b = pic(:,:,3);

% csvd compress each color channel
% based on color channel, individually optimize and compress
cr = csvd_q3(double(r));
cg = csvd_q3(double(g));
cb = csvd_q3(double(b));

% concatenate the three channels together after compression
final = cat(3, cr, cg, cb);

% write compressed image to file
imwrite(uint8(final), 'compressed.jpg');