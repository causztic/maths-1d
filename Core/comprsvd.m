% bonus marks for using the best image for compression? :)

% compress an image using svd
% convert color image to grayscale so we don't need to make 2 images

% various intensities
red = 0.2989; 
green = 0.5870;
blue = 0.1140;

pic = double(imread('test.jpg'));
grayscale = red * pic(:,:,1) + green * pic(:,:,2) + blue * pic(:,:,3);
[U,S,V] = svd(grayscale);

m = size(pic,1);
n = size(pic,2);
r = min(m, n);

figure;

for i = 1:4
    colormap gray;
    subplot(2,2,i);
    if i == 1; 
        % display original image
        imagesc(grayscale);
    else
        % generate some arbitary l. 
        % This would work for an images bigger than 40x40.
        l = i*11;

        % compress it and display
        compressed_pic = appr(U,S,V',l);
        imagesc(compressed_pic);
        compression_ratio = (m*n)/(l*(1+m+n));
        percentage = (1/compression_ratio)*100;
       	text(0, 30+m, sprintf('Compression ratio: %.2f', compression_ratio));
        text(0, 60+m, sprintf('Image is %.2f%% of original', percentage));  
        % C) Additional Questions 
        % list = 1:1:i*10;
        % imagesc(U(:,list)*S(list,list)*V(:,list)');
    end
    axis off image;
end

% Summation from k to r where r is the lower bound of m, n,
% sigma*v*u^t
% for one item, the numbers stored would be 1+m+n
% for r items, the numbers stored would be r(1+m+n)
% the original number of numbers would be m*n. 

% ratio of compression:

%   m*n
% -------
% l(1+m+n)        

