package R4MeUtils;
use Moose;
use Moose::Meta::Class;

#use String::Escape;
use JSON -convert_blessed_universally;


sub serializeObjectToJson {
    my $self = shift;
    my $object = shift;
    my $json_obj = JSON->new->allow_blessed->convert_blessed;
    my $jsonString = $json_obj->encode( $object );
    return $jsonString;
}


1;