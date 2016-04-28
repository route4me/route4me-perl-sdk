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
use Examples::Users::GetUsers;
use Examples::Activities::GetActivities;

my $old_fh = select(STDOUT);
$| = 1;
select($old_fh);

my $dataObject;

my $dataObject1 = SingleDriverRoute10Stops->SingleDriverRoute10Stops();

$dataObject = $dataObject1;

my $routeId_SingleDriverRoute10Stops = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id :
    undef;

my @destinationIds = AddRouteDestinations->AddRouteDestinations($routeId_SingleDriverRoute10Stops);

if (@destinationIds && scalar @destinationIds > 0)
{
    RemoveRouteDestination->RemoveRouteDestination($routeId_SingleDriverRoute10Stops, $destinationIds[0]);
}

my $dataObject2 = SingleDriverRoundTrip->SingleDriverRoundTrip();
$dataObject = $dataObject2;

my $routeId_SingleDriverRoundTrip = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id :
    undef;
my $routeIdToMoveTo = $routeId_SingleDriverRoundTrip;

my $routeDestinationIdToMove = ($dataObject1 &&
                            $dataObject1->routes &&
                            scalar @{$dataObject1->routes} > 0 &&
                            scalar @{@{$dataObject1->routes}[0]->addresses} > 1 &&
                            @{@{$dataObject1->routes}[0]->addresses}[1]->route_destination_id) ?
                            @{@{$dataObject1->routes}[0]->addresses}[1]->route_destination_id : 0;

my $afterDestinationIdToMoveAfter = ($dataObject2 &&
                                    $dataObject2->routes &&
                                    scalar @{$dataObject2->routes} > 0 &&
                                    scalar @{@{$dataObject2->routes}[0]->addresses} > 1 &&
                                    @{@{$dataObject2->routes}[0]->addresses}[1]->route_destination_id) ?
                                @{@{$dataObject2->routes}[0]->addresses}[1]->route_destination_id : 0;


if ($routeIdToMoveTo && $routeDestinationIdToMove != 0 && $afterDestinationIdToMoveAfter != 0)
{
    MoveDestinationToRoute->MoveDestinationToRoute($routeIdToMoveTo, $routeDestinationIdToMove, $afterDestinationIdToMoveAfter);
} else {
    printf "MoveDestinationToRoute not called. routeDestinationId = %s, afterDestinationId = %s.", $routeDestinationIdToMove, $afterDestinationIdToMoveAfter;
    print "\n";
}

my $optimizationProblemID = SingleDriverRoundTripGeneric->SingleDriverRoundTripGeneric(); # TODO

$dataObject = MultipleDepotMultipleDriver->MultipleDepotMultipleDriver();

my $routeId_MultipleDepotMultipleDriver = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id :
    undef;

$dataObject = MultipleDepotMultipleDriverTimeWindow->MultipleDepotMultipleDriverTimeWindow();

my $routeId_MultipleDepotMultipleDriverTimeWindow = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id :
    undef;

$dataObject = SingleDepotMultipleDriverNoTimeWindow->SingleDepotMultipleDriverNoTimeWindow();

my $routeId_SingleDepotMultipleDriverNoTimeWindow = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id :
    undef;

$dataObject = MultipleDepotMultipleDriverWith24StopsTimeWindow->MultipleDepotMultipleDriverWith24StopsTimeWindow();

my $routeId_MultipleDepotMultipleDriverWith24StopsTimeWindow = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id :
    undef;

$dataObject = SingleDriverMultipleTimeWindows->SingleDriverMultipleTimeWindows();

my $routeId_SingleDriverMultipleTimeWindows = ($dataObject && $dataObject->routes && scalar @{$dataObject->routes} > 0) ?
    @{$dataObject->routes}[0]->route_id :
    undef;

if ($optimizationProblemID) {
    GetOptimization->GetOptimization($optimizationProblemID);
} else {
    print "GetOptimization not called. optimizationProblemID == null.\n";
}

GetOptimizations->GetOptimizations();

if ($optimizationProblemID) {
    AddDestinationToOptimization->AddDestinationToOptimization($optimizationProblemID, 1);
} else {
    print "AddDestinationToOptimization not called. optimizationProblemID == null.\n"
}

if ($optimizationProblemID) {
    ReOptimization->ReOptimization($optimizationProblemID);
} else {
    print "ReOptimization not called. optimizationProblemID == null.\n"
}

if ($routeId_SingleDriverRoute10Stops) {
    UpdateRoute->UpdateRoute($routeId_SingleDriverRoute10Stops);
    ReoptimizeRoute->ReoptimizeRoute($routeId_SingleDriverRoute10Stops);
    GetRoute->GetRoute($routeId_SingleDriverRoute10Stops);
} else {
    print "UpdateRoute, ReoptimizeRoute, GetRoute not called. routeId_SingleDriverRoute10Stops == null. /n"
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
    GetAddress->GetAddress($routeIdToMoveTo, $routeDestinationIdToMove);

    AddAddressNote->AddAddressNote($routeIdToMoveTo, $routeDestinationIdToMove);
    GetAddressNotes->GetAddressNotes($routeIdToMoveTo, $routeDestinationIdToMove);
}
else
{
    print("AddAddressNote, GetAddress, GetAddressNotes not called. routeIdToMoveTo == null || routeDestinationIdToMove == 0.\n");
}
