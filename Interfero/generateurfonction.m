function [gen,Fmotif,amplitude]=generateurfonction(s1,s2,s3)
amplitude=str2num(get(s1,'string'));
Ncycle=str2num(get(s2,'string'));
Fcycle=str2num(get(s3,'string'));
%PRF=str2num(get(s4,'string'));
npts=40000; %nb pts par cycle
t=1:npts; gen1=sin(2*pi.*t.*Ncycle./npts);
gen=[gen1];
dureeburst=Ncycle./Fcycle;
gen=[zeros(1,npts*1e-6./dureeburst) gen1 ].';
Fmotif=(npts./length(gen))./dureeburst;
