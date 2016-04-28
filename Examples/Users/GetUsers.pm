package GetUsers;
use strict;
use warnings FATAL => 'all';

sub GetUsers {
    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $errorString = "";

    my @dataObject = $route4Me->getUsers( \$errorString );

    print "\n";

    if (@dataObject) {
        printf "GetUsers executed successfully, %s users returned\n\n", scalar @dataObject;

    } else {
        printf "GetRoutes error: %s\n", $errorString;
    }
}

1;