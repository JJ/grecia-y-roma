#!/usr/bin/env perl

use strict;
use warnings;

use v5.16;

my $Dodona_E = 20.787778;
my $Dodona_x = 219.7979;
my $Rodas_E = 28.216667;
my $Rodas_x = 933.12402;
my $pixels_por_grado_x = ($Rodas_x - $Dodona_x)/($Rodas_E - $Dodona_E);


my $Bizancio_N = 41.013417;
my $Bizancio_y = 47.747601;
my $Esparta_N = 37.081944;
my $Esparta_y = 602.58618;

my $pixels_por_grado_y = ($Esparta_y - $Bizancio_y)/($Bizancio_N - $Esparta_N);




my ($N, $E, $nombre ) = @ARGV;

my $x = $Dodona_x + ($E - $Dodona_E)*$pixels_por_grado_x;
my $y = $Bizancio_y + ($Bizancio_N - $N)*$pixels_por_grado_y;

say <<EOC;
<circle id="circle_$nombre" r="3" cy="$y" cx="$x"/>
<g  id="g_$nombre"
    transform="translate(0.3,0.3)">
    <text
       style="font-size:12px;line-height:0%;font-family:Myriad-Roman"
       id="text$nombre"
       font-size="12"
       x="$x"
       y="$y">$nombre</text>
</g>
EOC


