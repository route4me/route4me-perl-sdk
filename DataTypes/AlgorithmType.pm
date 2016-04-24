package AlgorithmType;
use strict;
use warnings FATAL => 'all';

use constant {
    'TSP'        => 1, #single depot, single driver route
    'VRP'        => 2, #single depot, multiple driver, no constraints, no time windows, no capacities
    'CVRP_TW_SD' => 3, #single depot, multiple driver, capacitated, time windows
    'CVRP_TW_MD' => 4, #multiple depot, multiple driver, capacitated, time windows
    'TSP_TW'     => 5, #single depot, single driver, time windows
    'TSP_TW_CR'  => 6, #single depot, single driver, time windows, continuous optimization (minimal location shifting)
    'BBCVRP'     => 7, #shifts addresses from one route to another over time on a recurring schedule
};


1;