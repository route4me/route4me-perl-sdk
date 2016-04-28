package StatusUpdateType;
use strict;
use warnings FATAL => 'all';
use constant {
    Pickup                      => 'pickup',
    DropOff                     => 'dropoff',
    NoAnswer                    => 'noanswer',
    NotFound                    => 'notfound',
    NotPaid                     => 'notpaid',
    Paid                        => 'paid',
    WrongDelivery               => 'wrongdelivery',
    WrongAddressRecipient       => 'wrongaddressrecipient',
    NotPresent                  => 'notpresent',
    PartsMissing                => 'parts_missing',
    ServiceRendered             => 'service_rendered',
    FollowUp                    => 'follow_up',
    LeftInformation             => 'left_information',
    SpokeWithDecisionMaker      => 'spoke_with_decision_maker',
    SpokeWithDecisionInfluencer => 'spoke_with_decision_influencer',
    CompetitiveAccount          => 'competitive_account',
    ScheduledFollowUpMeeting    => 'scheduled_follow_up_meeting',
    ScheduledLunch              => 'scheduled_lunch',
    ScheduledProductDemo        => 'scheduled_product_demo',
    ScheduledClinicalDemo       => 'scheduled_clinical_demo',
    NoOpportunity               => 'no_opportunity'
};
1;