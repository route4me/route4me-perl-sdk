package Route4MeManager;
use strict;
use warnings FATAL => 'all';

use HTTP::Tiny;
use JSON;
use Data::Dumper;
use URI;
use URI::QueryParam;
use R4MEInfrastructureSettings;
use Class::Struct;

sub new
{
    my $class = shift;
    my $self = {
        _apiKey         => shift,
        _defaultTimeOut => shift
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

    my $dataObject = $self->_request('POST', R4MEInfrastructureSettings->ApiHost, $content);

    my $response = JSON->new->decode( $dataObject->{'content'} );

    my $object = bless( $response, 'DataObject' );

    foreach my $address (@{$object->addresses})
    {
        $address = bless( $address, 'Address' );
    }

    foreach my $route (@{$object->routes}) {
        $route = bless( $route, 'DataObjectRoute');
        foreach my $routeAddress (@{$route->addresses})
        {
            $routeAddress = bless( $routeAddress, 'Address' );
        }
    }

    return $object;
}

sub addRouteDestinations {
    my ( $self, $route_id, $addresses, $errors ) = @_;

    my $optimizationParameters = OptimizationParameters->new(
        addresses => $addresses,
    );

    my $content = R4MeUtils->serializeObjectToJson( $optimizationParameters );

    my $dataObject = $self->_request('PUT', R4MEInfrastructureSettings->RouteHost, $content, {'route_id' => $route_id});

    my $response = JSON->new->decode( $dataObject->{'content'} );

    my $object = bless( $response, 'DataObject' );

    my @destinantionIds = ();

    foreach my $address (@{$object->addresses})
    {
        $address = bless( $address, 'Address' );
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

    my $dataObject = $self->_request('DELETE', R4MEInfrastructureSettings->GetAddress, undef,
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



sub _createHttpClient {
    my ( $self ) = @_;
    my $headers = { accept => 'application/json' };
    my $client = HTTP::Tiny->new( headers => $headers );

    return $client;
}
1;