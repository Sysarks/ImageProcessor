function imr=cartoon(im,varargin)
 

mask_radius=25;
threshold=1;
ramp=0.3;

if(nargin>=2)
        mask_radius=varargin{1};
end

if(nargin>=3)
        threshold=varargin{2};
end

if(nargin>=4)
        ramp=varargin{3};
end

if ndims(im) == 3 
        % rgb 
        r=im(:,:,1);
        g=im(:,:,2);
        b=im(:,:,3);
        rr=cartoonlize(r,mask_radius,threshold,ramp);
        gr=cartoonlize(g,mask_radius,threshold,ramp);
        br=cartoonlize(b,mask_radius,threshold,ramp);
        imr=cat(3,rr,gr,br);
else
        %grayscale
        imr=cartoonlize(im,mask_radius,threshold,ramp);
end


function gr=cartoonlize(g,mask_radius,threshold,ramp)

g=im2double(g); % avoid  overflow

mask=fspecial('average',mask_radius);
g_new=imfilter(g,mask);
g_new=g./g_new;
mult=(ramp-min(ramp,(threshold-g_new)))/ramp;
ind=find(g_new<threshold);
gr=g;
gr(ind)=g(ind).*mult(ind);

