cl1 = 1;
Point(1) = {1, 0, 0, cl1};
Point(2) = {0, 0, 0, cl1};
Point(3) = {0, 1, 0, cl1};
Point(4) = {0, -1, 0, cl1};
Point(5) = {-1, 0, 0, cl1};
Point(6) = {0.5, 0.5, 1, cl1};
Point(7) = {-0.5, 0.5, 1, cl1};
Point(8) = {-0.5, -0.5, 1, cl1};
Point(9) = {0.5, -0.5, 1, cl1};
Point(10) = {0, 0, 1, cl1};
Point(11) = {0.25, 0, 1, cl1};
Point(12) = {-0.25, 0, 1, cl1};
Point(13) = {0, 0.25, 1, cl1};
Point(14) = {0, -0.25, 1, cl1};
Point(15) = {0, 0.5, 0, cl1};
Point(16) = {0, -0.5, 0, cl1};
Point(17) = {0.5, 0, 0, cl1};
Point(18) = {-0.5, 0, 0, cl1};
Circle(1) = {1, 2, 3};
Circle(2) = {1, 2, 4};
Circle(3) = {4, 2, 5};
Circle(4) = {5, 2, 3};
Line(5) = {7, 6};
Line(6) = {9, 6};
Line(7) = {8, 9};
Line(8) = {8, 7};
Circle(9) = {14, 10, 11};
Circle(10) = {11, 10, 13};
Circle(11) = {13, 10, 12};
Circle(12) = {12, 10, 14};
Circle(13) = {16, 2, 17};
Circle(14) = {17, 2, 15};
Circle(15) = {15, 2, 18};
Circle(16) = {18, 2, 16};
Line(17) = {9, 1};
Line(18) = {6, 3};
Line(19) = {8, 4};
Line(20) = {7, 5};
Line(21) = {12, 18};
Line(22) = {14, 16};
Line(23) = {13, 15};
Line(24) = {11, 17};
Line Loop(27) = {5, -6, -7, 8, -9, -12, -11, -10};
Plane Surface(27) = {27};
Line Loop(30) = {2, 3, 4, -1, -16, -15, -14, -13};
Plane Surface(30) = {30};
Line Loop(32) = {7, 17, 2, -19};
Ruled Surface(32) = {32};
Line Loop(34) = {6, 18, -1, -17};
Ruled Surface(34) = {34};
Line Loop(36) = {18, -4, -20, 5};
Ruled Surface(36) = {36};
Line Loop(38) = {3, -20, -8, 19};
Ruled Surface(38) = {38};
Line Loop(40) = {9, 24, -13, -22};
Ruled Surface(40) = {40};
Line Loop(42) = {12, 22, -16, -21};
Ruled Surface(42) = {42};
Line Loop(44) = {11, 21, -15, -23};
Ruled Surface(44) = {44};
Line Loop(46) = {10, 23, -14, -24};
Ruled Surface(46) = {46};
Surface Loop(48) = {34, 27, 36, 30, 32, 38, 42, 40, 46, 44};
Volume(48) = {48};
Delete {
  Point{10, 2};
}
Delete {
  Point{10, 2};
}
Delete {
  Point{10, 2};
}
