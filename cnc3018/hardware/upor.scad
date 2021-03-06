// from bottom
hw1 = 7.2;
hw2 = 11.2;
hw3 = 4.1;
hw4 = 6.3;

h1 = 4;
h2 = 3.0;
h3 = 4.0;
h4 = 20;

linear_extrude(height = 25)
polygon(
[
  [-hw1, 0], [hw1, 0],
  [-hw2, h1], [hw2, h1],
  [-hw2, h1 + h2], [hw2, h1 + h2],

  [-hw3, h1 + h2], [hw3, h1 + h2],
  [-hw3, h1 + h2 + h3], [hw3, h1 + h2 + h3],

  [-hw4, h1 + h2 + h3], [hw4, h1 + h2 + h3],  
  [1   , h1 + h2 + h3 + h4], [hw4, h1 + h2 + h3 + h4],
],
[
  [0, 1, 3, 5, 4, 2],  
  [6, 7, 9, 8],
  [10, 11, 13, 12],
]
);
