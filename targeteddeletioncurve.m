function [GC,E]=targeteddeletioncurve(cor,thresh)
%
%                       Targeted Node Deletion
%
%Targeted node deletion
%Deletes nodes in order, from highest degree to smallest degree, and
%reports the size of the largest component and global efficiency with each successive deletion
%
%   [GC,E]=targeteddeletioncurve(cormat,thresh)
%
%INPUTS:
%   cor = square correlation matrix
%   thresh = threshold at which matrix will be binarized
%       Default set to 0.8
%
%OUTPUT:
%   GC = vector containing list of giant component sizes
%   E = vector containing list of global efficiencies
%
%%Created 01/26/2021 Dylan Terstege
%Epp Lab, University of Calgary
%Contact: dylan.terstege@ucalgary.ca

%check threshold
if nargin<2
    thresh=0.8;
end
%check matrix
if nargin<1
    error('no correlation matrix is present');
end
if size(cor,1)~=size(cor,2)
    error('this correlation matrix is not square');
end
if isa(cor,'double')
else
    error('this correlation matrix ix not a double');
end
%binarize
cor(isnan(cor))=0;
cor(cor<thresh & cor>-(thresh))=0;
cor(cor>thresh | cor<-(thresh))=1;
%set auto loops
if sum(diag(cor))~=size(cor,1)
    cor=cor|speye(size(cor));
end
%largest component
G=graph(cor);
[~,binsize]=conncomp(G);
GCmax=max(binsize);
num=(size(cor,1))+1;
GC=ones(num,1);
GC(1)=GCmax;
x=2;
%find global efficiency
n=length(cor); 
cor(1:n+1:end)=0;
cor=double(cor~=0);
e=distance_inv(cor);
eff=sum(e(:))./(n^2-n);
E=zeros(num,1);
E(1)=eff;
%node deletion
while GCmax>2
    %find degree
    D=(sum(cor));
    [~,indx]=max(D);
    cor(indx,:)=[];
    cor(:,indx)=[];
    %largest component
    G=graph(cor);
    [~,binsize]=conncomp(G);
    GCmax=max(binsize);
    GC(x)=GCmax;
    %find global efficiency
    n=length(cor); 
    cor(1:n+1:end)=0;
    cor=double(cor~=0);
    e=distance_inv(cor);
    eff=sum(e(:))./(n^2-n);
    E(x)=eff;
    %move to next
    x=x+1;
end
z=length(GC);
GC(z)=0;
end

function D=distance_inv(A_)
l=1;        
Lpath=A_;
D=A_;
n_=length(A_);
Idx=true;
while any(Idx(:))
    l=l+1;
    Lpath=Lpath*A_;
    Idx=(Lpath~=0)&(D==0);
    D(Idx)=l;
end
D(~D | eye(n_))=inf;
D=1./D; 
end
