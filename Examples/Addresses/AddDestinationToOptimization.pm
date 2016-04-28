package AddDestinationToOptimization;
use strict;
use warnings FATAL => 'all';

use DataTypes::OptimizationState;

sub AddDestinationToOptimization {

    my ($self, $optimizationProblemID, $andReOptimize) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $addresses = [
        Address->new( address => "717 5th Ave New York, NY 10021",
            alias             => "Giorgio Armani",
            lat               => 40.7669692,
            lng               => -73.9693864,
            time              => 0
        )
    ];

    my $optimizationParameters = OptimizationParameters->new({
            optimization_problem_id => $optimizationProblemID,
            reoptimize => $andReOptimize,
            addresses  => $addresses,
    });

    my $errorString = "";

    my $dataObject = $route4Me->updateOptimization( $optimizationParameters, \$errorString );

    print "\n";

    if ($dataObject) {
        print "AddDestinationToOptimization executed successfully\n";
        printf "Optimization Problem ID: %s\n", $optimizationProblemID;
        printf "State: %s\n", OptimizationState->get_optimization_state($dataObject->state);
    } else {
        printf "AddDestinationToOptimization error: %s\n", $errorString;
    }

}

1;