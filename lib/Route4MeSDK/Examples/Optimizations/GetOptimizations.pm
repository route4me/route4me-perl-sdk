package GetOptimizations;
use strict;
use warnings FATAL => 'all';
use Route4MeSDK::QueryTypes::RouteParametersQuery;

sub GetOptimizations {
    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $queryParameters = RouteParametersQuery->new(
        limit  => 10,
        offset => 5
    );

    my $errorString;

    my $dataObjects = $route4Me->getOptimizations($queryParameters, $errorString);

    print "\n";

    if ($dataObjects) {
        printf "GetOptimizations executed successfully, %s optimizations returned\n\n", scalar @{$dataObjects->optimizations};

        foreach my $dataObject (@{$dataObjects->optimizations})
        {
            printf "Optimization Problem ID:  %s\n", $dataObject->optimization_problem_id;
        }

    } else {
        printf "GetOptimizations error: %s\n", $errorString;
    }
}
1;
