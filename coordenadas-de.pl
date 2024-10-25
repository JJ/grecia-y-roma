#!/usr/bin/env perl

use strict;
use warnings;

use v5.16;

my $Olisipo_W = -9.133973;
my $Olisipo_x = 219.7979;
my $Singidunum_E = 20.46;
my $Singidunum_x = 1171.4069;
my $pixels_por_grado_x = ($Singidunum_x - $Olisipo_x)/($Singidunum_E - $Olisipo_W);

my $Lindum_N = 41.013417;
my $Lindum_y = 455.08661;
my $Leptis_N = 32.639167;
my $Leptis_y = 1544.0938;

my $pixels_por_grado_y = ($Lindum_y - $Leptis_y)/($Leptis_N - $Lindum_N);

my ($N, $E, $nombre ) = @ARGV;

my $x = $Olisipo_x + ($E - $Olisipo_W)*$pixels_por_grado_x;
my $y = $Lindum_y + ($Lindum_N - $N)*$pixels_por_grado_y;

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


