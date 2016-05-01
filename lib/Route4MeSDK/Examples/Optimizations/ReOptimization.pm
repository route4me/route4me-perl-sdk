package ReOptimization;
use strict;
use warnings FATAL => 'all';
sub ReOptimization {
    my ($self, $optimizationProblemID) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $optimizationParameters = OptimizationParameters->new({
            optimization_problem_id => $optimizationProblemID,
            reoptimize => 1
        });

    my $errorString = "";

    my $dataObject = $route4Me->updateOptimization( $optimizationParameters, \$errorString );

    print "\n";

    if ($dataObject) {
        print "ReOptimization executed successfully\n";
        printf "Optimization Problem ID: %s\n", $optimizationProblemID;
        printf "State: %s\n", OptimizationState->get_optimization_state($dataObject->state);
    } else {
        printf "ReOptimization error: %s\n", $errorString;
    }

}
1;