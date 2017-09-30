function [MatIn] = hilbert4D(MatIn)
[a,b,c,d]=size(MatIn);
for ii=1:a
    for jj=1:b
        for kk=1:c
            g=hilbert(squeeze(MatIn(ii,jj,kk,:)));
            MatIn(ii,jj,kk,:)=permute(g,[4,3,2,1]); 
        
        end
    end
end


end

