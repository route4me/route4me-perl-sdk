package Metric;
use strict;
use warnings FATAL => 'all';
use constant {
    Euclidean => 1, #measures point to point distance as a straight line
    Manhattan => 2, #measures point to point distance as taxicab geometry line
    Geodesic  => 3, #measures point to point distance approximating curvature of the earth
    Matrix    => 4, #measures point to point distance by traversing the actual road network
    Exact_2D  => 5  #measures point to point distance using 2d rectilinear distance
};
1;