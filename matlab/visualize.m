% Q2.7 - Todo:
% Integrating everything together.
% Loads necessary files from ../data/ and visualizes 3D reconstruction
% using scatter3

im1 = imread('../data/im1.png');
im2 = imread('../data/im2.png');

data = load('q2_1.mat');
F = data.F;

Ks = load('../data/intrinsics.mat');
K1 = Ks.K1;
K2 = Ks.K2;

E = essentialMatrix(F,K1,K2);

M1 = [eye(3,3), zeros(3,1)];
M2s = camera2(E);

M1 = K1*M1;
M2 = K2*M2;

[P, error] = triangulate(M1, p1, M2, p2);