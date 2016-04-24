package AddRouteDestinations;
use strict;
use warnings FATAL => 'all';
use Data::Dumper;

sub AddRouteDestinations {
    my ( $self, $routeId, $errors ) = @_;

    my $route4Me = Route4MeManager->new(ExamplesInfrastructure->ApiKey);

    my $addresses = [
        Address->new(address => "146 Bill Johnson Rd NE Milledgeville GA 31061", lat => 33.143526, lng => -83.240354, time => 0, curbside_lat => undef, curbside_lng => undef),
        Address->new(address => "222 Blake Cir Milledgeville GA 31061", lat => 33.177852, lng => -83.263535, time => 0, curbside_lat => undef, curbside_lng => undef)
    ];

    my @destinationIds = $route4Me->addRouteDestinations($routeId, $addresses, $errors);

    if (@destinationIds) {
        print "AddRouteDestinations executed successfully";
        print "\n";
        printf ( "Destination IDs: %s", join( ", ", @destinationIds ) );
        print "\n";
        print "\n";
    } else {
        printf ( "AddRouteDestinations error: %s", $errors);
        print "\n";
        print "\n";
    }

    return @destinationIds;

}

1;