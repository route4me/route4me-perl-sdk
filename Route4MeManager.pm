package Route4MeManager;
use strict;
use warnings FATAL => 'all';

use HTTP::Tiny;
use JSON;
use Data::Dumper;
use URI;
use URI::QueryParam;
use R4MEInfrastructureSettings;
use DataTypes::QueryStringAttribute;
use DataTypes::Metric;
use DataTypes::OptimizationState;
use DataTypes::DataObjectOptimizations;
use DataTypes::Address;
use DataTypes::AddressNote;
use DataTypes::RouteParameters;
use DataTypes::AlgorithmType;
use DataTypes::Optimize;
use DataTypes::DistanceUnit;
use DataTypes::DeviceType;
use DataTypes::OptimizationParameters;
use DataTypes::DataObject;
use DataTypes::DataObjectRoute;
use DataTypes::User;
use DataTypes::Links;
use DataTypes::GetActivitiesResponse;
use DataTypes::Activity;
use DataTypes::DuplicateRouteResponse;
use DataTypes::DeleteRouteResponse;
use QueryTypes::HttpMethodType;
use QueryTypes::ActivityParameters;
use R4MeUtils;
use R4MEInfrastructureSettings;

sub new
{
    my ( $class, $apiKey, $defaultTimeOut) = @_;

    $defaultTimeOut = 30 unless defined $defaultTimeOut;

    my $self = {
        _apiKey         => $apiKey,
        _defaultTimeOut => $defaultTimeOut
    };

    bless $self, $class;

    return $self;
}

sub setApiKey {
    my ( $self, $apiKey ) = @_;
    $self->{_apiKey} = $apiKey if defined( $apiKey );
    return $self->{_apiKey};
}

sub getApiKey {
    my ( $self ) = @_;
    return $self->{_apiKey};
}

sub runOptimization {
    my ( $self, $optimizationParameters, $errors ) = @_;

    my $content = R4MeUtils->serializeObjectToJson( $optimizationParameters );

    my $dataObject = $self->getJsonObjectFromAPI('DataObject', HttpMethodType->Post, R4MEInfrastructureSettings->ApiHost, $content, $errors);

    return $dataObject;
}

sub updateOptimization {

    my ( $self, $optimizationParameters, $errors ) = @_;

    my $params = _get_query_string_parameters($optimizationParameters);

    my $content = R4MeUtils->serializeObjectToJson( _get_non_query_string_parameters($optimizationParameters) );

    my $dataObject = $self->getJsonObjectFromAPI('DataObject', HttpMethodType->Put, R4MEInfrastructureSettings->ApiHost, $content, $params, $errors);

    return $dataObject;

}
sub getOptimization {
    my ( $self, $optimizationParameters, $errors ) = @_;

    my $params = {"optimization_problem_id" => $optimizationParameters->optimization_problem_id,
        "reoptimize" => $optimizationParameters->reoptimize,
        "show_directions" => $optimizationParameters->show_directions,
    };
    my $dataObject = $self->getJsonObjectFromAPI('DataObject', HttpMethodType->Get, R4MEInfrastructureSettings->ApiHost, undef, $params, $errors);

    return $dataObject;
}

sub getOptimizations {
    my ( $self, $parameters, $errors ) = @_;

    my $params = {"route_id" => $parameters->route_id,
        "directions" => $parameters->directions,
        "route_path_output" => $parameters->route_path_output,
        "device_tracking_history" => $parameters->route_path_output,
        "limit" => $parameters->limit,
        "offset" => $parameters->offset,
        "original" => $parameters->original,
        "notes" => $parameters->notes,
        "query" => $parameters->query,
        "reoptimize" => $parameters->reoptimize,
        "recompute_directions" => $parameters->recompute_directions,
        "parameters" => $parameters->parameters,
    };
    my $dataObject = $self->getJsonObjectFromAPI('DataObjectOptimizations', HttpMethodType->Get, R4MEInfrastructureSettings->ApiHost, undef, $params, $errors);

    return $dataObject;
}

sub deleteRoutes {
    my ( $self, @routeIds, $errors ) = @_;

    my $routes = join(',', @routeIds);
    my $params = {route_id => $routes};

    my $response = $self->getJsonObjectFromAPI('DeleteRouteResponse', HttpMethodType->Delete, R4MEInfrastructureSettings->RouteHost, undef, $params, $errors);

    my @deletedRouteIds = undef;
    if ($response)
    {
        @deletedRouteIds = @{$response->route_ids};
    }
    return @deletedRouteIds;
}

sub duplicateRoute {
    my ( $self, $parameters, $errors ) = @_;

    my $params = {%$parameters};
    $params->{'to'} = 'none';

    my $response = $self->getJsonObjectFromAPI('DuplicateRouteResponse', HttpMethodType->Get, R4MEInfrastructureSettings->DuplicateRoute, undef, $params, $errors);

    my $routeId = undef;
    if ($response && $response->success)
    {
        my $optimizationProblemId = $response->optimization_problem_id;
        if ($optimizationProblemId)
        {
            $routeId = $self->getRouteId($optimizationProblemId, $errors);
        }
    }
    return $routeId;
}

sub getRoute {
    my ($self, $routeParameters, $errors) = @_;

    my $params = _get_query_string_parameters($routeParameters);

    my $content = R4MeUtils->serializeObjectToJson( _get_non_query_string_parameters($routeParameters) );

    my $result = $self->getJsonObjectFromAPI('DataObjectRoute', HttpMethodType->Get, R4MEInfrastructureSettings->RouteHost, $content, $params, $errors);

    return $result;

}

sub getRouteId {
    my ($self, $optimizationProblemId, $errors) = @_;

    my $params = {
        optimization_problem_id => $optimizationProblemId,
        wait_for_final_state => 1
    };

    my $response = $self->getJsonObjectFromAPI('DataObject', HttpMethodType->Get, R4MEInfrastructureSettings->ApiHost, undef, $params, $errors);
    if ($response && $response->routes && scalar @{$response->routes} > 0)
    {
        my $routeId = @{$response->routes}[0]->route_id;
        return $routeId;
    }
    return undef;

}

sub getRoutes {
    my ($self, $routeParameters, $errors) = @_;

    my $params = _get_query_string_parameters($routeParameters);

    my $content = R4MeUtils->serializeObjectToJson( _get_non_query_string_parameters($routeParameters) );

    my @result = $self->getJsonObjectFromAPI('ArrayRef[DataObjectRoute]', HttpMethodType->Get, R4MEInfrastructureSettings->RouteHost, $content, $params, $errors);

    return @result;

}

sub updateRoute {
    my ($self, $routeParameters, $errors) = @_;

    my $params = _get_query_string_parameters($routeParameters);

    my $content = R4MeUtils->serializeObjectToJson( _get_non_query_string_parameters($routeParameters) );

    my $result = $self->getJsonObjectFromAPI('DataObjectRoute', HttpMethodType->Put, R4MEInfrastructureSettings->RouteHost, $content, $params, $errors);

    return $result;
}

sub getUsers {
    my ($self, $errors) = @_;

    my @result = $self->getJsonObjectFromAPI('ArrayRef[User]', HttpMethodType->Get, R4MEInfrastructureSettings->GetUsersHost, undef, $errors);

    return @result;

}

sub getActivities {
    my ($self, $activityParameters, $errors) = @_;

    my $params = _get_query_string_parameters($activityParameters);

    my $content = R4MeUtils->serializeObjectToJson ( _get_non_query_string_parameters($activityParameters) );

    my $result = $self->getJsonObjectFromAPI('GetActivitiesResponse', HttpMethodType->Get, R4MEInfrastructureSettings->GetActivitiesHost, $content, $params, $errors);

    return $result;

}

sub getAddress {
    my ($self, $addressParameters, $errors) = @_;

    my $params = _get_query_string_parameters($addressParameters);

    my $result = $self->getJsonObjectFromAPI('Address', HttpMethodType->Get, R4MEInfrastructureSettings->GetAddress, undef, $params, $errors);

    return $result;

}

sub addAddressNote {
    my ($self, $noteParameters, $noteContents, $errorString) = @_;

    my $params = {%$noteParameters};

    my $form_data = {};

    my $strUpdateType = "unclassified";
    if ($noteParameters->strUpdateType && length $noteParameters->strUpdateType) {
        $strUpdateType = $noteParameters->strUpdateType;
    }

    $form_data->{'strUpdateType'} = $strUpdateType;
    $form_data->{'strNoteContents'} = $noteContents;

    my $response = $self->_post_form(R4MEInfrastructureSettings->AddRouteNotesHost, $form_data, $params);

    my $content = JSON->new->decode( $response->{'content'} );

    if ($content)
    {
        if ($content->{'note'})
        {
            return $content->{'note'};
        }
        else
        {
            if (!$content->{'status'})
            {
                $errorString = "Note not added";
            }
            return undef;
        }
    }
    else
    {
        return undef;
    }

}

sub getAddressNotes {
    my ($self, $noteParameters, $errors) = @_;

    my $addressParameters = AddressParameters->new(
        route_id => $noteParameters->route_id,
        route_destination_id => $noteParameters->address_id,
        notes => 1
    );

    my $address = $self->getAddress($addressParameters, $errors);

    if ($address) {
        return @{$address->notes};
    } else {
        return undef;
    }
}

sub addRouteDestinations {
    my ( $self, $route_id, $addresses, $errors ) = @_;

    my $optimizationParameters = OptimizationParameters->new(
        addresses => $addresses,
    );

    my $content = R4MeUtils->serializeObjectToJson( $optimizationParameters );

    my $object = $self->getJsonObjectFromAPI('DataObject', HttpMethodType->Put, R4MEInfrastructureSettings->RouteHost, $content, {'route_id' => $route_id}, $errors);

    if (!$object) {return;}

    my @destinantionIds = ();

    foreach my $address (@{$object->addresses})
    {
        foreach my $addressNew ( @{$addresses} ) {
            if ($address->address eq $addressNew->address
                && $address->lat == $addressNew->lat
                && $address->lng == $addressNew->lng
                && defined $address->route_destination_id ) {
                push @destinantionIds, $address->route_destination_id;
            }
        }
    }

    return @destinantionIds;
}

sub removeRouteDestination {
    my ( $self, $routeId, $destinationId, $errorString ) = @_;

    my $dataObject = $self->_request(HttpMethodType->Delete, R4MEInfrastructureSettings->GetAddress, undef,
        {'route_id' => $routeId, route_destination_id => $destinationId });

    my $response = JSON->new->decode( $dataObject->{'content'} );

    if ($response && $response->{'deleted'}) {
        return 1;
    } else {
        return 0;
    }
}

sub moveDestinationToRoute {
    my ( $self, $toRouteId, $routeDestinationId, $afterDestinationId, $errorString ) = @_;

    my $form_data = {"to_route_id" => $toRouteId, "route_destination_id" => $routeDestinationId, "after_destination_id" => $afterDestinationId};

    my $response = $self->_post_form(R4MEInfrastructureSettings->MoveRouteDestination, $form_data);

    if ($response && $response->{'success'}) {
        return 1;
    } else {
        return 0;
    }

}

sub getJsonObjectFromAPI {
    my ( $self, $returnType, $method, $url, $content, $params, $errorMessage );
    if (@_ == 7)  {
        ( $self, $returnType, $method, $url, $content, $params, $errorMessage ) = @_;
    } else {
        ( $self, $returnType, $method, $url, $content, $errorMessage ) = @_;
    }

    my $dataObject = $self->_request($method, $url, $content, $params);

    if (!$dataObject->{'success'}) {
        $$errorMessage = $dataObject->{'content'};
        return;
    } else {

        my $o = JSON->new->decode( $dataObject->{'content'} );

        return $self->_recursive_bless($o, $returnType);

    }
}

sub getJsonObjectFromAPI_debug {
    my ( $self, $returnType, $method, $url, $content, $params, $errorMessage );
    if (@_ == 7)  {
        ( $self, $returnType, $method, $url, $content, $params, $errorMessage ) = @_;
    } else {
        ( $self, $returnType, $method, $url, $content, $errorMessage ) = @_;
    }

    my $dataObject = $self->_request($method, $url, $content, $params);

    print Dumper($dataObject);

    if (!$dataObject->{'success'}) {
        $$errorMessage = $dataObject->{'content'};
        return;
    } else {

        my $o = JSON->new->decode( $dataObject->{'content'} );

        return $self->_recursive_bless($o, $returnType);

    }
}

sub _recursive_bless {
    my ($self, $obj, $returnType) = @_;

    if ($returnType =~ /ArrayRef\[([^\]]+)]/) {
        my $type = $1;
        foreach my $element (@{$obj})
        {
            $element = bless($element, $type);
            $self->_bless_object_attributes($element);
        }
        return @{$obj};
    } else {
        my $object = bless($obj, $returnType);
        $self->_bless_object_attributes($object);
        return $object;
    }
}

sub _bless_object_attributes {
    my ($self, $obj) = @_;

    my $meta = $obj->meta;

    my @attributes;

    for my $super ( $meta->superclasses() ) {
        for my $attr ( map { $super->meta->get_attribute($_) }
            sort $super->meta->get_attribute_list ) {
            push( @attributes, $attr );

        }
    }

    for my $attr ( map { $meta->get_attribute($_) }
        sort $meta->get_attribute_list ) {
        push( @attributes, $attr );
    }

    for my $attribute ( @attributes ) {
        #print $attribute->name . "\n";
        #print $attribute->type_constraint->name . "\n";
        my $check1 = $attribute->type_constraint->is_subtype_of('Object') && !$attribute->type_constraint->is_a_type_of('Object');
        my $check2 = $attribute->type_constraint->{'type_parameter'} ? $attribute->type_constraint->type_parameter->is_subtype_of('Object') : 0;
        if ($check1 || $check2) {
            #print $attribute->name . " " . $attribute->type_constraint->name . "\n";
            $self->_recursive_bless($obj->{$attribute->name}, $attribute->type_constraint->name)
        }
    }

}

sub _post_form {
    my ( $self, $url, $form_data, $params ) = @_;
    my $u = URI->new("", "http");
    $u->query_param("api_key",$self->{_apiKey});
    if ($params) {
        foreach my $key (keys %$params) {
            $u->query_param_append($key, $params->{$key})
        }
    }

    my $client = $self->_createHttpClient();
    my $response = $client->post_form($url.'?'.$u->query, $form_data);
    return $response;
}

sub _request {
    my ( $self, $method, $url, $content, $params ) = @_;
    my $u = URI->new("", "http");
    $u->query_param("api_key",$self->{_apiKey});
    if ($params) {
        foreach my $key (keys %$params) {
            $u->query_param_append($key, $params->{$key})
        }
    }

    my $client = $self->_createHttpClient();

    my $response;
    if ($content) {
        $response = $client->request(
            $method,
            $url.'?'.$u->query => {
                content => $content,
            },
        );
    } else {
        $response = $client->request(
            $method,
            $url.'?'.$u->query,
        );
    }

    return $response;
}

sub _get_query_string_parameters {
    my $self = shift;

    my $meta = $self->meta;

    my $parameters = {};

    for my $attribute ( map { $meta->get_attribute($_) }
        sort $meta->get_attribute_list ) {

        if ( $attribute->does('R4ME::Meta::Attribute::Trait::QueryString')
            && $attribute->is_query_string ) {
            my $reader = $attribute->get_read_method;
            $parameters->{ $attribute->name } = $self->$reader;
        }

    }

    return $parameters;

}

sub _get_non_query_string_parameters {
    my $self = shift;

    my $meta = $self->meta;

    my $parameters = {};

    for my $attribute ( map { $meta->get_attribute($_) }
        sort $meta->get_attribute_list ) {

        if ( !$attribute->does('R4ME::Meta::Attribute::Trait::QueryString')
            || !$attribute->is_query_string ) {
            my $reader = $attribute->get_read_method;
            $parameters->{ $attribute->name } = $self->$reader;
        }

    }

    return $parameters;
}

sub _createHttpClient {
    my ( $self ) = @_;
    my $headers = { accept => 'application/json' };
    my $client = HTTP::Tiny->new( headers => $headers, timeout => $self->{_defaultTimeOut} );

    return $client;
}
1;

