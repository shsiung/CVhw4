% Q2.7 - Todo:
% Integrating everything together.
% Loads necessary files from ../data/ and visualizes 3D reconstruction
% using scatter3


E = essentialMatrix(F,K1,K2);

% Using E to calculate M1, M2

M1 = K1*M1;
M2 = K2*M2;

[P, error] = triangulate(M1, p1, M2, p2);