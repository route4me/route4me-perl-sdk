package ExamplesInfrastructure;
use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use Route4MeSDK::DataTypes::OptimizationState;

use constant {
    ApiKey => "11111111111111111111111111111111"
};

sub PrintExampleOptimizationResult {
    my ( $self, $exampleName, $dataObject, $errorString ) = @_;
    print "\n";
    if ($dataObject) {
        printf ("%s executed successfully", $exampleName);
        print "\n";
        print "\n";

        printf ("Optimization Problem ID: %s", $dataObject->optimization_problem_id);
        print "\n";
        printf ("State: %s", OptimizationState->get_optimization_state($dataObject->state));
        print "\n";

        foreach my $err (@{$dataObject->user_errors}) {
            printf ("UserError: '%s'", $err);
            print "\n";
        }
        foreach my $address (@{$dataObject->addresses}) {
            printf ("Address: %s", $address->address);
            print "\n";
            printf ("Route ID: %s", $address->route_id ? $address->route_id : "");
            print "\n";
        }


    } else {
        printf ("%s error %s", $exampleName, $errorString);
        print "\n";
    }
    print "\n";
    print "\n";
}

1;
