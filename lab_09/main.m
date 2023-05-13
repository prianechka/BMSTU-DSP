function lab_09()
    I=double(imread('bimage.bmp')) / 255;

    figure;
    imshow(I); 
    title('Source image');

    PSF=fspecial('motion', 55, 205);
    [J1 P1]=deconvwiener(I, PSF);
    figure;
    imshow(J1);
    title('Recovered image'); 
end