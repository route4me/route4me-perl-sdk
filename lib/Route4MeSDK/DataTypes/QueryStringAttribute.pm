package R4ME::Meta::Attribute::Trait::QueryString;
use strict;
use warnings FATAL => 'all';
use Moose::Role;
Moose::Util::meta_attribute_alias('QueryString');

has query_string => (
        is        => 'rw',
        isa       => 'Bool',
        predicate => 'is_query_string',
    );
1;