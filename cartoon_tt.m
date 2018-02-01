im=imread('refr.jpg');
imr=cartoon(im);
subplot(1,2,1);imshow(im );title('original image');
subplot(1,2,2);imshow(imr);title('cartoon  image');