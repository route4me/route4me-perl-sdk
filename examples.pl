#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use Route4MeManager;
use Examples::ExamplesInfrastructure;
use Examples::SingleDriverRoute10Stops;
use Examples::Addresses::AddAddressNote;
use Examples::Addresses::AddDestinationToOptimization;
use Examples::Addresses::AddRouteDestinations;
use Examples::Addresses::GetAddress;
use Examples::Addresses::GetAddressNotes;
use Examples::Addresses::RemoveRouteDestination;
use Examples::Addresses::MoveDestinationToRoute;
use Examples::SingleDriverRoundTrip;
use Examples::SingleDriverRoundTripGeneric;
use Examples::MultipleDepotMultipleDriver;
use Examples::MultipleDepotMultipleDriverTimeWindow;
use Examples::SingleDepotMultipleDriverNoTimeWindow;
use Examples::MultipleDepotMultipleDriverWith24StopsTimeWindow;
use Examples::SingleDriverMultipleTimeWindows;
use Examples::Optimizations::GetOptimization;
use Examples::Optimizations::GetOptimizations;
use Examples::Optimizations::ReOptimization;
use Examples::Routes::UpdateRoute;
use Examples::Routes::ReoptimizeRoute;
use Examples::Routes::GetRoute;
use Examples::Routes::GetRoutes;
use Examples::Routes::DeleteRoutes;
use Examples::Routes::DuplicateRoute;
use Examples::Users::GetUsers;
use Examples::Activities::GetActivities;
use Examples::AddressBook::AddAddressBookContact;
use Examples::AddressBook::GetAddressBookContacts;
use Examples::AddressBook::UpdateAddressBookContact;
use Examples::AddressBook::RemoveAddressBookContacts;
use Examples::AvoidanceZones::AddAvoidanceZone;
use Examples::AvoidanceZones::DeleteAvoidanceZone;
use Examples::AvoidanceZones::GetAvoidanceZone;
use Examples::AvoidanceZones::GetAvoidanceZones;
use Examples::AvoidanceZones::UpdateAvoidanceZone;
use Examples::Tracking::SetGPSPosition;
use Examples::Tracking::TrackDeviceLastLocationHistory;
use Examples::GenericExample;
my $old_fh = select(STDOUT);
$| = 1;
select($old_fh);


my $dataObject;

my $dataObject1 = SingleDriverRoute10Stops->SingleDriverRoute10Stops();

$dataObject = $dataObject1;

my $routeId_SingleDriverRoute10Stops = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id                                                                          :
    undef;

my @destinationIds = AddRouteDestinations->AddRouteDestinations( $routeId_SingleDriverRoute10Stops );

if (@destinationIds && scalar @destinationIds > 0)
{
    RemoveRouteDestination->RemoveRouteDestination( $routeId_SingleDriverRoute10Stops, $destinationIds[0] );
}

my $dataObject2 = SingleDriverRoundTrip->SingleDriverRoundTrip();
$dataObject = $dataObject2;

my $routeId_SingleDriverRoundTrip = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id                                                                       :
    undef;
my $routeIdToMoveTo = $routeId_SingleDriverRoundTrip;

my $routeDestinationIdToMove = ($dataObject1 &&
        $dataObject1->routes &&
        scalar @{$dataObject1->routes} > 0 &&
        scalar @{@{$dataObject1->routes}[0]->addresses} > 1 &&
        @{@{$dataObject1->routes}[0]->addresses}[1]->route_destination_id) ?
    @{@{$dataObject1->routes}[0]->addresses}[1]->route_destination_id      : 0;

my $afterDestinationIdToMoveAfter = ($dataObject2 &&
        $dataObject2->routes &&
        scalar @{$dataObject2->routes} > 0 &&
        scalar @{@{$dataObject2->routes}[0]->addresses} > 1 &&
        @{@{$dataObject2->routes}[0]->addresses}[1]->route_destination_id) ?
    @{@{$dataObject2->routes}[0]->addresses}[1]->route_destination_id      : 0;

if ($routeIdToMoveTo && $routeDestinationIdToMove != 0 && $afterDestinationIdToMoveAfter != 0)
{
    MoveDestinationToRoute->MoveDestinationToRoute( $routeIdToMoveTo, $routeDestinationIdToMove,
        $afterDestinationIdToMoveAfter );
} else {
    printf "MoveDestinationToRoute not called. routeDestinationId = %s, afterDestinationId = %s.",
        $routeDestinationIdToMove, $afterDestinationIdToMoveAfter;
    print "\n";
}

my $optimizationProblemID = SingleDriverRoundTripGeneric->SingleDriverRoundTripGeneric(); # TODO

$dataObject = MultipleDepotMultipleDriver->MultipleDepotMultipleDriver();

my $routeId_MultipleDepotMultipleDriver = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id                                                                             :
    undef;

$dataObject = MultipleDepotMultipleDriverTimeWindow->MultipleDepotMultipleDriverTimeWindow();

my $routeId_MultipleDepotMultipleDriverTimeWindow = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id                                                                                       :
    undef;

$dataObject = SingleDepotMultipleDriverNoTimeWindow->SingleDepotMultipleDriverNoTimeWindow();

my $routeId_SingleDepotMultipleDriverNoTimeWindow = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id                                                                                       :
    undef;

$dataObject = MultipleDepotMultipleDriverWith24StopsTimeWindow->MultipleDepotMultipleDriverWith24StopsTimeWindow();

my $routeId_MultipleDepotMultipleDriverWith24StopsTimeWindow = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id                                                                                                  :
    undef;

$dataObject = SingleDriverMultipleTimeWindows->SingleDriverMultipleTimeWindows();

my $routeId_SingleDriverMultipleTimeWindows = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id                                                                                 :
    undef;

if ($optimizationProblemID) {
    GetOptimization->GetOptimization( $optimizationProblemID );
} else {
    print "GetOptimization not called. optimizationProblemID == null.\n";
}

GetOptimizations->GetOptimizations();

if ($optimizationProblemID) {
    AddDestinationToOptimization->AddDestinationToOptimization( $optimizationProblemID, 1 );
} else {
    print "AddDestinationToOptimization not called. optimizationProblemID == null.\n"
}

if ($optimizationProblemID) {
    ReOptimization->ReOptimization( $optimizationProblemID );
} else {
    print "ReOptimization not called. optimizationProblemID == null.\n"
}

if ($routeId_SingleDriverRoute10Stops) {
    UpdateRoute->UpdateRoute( $routeId_SingleDriverRoute10Stops );
    ReoptimizeRoute->ReoptimizeRoute( $routeId_SingleDriverRoute10Stops );
    GetRoute->GetRoute( $routeId_SingleDriverRoute10Stops );
} else {
    print "UpdateRoute, ReoptimizeRoute, GetRoute not called. routeId_SingleDriverRoute10Stops == null. \n"
}

GetRoutes->GetRoutes();
GetUsers->GetUsers();

if ($routeId_SingleDriverRoute10Stops) {
    GetActivities->GetActivities( $routeId_SingleDriverRoute10Stops );
} else {
    print ( "GetActivities not called. routeId_SingleDriverRoute10Stops == null.\n" );
}

if ($routeIdToMoveTo && $routeDestinationIdToMove != 0)
{
    GetAddress->GetAddress( $routeIdToMoveTo, $routeDestinationIdToMove );

    AddAddressNote->AddAddressNote( $routeIdToMoveTo, $routeDestinationIdToMove );
    GetAddressNotes->GetAddressNotes( $routeIdToMoveTo, $routeDestinationIdToMove );
}
else
{
    print( "AddAddressNote, GetAddress, GetAddressNotes not called. routeIdToMoveTo == null || routeDestinationIdToMove == 0.\n" );
}

my $routeId_DuplicateRoute;
if ($routeId_SingleDriverRoute10Stops) {
    $routeId_DuplicateRoute = DuplicateRoute->DuplicateRoute( $routeId_SingleDriverRoute10Stops );
} else {
    print "DuplicateRoute not called. routeId_SingleDriverRoute10Stops == null.\n";
}


#disabled by default, not necessary for optimization tests
#not all accounts are capable of storing gps data

#if ($routeId_SingleDriverRoute10Stops) {
#    SetGPSPosition->SetGPSPosition($routeId_SingleDriverRoute10Stops);
#    TrackDeviceLastLocationHistory->TrackDeviceLastLocationHistory($routeId_SingleDriverRoute10Stops);
#} else {
#    print "SetGPSPosition, TrackDeviceLastLocationHistory not called. routeId_SingleDriverRoute10Stops == null.\n";
#}

my @routeIdsToDelete;
if ($routeId_SingleDriverRoute10Stops) {
    push @routeIdsToDelete, $routeId_SingleDriverRoute10Stops;
}
if ($routeId_SingleDriverRoundTrip) {
    push @routeIdsToDelete, $routeId_SingleDriverRoundTrip;
}
if ($routeId_DuplicateRoute) {
    push @routeIdsToDelete, $routeId_DuplicateRoute;
}
if ($routeId_MultipleDepotMultipleDriver) {
    push @routeIdsToDelete, $routeId_MultipleDepotMultipleDriver;
}
if ($routeId_MultipleDepotMultipleDriverTimeWindow) {
    push @routeIdsToDelete, $routeId_MultipleDepotMultipleDriverTimeWindow;
}
if ($routeId_SingleDepotMultipleDriverNoTimeWindow) {
    push @routeIdsToDelete, $routeId_SingleDepotMultipleDriverNoTimeWindow;
}
if ($routeId_MultipleDepotMultipleDriverWith24StopsTimeWindow) {
    push @routeIdsToDelete, $routeId_MultipleDepotMultipleDriverWith24StopsTimeWindow;
}
if ($routeId_SingleDriverMultipleTimeWindows) {
    push @routeIdsToDelete, $routeId_SingleDriverMultipleTimeWindows;
}

if (scalar @routeIdsToDelete > 0) {
    DeleteRoutes->DeleteRoutes( @routeIdsToDelete );
} else {
    print "routeIdsToDelete.Count == 0. DeleteRoutes not called.\n";
}

my $contact1 = AddAddressBookContact->AddAddressBookContact();
my $contact2 = AddAddressBookContact->AddAddressBookContact();
GetAddressBookContacts->GetAddressBookContacts();
if ($contact1)
{
    $contact1->last_name("Updated " . int(rand(100000)));
    UpdateAddressBookContact->UpdateAddressBookContact($contact1);
}
else
{
    print "contact1 == null. UpdateAddressBookContact not called.\n";
}
my @addressIdsToRemove;
if ($contact1) {
    push @addressIdsToRemove, $contact1->address_id;
}
if ($contact2) {
    push @addressIdsToRemove, $contact2->address_id;
}
RemoveAddressBookContacts->RemoveAddressBookContacts(\@addressIdsToRemove);

# Avoidance Zones
my $territoryId = AddAvoidanceZone->AddAvoidanceZone();
GetAvoidanceZones->GetAvoidanceZones();
if ($territoryId) {
    GetAvoidanceZone->GetAvoidanceZone($territoryId);
} else {
    print "GetAvoidanceZone not called. territoryId == null.\n";
}
if ($territoryId) {
    UpdateAvoidanceZone->UpdateAvoidanceZone($territoryId);
} else {
    print "UpdateAvoidanceZone not called. territoryId == null.\n";
}
if ($territoryId) {
    DeleteAvoidanceZone->DeleteAvoidanceZone($territoryId);
} else {
    print "DeleteAvoidanceZone not called. territoryId == null.\n";
}


GenericExample->GenericExample();
GenericExample->GenericExampleShortcut();