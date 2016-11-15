% compress an image using svd

pic = double(imread('test.jpg'));

% split the image into 3 separate channels, r g b.
r = pic(:,:,1);
g = pic(:,:,2);
b = pic(:,:,3);

% csvd compress each color channel
% based on color channel, individually optimize and compress

% compress using matrix multiplication
tic;
cr = csvd_q3(double(r));
cg = csvd_q3(double(g));
cb = csvd_q3(double(b));
toc;

% csvd compress without matrix multiplication and use appr instead

tic;
cr2 = csvd_original(double(r));
cg2 = csvd_original(double(g));
cb2 = csvd_original(double(b));
toc;

% instead of for loop, use direct multiplication
% it will be faster than indiviually adding up for each value from 1:l
% because the addition function will be called once for each element
% from 1 to l while the new method will only be called once.

% the difference between the time taken can be seen on the output.

% concatenate the three channels together after compression
final = cat(3, cr, cg, cb);

% write compressed image to file
imwrite(uint8(final), 'compressed.jpg');