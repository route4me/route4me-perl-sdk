package OptimizationState;
use strict;
use warnings FATAL => 'all';
sub get_optimization_state {
    my ($self, $state) = @_;
    my %map = (
        1 => 'Initial',
        2 => 'MatrixProcessing',
        3 => 'Optimizing',
        4 => 'Optimized',
        5 => 'Error',
        6 => 'ComputingDirections'
    );
    return $map{$state};
}
1;