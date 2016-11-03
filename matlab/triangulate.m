function [ P, error ] = triangulate( M1, p1, M2, p2 )
% triangulate:
%       M1 - 3x4 Camera Matrix 1
%       p1 - Nx2 set of points
%       M2 - 3x4 Camera Matrix 2
%       p2 - Nx2 set of points

% Q2.4 - Todo:
%       Implement a triangulation algorithm to compute the 3d locations
%       See Szeliski Chapter 7 for ideas
%

p1 = [p1; ones(length(p1,1))];
p2 = [p2; ones(length(p2,1))];

proj_1 = p1 * M1;
proj_2 = p2 * M2;

% Using least squares to calculate the optimal N points, from proj_1, and
% proj_2

p1_hat = M1*P;
p2_hat = M2*P;
error = sum((p1 - p1_hat)^2 + (p2-p2_hat)^2)

end

