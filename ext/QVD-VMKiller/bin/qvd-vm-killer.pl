#!/usr/bin/perl

use strict;
use warnings;

use QVD::VMKiller;

QVD::VMKiller->kill_dangling_vms;
