% compress an image using svd
% convert color image to grayscale so we don't need to make 2 images

pic = double(imread('test.jpg'));

% split the image into 3 separate channels, r g b.
r = pic(:,:,1);
g = pic(:,:,2);
b = pic(:,:,3);

% csvd compress each color channel
% based on color channel, individually optimize and compress
figure;
cr = csvd(double(r), 1, 'red');
cg = csvd(double(g), 3, 'green');
cb = csvd(double(b), 5, 'blue');

% concatenate the three channels together after compression
final = cat(3, cr, cg, cb);

% write compressed image to file
imwrite(uint8(final), 'compressed.jpg' );