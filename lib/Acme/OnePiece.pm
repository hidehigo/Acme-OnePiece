package Acme::OnePiece;
use 5.008005;
use strict;
use warnings;

use IO::File;

our $VERSION = "0.01";

sub _options {
  return {}
}

sub new {
  my $class = shift;
  my $file = shift;
  my $options = $class->_options;

  my $io = IO::File->new($file, 'r') or die "Usage: Acme::OnePiece->new(\$filename)\n" . $!;
  my @lines = $io->getlines;
  my $contents = join('',@lines);
  $options->{contents} = $contents;

  my $self = bless $options, $class;
  return $self;
}

sub onepiece {
  my ($self) = @_;
  my $contents = $self->{contents};
  $contents =~ s/(\n|\s)//g;
  print $contents;
  return;
}

1;
__END__

=encoding utf-8

=head1 NAME

Acme::OnePiece - It's new $module

=head1 SYNOPSIS

    use Acme::OnePiece;

=head1 DESCRIPTION

Acme::OnePiece is ...

=head1 LICENSE

Copyright (C) hidehigo.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

hidehigo E<lt>hidehigo@cpan.orgE<gt>

=cut

