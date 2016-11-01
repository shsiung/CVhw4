function [ F ] = eightpoint( pts1, pts2, M )
% eightpoint:
%   pts1 - Nx2 matrix of (x,y) coordinates
%   pts2 - Nx2 matrix of (x,y) coordinates
%   M    - max (imwidth, imheight)

% Q2.1 - Todo:
%     Implement the eightpoint algorithm
%     Generate a matrix F from some '../data/some_corresp.mat'
%     Save F, M, pts1, pts2 to q2_1.mat

%     Write F and display the output of displayEpipolarF in your writeup

n_pts1 = [pts1/M ones(size(pts1,1),1)];
n_pts1 = repelem(n_pts1,1,3);

n_pts2 = [pts2/M ones(size(pts2,1),1)];
n_pts2 = repmat(n_pts2,1,3);

A = n_pts1.*n_pts2;

[~,~,V] = svd(A);
F = V(:,end)*M;
F = reshape(F,3,3);
[UF, WF, VF] = svd(F);
WF(3,3) = 0;
F = UF * WF * VF';
F = refineF(F,pts1,pts2);

end

