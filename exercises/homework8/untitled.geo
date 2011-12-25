Point(1) = {-1, 0.7, -0.6, 1.0};
Point(2) = {0.3, 1.1, -0.4, 1.0};
Point(3) = {-0.8, -0.1, -0.2, 1.0};
Point(4) = {0.5, 0.3, -0.1, 1.0};
Line(1) = {3, 1};
Line(2) = {1, 2};
Line(3) = {4, 2};
Line(4) = {3, 4};
Circle(5) = {1, 4, 2};
Delete {
  Point{1};
}
Delete {
  Point{1};
}
Delete {
  Point{1, 4, 3};
}
Delete {
  Line{3};
}
Delete {
  Line{5};
}
Delete {
  Line{2};
}
Delete {
  Line{1};
}
Delete {
  Line{4};
}
Point(5) = {-0.2, 0.7, -0.4, 1.0};
Point(1) = {-0.4, 0.8, -0.3, 1.0};
Point(2) = {-0.4, 0.6, -0.3, 1.0};
Point(3) = {-0.1, 0.6, -0.3, 1.0};
Point(4) = {-0.1, 0.8, -0.3, 1.0};
Point(1) = {-4.7, 3.8, -0.3, 1.0};
Point(2) = {-4.8, -5.6, -0.4, 1.0};
Point(3) = {7.4, -5.7, -0.4, 1.0};
Point(4) = {7, 4, -0.3, 1.0};
Point(1) = {-0.8, 1.2, -0.3, 1.0};
Point(2) = {-0.8, 0.6, -0.3, 1.0};
Point(3) = {0.1, 0.6, -0.3, 1.0};
Point(4) = {0.1, 1.2, -0.3, 1.0};
Line(1) = {1, 4};
Line(2) = {4, 3};
Line(3) = {3, 2};
Line(4) = {2, 1};
Point(5) = {-0.5, 0.9, -0.3, 1.0};
Point(6) = {-0.4, 1.1, -0.3, 1.0};
Point(7) = {-0.3, 0.9, -0.3, 1.0};
Point(8) = {-0.4, 0.7, -0.3, 1.0};
Circle(5) = {5, 7, 6};
Circle(6) = {6, 5, 7};
Delete {
  Line{6};
}
Delete {
  Line{5};
}
Delete {
  Point{5};
}
Delete {
  Point{7};
}
Point(9) = {-0.6, 0.9, -0.3, 1.0};
Point(10) = {-0.2, 0.9, -0.3, 1.0};
Point(11) = {-0.4, 0.9, -0.3, 1.0};
Circle(5) = {9, 11, 6};
Circle(6) = {6, 11, 10};
Circle(7) = {10, 11, 8};
Circle(8) = {8, 11, 9};
Line Loop(9) = {4, 1, 2, 3};
Line Loop(10) = {5, 6, 7, 8};
Plane Surface(11) = {9, 10};
Symmetry {1, 0, 0, 1} {
  Line{4};
}
Symmetry {1, 0, 0, 1} {
  Line{2};
}
Symmetry {1, 0, 0, 1} {
  Line{2, 4};
}
Symmetry {1, 0, 0, 1} {
  Surface{11};
}
Plane Surface(12) = {9, 10};
Plane Surface(13) = {10};
Delete {
  Surface{12};
}
Delete {
  Surface{11};
}
Delete {
  Surface{13};
}
Translate {0, 0, 1} {
  Duplicata { Line{2}; }
}
Translate {0, 0, 1} {
  Duplicata { Line{1, 4, 5, 6, 7, 8, 3}; }
}
Line(21) = {4, 12};
Line(22) = {13, 3};
Line(23) = {10, 29};
Line(24) = {24, 6};
Line(25) = {34, 8};
Line(26) = {9, 22};
Line(27) = {14, 1};
Line(28) = {18, 2};
Plane Surface(29) = {9, 10};
Line Loop(30) = {2, -22, -13, -21};
Plane Surface(31) = {30};
Line Loop(32) = {21, -14, 27, 1};
Plane Surface(33) = {32};
Line Loop(34) = {13, 20, 15, 14};
Plane Surface(35) = {34};
Line Loop(36) = {15, 27, -4, -28};
Plane Surface(37) = {36};
Line Loop(38) = {28, -3, -22, 20};
Plane Surface(39) = {38};
Line Loop(40) = {19, -26, -8, -25};
Plane Surface(41) = {40};
Delete {
  Surface{41};
}
Ruled Surface(41) = {40};
Line Loop(42) = {5, -24, -16, -26};
Ruled Surface(43) = {42};
Line Loop(44) = {6, 23, -17, 24};
Ruled Surface(45) = {44};
Line Loop(46) = {18, 25, -7, 23};
Ruled Surface(47) = {46};
Plane Surface(48) = {36};
Plane Surface(49) = {32};
Plane Surface(50) = {9, 10};
Delete {
  Line{1, 3, 6, 4, 24};
}
Point(1) = {-2.1, 0.8, -0.4, 1.0};
Point(2) = {-1.3, 0.8, -1, 1.0};
Point(3) = {-1.7, 0.4, -1.5, 1.0};
Point(4) = {-1.5, 0.9, -1.8, 1.0};
Delete {
  Surface{31};
}
Plane Surface(51) = {30};
Delete {
  Surface{35};
}
Line Loop(52) = {18, 19, 16, 17};
Plane Surface(53) = {34, 52};
Surface Loop(54) = {33, 51, 39, 53, 45, 47, 41, 43, 29, 37};
Volume(55) = {54};
Delete {
  Point{11};
}
Delete {
  Point{11};
}
Delete {
  Point{11};
}
Delete {
  Point{23};
}
Point(35) = {-1.2, 0.9, 0.2, 1.0};
Delete {
  Point{11, 23, 35};
}
Delete {
  Point{23};
}
