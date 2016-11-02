function [ F ] = sevenpoint( pts1, pts2, M )
% sevenpoint:
%   pts1 - Nx2 matrix of (x,y) coordinates
%   pts2 - Nx2 matrix of (x,y) coordinates
%   M    - max (imwidth, imheight)

% Q2.2 - Todo:
%     Implement the eightpoint algorithm
%     Generate a matrix F from some '../data/some_corresp.mat'
%     Save recovered F (either 1 or 3 in cell), M, pts1, pts2 to q2_2.mat

%     Write recovered F and display the output of displayEpipolarF in your writeup

T=[2/M 0  -1;
   0 2/M  -1;
   0   0  1];

n_pts1 = [pts1 ones(size(pts2,1),1)]';
n_pts1 = T*n_pts1;
n_pts1 = repmat(n_pts1',1,3);

n_pts2 = [pts2 ones(size(pts1,1),1)]';
n_pts2 = T*n_pts2;
n_pts2 = repelem(n_pts2',1,3);

% Construct A matrix
A = n_pts1.*n_pts2;

% Solve for F
[~,S,V] = svd(A);
F1 = reshape(V(:,end),3,3)';
F2 = reshape(V(:,end-1),3,3)';
syms a;
F = a*F1+(1-a)*F2;
F = solve(det(F) == 0, a);

% pick alpha such that det(alpha F1 + (1-alpha) F2) = 0

% F = reshape(V(:,end),3,3)';
% 
% % Singularity constraint
% [UF, WF, VF] = svd(F);
% WF(3,3) = 0;
% F = UF * WF * VF';
% 
% % Refine answer
% F = refineF(F,pts1,pts2);
% 
% % unnormalized
% F = T' * F * T;
end