package GetOptimization;
use strict;
use warnings FATAL => 'all';
use Route4MeSDK::DataTypes::OptimizationState;

sub GetOptimization {
    my ($self, $optimizationProblemID) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $optimizationParameters = OptimizationParameters->new(
        optimization_problem_id => $optimizationProblemID
    );

    my $errorString;
    my $dataObject = $route4Me->getOptimization($optimizationParameters, \$errorString);

    if ($dataObject) {
        print "GetOptimization executed successfully\n";
        printf "Optimization Problem ID:  %s\n", $dataObject->optimization_problem_id;
        printf "State: %s\n", OptimizationState->get_optimization_state($dataObject->state);

    } else {
        printf "GetOptimization error: %s\n", $errorString;
    }
}
1;
