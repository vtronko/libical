#!/usr/bin/perl
# -*- Mode: perl -*-
#======================================================================
# FILE: Libical.pm
# CREATOR: eric 
#
# DESCRIPTION:
#   
#
#  $Id: Libical.pm,v 1.7 2001-03-02 21:33:54 ebusboom Exp $
#  $Locker:  $
#
# (C) COPYRIGHT 2000, Eric Busboom, http://www.softwarestudio.org
#
# This package is free software and is provided "as is" without express
# or implied warranty.  It may be used, redistributed and/or modified
# under the same terms as perl itself. ( Either the Artistic License or the
# GPL. ) 
#
#======================================================================

# This part of this file was automatically generated by SWIG

require Net::ICal::Libical::Component;
require Net::ICal::Libical::Property;
require Net::ICal::Libical::Time;

package Net::ICal::Libical;
require Exporter;
require DynaLoader;
@ISA = qw(Exporter DynaLoader);
package Net::ICal::Libical;
bootstrap Net::ICal::Libical;
var_Net__ICal__Libical_init();
@EXPORT = qw( );

$VERSION = "0.01";

1;




sub validate_component {
  my $comp_str = shift;
 

  my $c = Net::ICal::Libical::icalparser_parse_string($comp_str); 
  my $out;

  die "Failed to parse component" if !$c;

  my $r = Net::ICal::Libical::icalrestriction_check($c);
  
  $out = Net::ICal::Libical::icalcomponent_as_ical_string($c);

  Net::ICal::Libical::icalcomponent_free($c);

  return $out;

}


sub generate_occurrences {
  my $rule = shift;
  my $start = shift;
  my $count = shift;

  my @out;

  my $array = Net::ICal::Libical::icallangbind_new_array(25);

  Net::ICal::Libical::icalrecur_expand_recurrence($rule,$start,
						$count,$array);
		   
  for($i = 0; $i<$count; $i++){
    my $t = Net::ICal::Libical::icallangbind_access_array($array,$i);
    if($t != 0) {
      push(@out,$t);
    }

  }

  Net::ICal::Libical::icallangbind_free_array($array);

  return @out;
}


# The remaining code is just the interface declarations for a complete
# perl binding to libical. Currently, it is looking for an author....


           


1;

__END__

#""" Represent iCalendar DATE, TIME and DATE-TIME ""

package Net::ICal::Libical::Time;
@ISA = (Property);

sub new {}

#"""Updates value and value_type based on the (internal) self.tt."""
sub _update_value { }

# " Return true if this is a valid time "
sub valid { }

# """ Return or set time in seconds past POSIX epoch"""
sub utc_seconds {}

# """ Return or set boolean indicating if time is in UTC """ 
sub is_utc {}

# Get/Set booll indicating is time is a date
sub is_date(self,v=None):

#"" Return or set the timezone string for this time """
sub timezone {}

#"" Get or set the seconds component of this time """
sub second {}
sub minute {}
sub hour {}
sub day {}
sub month {}
sub year {}

# How dow you over load +,- in perl?

# Add duration to time = time
sub __add__{}

# Subtract time from time = duration
# Subtract duration from time = time
sub __sub__(self,o):


package Net::ICal::Libical::Duration(Property):
@ISA = (Property);

sub new {}
sub _update_value {}
#"Return true if this is a valid duration"
sub valid {}
# """Return or set duration in seconds"""
sub seconds {}


#"""Represent a span of time"""

package Net::ICal::Libical::Period;
@ISA = (Property);

sub new{}

sub _end_is_duration {}
sub _end_is_time {}
sub _update_value {}

#"Return true if this is a valid period"
sub valid {}

#Return or set start time of the period. The start time may be
#expressed as an RFC2445 format string or an instance of Time.
#The return value is an instance of Time
sub start {}

#Return or set end time of the period. The end time may be
#expressed as an RFC2445 format string or an instance of Time.
#The return value is an instance of Time.

#If the Period has a duration set, but not an end time, this
#method will caluculate the end time from the duration. 
sub end {}

#Return or set the duration of the period. The duration may be
#expressed as an RFC2445 format string or an instance of Duration.
#The return value is an instance of Duration.
#If the period has an end time set, but not a duration, this
#method will calculate the duration from the end time.  
sub duration{}

# Get set the timezone for the period. Basically returns self->dict{TZID}
sub timezone(self,v=None):


# Represents the value and all parameters of an attendee
package Net::ICal::Libical::Attendee(Property):
@ISA = (Property);

sub new{}

# Methods for accessing enumerated parameters
sub cn {}
sub cutype {}
sub dir {}
sub delegated_from {}
sub delegated_to {}
sub language {}
sub member {}
sub partstat {}
sub role {}
sub rsvp {}
sub sent_by {}


package Net::ICal::Libical::Organizer;
@ISA = (Property)
# Methods for accessing enumerated parameters
sub cn{}
sub dir{}
sub language {}
sub sent_by {}

package Net::ICal::Libical::Recurrence_Id;
@ISA= (Property)

package Net::ICal::Libical::Attach;
@ISA= (Property)
        
package Net::ICal::Libical::Event;
@ISA= (Component)

sub component_type {}

#"Returns a copy of the object."
sub clone {}

#Sets or returns the value of the DTEND property.
#Usage:
#dtend(time_obj)             # Set the value using a Time object
#dtend('19970101T123000Z')   # Set the value as an iCalendar string
#dtend(982362522)            # Set the value using seconds (time_t)
#dtend()                     # Return a Time
#
#If the dtend value is being set and duration() has a value, the
#duration property will be removed.
sub dtend{}

#Sets or returns the value of the duration property.
#Usage:
#duration(dur_obj)       # Set the value using a Duration object
#duration("P3DT12H")     # Set value as an iCalendar string
#duration(3600)          # Set duration using seconds
#duration()              # Return a duration
#
#If the duration value is being set and dtend() has a value, the dtend
#property will be removed.
sub duration{}
 
#Sets attendees or returns a list of Attendee objects.
sub attendees {}

#Sets or gets the value of the ORGANIZER property.
#Usage:
#organizer(orgObj)              # Set value using an organizer object
#organizer('MAILTO:jd@not.com') # Set value using a CAL-ADDRESS string
#organizer()                    # Return a CAL-ADDRESS string
sub organizer{}

#"Sets or gets the SUMMARY value of the Event."
sub summary{}

#Sets or gets the UID of the Event.
sub uid{}

#Sets or gets the value for the RECURRENCE-ID property.
#Usage:
#Recurrence_id(recIdObj)             # Set using a Recurrence_Id object
#Recurrence_id("19700801T133000")    # Set using an iCalendar string
#Recurrence_id(8349873494)           # Set using seconds from epoch
#Recurrence_id()                     # Return a Time
sub recurrence_id{}

#Sets or gets the SEQUENCE value of the Event.
#Usage:
#sequence(1)     # Set the value using an integer
#sequence('2')   # Set the value using a string containing an integer
#sequence()      # Return an integer       
sub sequence{}
  
#Sets or returns the value of the LAST-MODIFIED property.
#Usage:
#lastmodified(time_obj)          # Set the value using a Time object
#lastmodified('19970101T123000Z')# Set using an iCalendar string
#lastmodified(982362522)         # Set using seconds 
#lastmodified()                  # Return a Time
sub lastmodified{}



#Sets or returns the value of the CREATED property.
#Usage:
#created(time_obj)           # Set the value using a Time object
#created('19970101T123000Z') # Set using an iCalendar string
#created(982362522)          # Set using seconds 
#created()                   # Return a Time
sub created {}


sub related_to{}
sub comment{}

"Sets or returns the value of the DESCRIPTION property."

sub description {}

#Sets categories or returns a list of Attendee objects.
sub categories {}

sub attach{}

#Represents a set of event occurrences. This
#package controls a component's RRULE, EXRULE, RDATE and EXDATE
#properties and can produce from them a set of occurrences. 
package Net::ICal::Libical::RecurrenceSet: 


#Include a date or rule to the set. 
#Use date= or pass in a
#Time instance to include a date. Included dates will add an
#RDATE property or will remove an EXDATE property of the same
#date.
#Use rule= or pass in a string to include a rule. Included
#rules with either add a RRULE property or remove an EXRULE
#property.

sub include{}

#Exclude date or rule to the set. 
#Use date= or pass in a Time instance to exclude a
#date. Excluded dates will add an EXDATE property or will remove
#an RDATE property of the same date.
#Use rule= or pass in a string to exclude a rule. Excluded
#rules with either add an EXRULE property or remove an RRULE
#property.
sub exclude{}

#Return 'count' occurrences as a tuple of Time instances.
sub occurrences{}

package Net::ICal::Libical::Store;
sub new{}
sub path{}
sub mark{}
sub commit{} 
sub addComponent{}
sub removeComponent{}
sub countComponents{}
sub select{}
sub clearSelect{}
sub fetch{}
sub fetchMatchK{}
sub modify{}
sub currentComponent{}
sub firstComponent{}
sub nextComponent{}


package Net::ICal::Libical::FileStore;
@ISA = (Store)
sub new{}
sub path{}
sub mark{}
sub commit{} 
sub addComponent{}
sub removeComponent{}
sub countComponents{}
sub select{}
sub clearSelect{}
sub fetch{}
sub fetchMatchK{}
sub modify{}
sub currentComponent{}
sub firstComponent{}
sub nextComponent{}


1;
