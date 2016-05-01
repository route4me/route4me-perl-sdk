package GenericExample;
use strict;
use warnings FATAL => 'all';
use Route4MeSDK::R4MEInfrastructureSettings;
use Route4MeSDK::Route4MeManager;
use Route4MeSDK::QueryTypes::RouteParametersQuery;

#the api key of the account
#the api key must have hierarchical ownership of the route being viewed (api key can't view routes of others)
use constant myApiKey => "11111111111111111111111111111111";

sub GenericExample {
    my $uri = R4MEInfrastructureSettings->MainHost . '/api.v4/route.php';


    my $route4Me = Route4MeManager->new(myApiKey);

    my $genericParameters = {
        limit => 10,
        offset => 5
    };

    my $errorString = "";
    my @dataObjects = $route4Me->getJsonObjectFromAPI('ArrayRef[DataObjectRoute]', HttpMethodType->Get, $uri, undef, $genericParameters, \$errorString );

    print "\n";

    if (@dataObjects)
    {
        printf "GenericExample executed successfully, %s routes returned\n", scalar @dataObjects;

        foreach my $dataObject (@dataObjects)
        {
            printf "Optimization Problem ID: %s\n", $dataObject->optimization_problem_id;
            printf "RouteID: %s\n", $dataObject->route_id;
            print "\n";
        }
    }
    else
    {
        printf "GenericExample error %s", $errorString;
    }
}

sub GenericExampleShortcut {

    my $route4Me = Route4MeManager->new(myApiKey);

    my $routeQueryParameters = RouteParametersQuery->new(
        limit => 10,
        offset => 5
    );

    my $errorString = "";
    my @dataObjects = $route4Me->getRoutes($routeQueryParameters, $errorString);

    print "\n";

    if (@dataObjects)
    {
        printf "GenericExample executed successfully, %s routes returned\n", scalar @dataObjects;

        foreach my $dataObject (@dataObjects)
        {
            printf "Optimization Problem ID: %s\n", $dataObject->optimization_problem_id;
            printf "RouteID: %s\n", $dataObject->route_id;
            print "\n";
        }
    }
    else
    {
        printf "GenericExample error %s", $errorString;
    }
}
1;
