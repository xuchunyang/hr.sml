# hr in Standard ML

Inspired by [LuRsT](https://github.com/LuRsT)'s [hr](https://github.com/LuRsT/hr), but written in Standard ML instead.

## Installation

    $ mlton hr.sml
    $ cp hr ~/bin

## Usage

    $ hr
    ################################## # Till the end of your terminal window
    $

    $ hr '*'
    ********************************** # Till the end of your terminal window
    $

You can also make "beautiful" ASCII patterns

    $ hr - '#' -
    ----------------------------------
    ##################################
    ----------------------------------
    $ hr '-#-' '-' '-#-'
    -#--#--#--#--#--#--#--#--#--#--#--
    ----------------------------------
    -#--#--#--#--#--#--#--#--#--#--#--
